package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.cart.cartDeleteService;
import vo.ActionForward;

public class cartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartDeleteAction");
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		cartDeleteService cartDeleteService = new cartDeleteService();
		boolean isDeleteSucess = cartDeleteService.isCartDelete(num);
		
		if(!isDeleteSucess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
			
		} else {
			
			forward = new ActionForward();
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
