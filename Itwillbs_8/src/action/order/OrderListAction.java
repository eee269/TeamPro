package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.OrderListService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyOrderListAction!");
		ActionForward forward = null;
		
		OrderListService orderListService = new OrderListService();
		
		ArrayList<OrderBean> orderList = new ArrayList<OrderBean>();
		
		orderList = orderListService.getOrderList();
		
		request.setAttribute("orderList", orderList);
		forward = new ActionForward();
		forward.setPath("/order/myorder.jsp");
		
		return forward;
	}

}
