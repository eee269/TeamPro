package action.order;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import action.Action;
import svc.order.OrderListService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyOrderListAction!");
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
		
			OrderListService orderListService = new OrderListService();
			
			ArrayList<OrderBean> orderList = new ArrayList<OrderBean>();
			
			orderList = orderListService.getOrderList(member_id);
			
			request.setAttribute("orderList", orderList);
	
			forward.setPath("/order/myorder.jsp");
		}
		
		return forward;
	}

}
