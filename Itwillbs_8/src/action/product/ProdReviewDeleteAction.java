package action.product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommDeleteProService;
import svc.product.ProdReviewDeleteService;
import vo.ActionForward;

public class ProdReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		String basicCode = request.getParameter("basicCode");
		
		ProdReviewDeleteService prodReviewDeleteService = new ProdReviewDeleteService();
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
			// 삭제 성공 시
			forward = new ActionForward();
			forward.setPath("ProductDetail.po?basicCode="+basicCode);
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
