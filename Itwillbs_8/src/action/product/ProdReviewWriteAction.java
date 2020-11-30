package action.product;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.ProdReviewWriteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품 리뷰 등록
		System.out.println("ProdReviewWriteAction");
		
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		String saveFolder = "product/reviewUploadImg";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024 * 1024 * 10; // 10mb
		
		MultipartRequest multi = new MultipartRequest(
				request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		// 전달할 데이터 저장
		ProdReviewBean prodReviewBean = new ProdReviewBean();
		prodReviewBean.setStarScore(Integer.parseInt(multi.getParameter("starScore")));
		prodReviewBean.setProduct_basicCode(multi.getParameter("product_basicCode"));
		prodReviewBean.setMember_id(multi.getParameter("member_id"));
		prodReviewBean.setProduct_img(multi.getOriginalFileName("product_img"));
		prodReviewBean.setContent(multi.getParameter("content"));
		
		
		ProdReviewWriteService prodReviewService = new ProdReviewWriteService();
		
		boolean isReviewSuccess = prodReviewService.registReview(prodReviewBean);
		if(!isReviewSuccess) {
			// 리뷰 등록 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('리뷰 등록 실패!')"); 
			out.println("history.back()"); 
			out.println("</script>"); 
		}else {
			// 리뷰 등록 성공
			forward = new ActionForward();
			forward.setPath("ProductDetail.po?basicCode="+multi.getParameter("product_basicCode"));
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}
