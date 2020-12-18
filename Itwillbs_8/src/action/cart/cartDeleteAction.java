package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cart.cartDeleteService;
import vo.ActionForward;

public class cartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartDeleteAction");
		ActionForward forward = null;
		
		String[] num = request.getParameterValues("chk");
		
		cartDeleteService cartDeleteService = new cartDeleteService();
			
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		}
		
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
