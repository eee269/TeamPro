package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.cart.cartAllDeleteService;
import vo.ActionForward;

public class cartAllDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartAllDeleteAction");
		ActionForward forward = null;
		
		String member_id = request.getParameter("member_id");
		
		int num = Integer.parseInt(request.getParameter("num"));

		cartAllDeleteService cartAllDeleteService = new cartAllDeleteService();
		
		boolean isAllDeleteSucess = cartAllDeleteService.isCartAllDelete(member_id , num);
		
		if(!isAllDeleteSucess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('삭제 실패!')");
			out.print("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('장바구니를 비웁니다')");
			out.print("</script>");
			
			forward = new ActionForward();
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
			
		}
				
		
		return forward;
	}

	
}
