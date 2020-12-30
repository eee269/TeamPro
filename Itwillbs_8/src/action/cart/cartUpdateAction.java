package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cart.CartUpdateService;
import vo.ActionForward;

public class cartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartUpdateAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("MemberLoginForm.mo");
		} else {
		
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(cnt + ", " +  num);
		
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
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
		}
		}
		return forward;
	}
	
}
