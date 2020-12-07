package action.cart;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cart.CartListService;
import vo.ActionForward;
import vo.Cart;
import vo.PageInfo;

public class cartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartListAction");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			
			CartListService cartListService = new CartListService();
			
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			cartList = cartListService.getCartList(member_id);
			
			request.setAttribute("cartList", cartList);
			
			forward = new ActionForward();
			forward.setPath("/cart/cart.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
