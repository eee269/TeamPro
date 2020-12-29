package action.product.review;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.review.ProdReviewDeleteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		String basicCode = request.getParameter("basicCode");
		
		ProdReviewDeleteService prodReviewDeleteService = new ProdReviewDeleteService();
		ProdReviewBean prodReviewBean = prodReviewDeleteService.getReview(num);
		boolean isDeleteSuccess = prodReviewDeleteService.removeArticle(num);
		
		if(!isDeleteSuccess) {
			// 삭제 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 삭제 실패!!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			ServletContext context = request.getServletContext();
			
			//db 데이터 삭제 성공 시 실제 저장된 이미지 삭제
			String saveFolder = "upload/prodReviewUpload";
			String realFolder = context.getRealPath(saveFolder);
			
			String img = prodReviewBean.getProduct_img();
			File f = new File(realFolder + "/" + img);
			if(f.exists()) {f.delete();}
			
			
		}
		
		return null;
	}

}
