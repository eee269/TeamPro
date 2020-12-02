package action.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.cart.CartListService;
import vo.ActionForward;
import vo.Cart;
import vo.PageInfo;

public class cartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartListAction");
		
		String member_id = request.getParameter("member_id");
		
		ActionForward forward = null;
		
		CartListService cartListService = new CartListService();
		
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		cartList = cartListService.getCartList(member_id);
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("member_id", member_id);
		
		forward = new ActionForward();
		forward.setPath("/cart/cart.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
