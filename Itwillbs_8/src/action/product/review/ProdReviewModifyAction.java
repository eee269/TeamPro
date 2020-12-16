package action.product.review;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.review.ProdReviewWriteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품 리뷰 수정
		System.out.println("ProdReviewModifyAction");
		
		// 파일 저장
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
		prodReviewBean.setContent(multi.getParameter("content"));
		prodReviewBean.setProduct_img(multi.getOriginalFileName("prm_file"));
		int num = Integer.parseInt(multi.getParameter("prm_num"));
		ProdReviewWriteService prodReviewService = new ProdReviewWriteService();
		
		boolean isReviewSuccess = prodReviewService.modifyReview(prodReviewBean, num);
		
		if(!isReviewSuccess) {
			// 리뷰 등록 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('리뷰 등록 실패!')"); 
			out.println("history.back()"); 
			out.println("</script>"); 
		}
		
		return null;
	}

}
