package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.OrderService;
import vo.ActionForward;
import vo.Cart;

public class OrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAction!");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
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
