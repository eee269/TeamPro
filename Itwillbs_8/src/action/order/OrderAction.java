package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.OrderService;
import vo.ActionForward;
import vo.Cart;

public class OrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAction!");
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("chk"));
		
		System.out.println("OrderAction에서 : " +num);
		
		OrderService orderService = new OrderService();
		
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		cartList = orderService.getSelectCart(num);
		
		request.setAttribute("cartList", cartList);
		
		forward = new ActionForward();
		forward.setPath("/order/order.jsp");
		
		return forward;
	}

}
