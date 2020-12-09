package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.cart.CartUpdateService;
import vo.ActionForward;

public class cartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartUpdateAction");
		ActionForward forward = null;
		
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		CartUpdateService cartUpdateService = new CartUpdateService();
		
		boolean isUpdateSuccess= cartUpdateService.isCartUpdate(num, cnt);
		
		if(!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('업데이트 실패!')");
			out.println("history.back()");
			out.println("</script>");
	
		} else {
			forward = new ActionForward();
			forward.setPath("Cart.ca?member_id=dodo");
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}
