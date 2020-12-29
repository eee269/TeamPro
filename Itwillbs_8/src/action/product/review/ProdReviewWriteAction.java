package action.product.review;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.review.ProdReviewWriteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품 리뷰 등록
		System.out.println("ProdReviewWriteAction");
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("member_id");
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/upload/prodReviewUpload";
		
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
		prodReviewBean.setProduct_basicCode(multi.getParameter("basicCode"));
		prodReviewBean.setMember_id(id);
		prodReviewBean.setProduct_img(multi.getFilesystemName("prw_file"));
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
		
		return null;
	}
	
}
