package action.order;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.order.OrderDAO;
import svc.order.OrderProService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAction!");
		ActionForward forward = null;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		OrderBean ob = new OrderBean();
		OrderDAO orderDAO = OrderDAO.getInstance();
		ob.setCode(orderDAO.createOrderCode());
		ob.setName(request.getParameter("sender"));
		ob.setPhone(request.getParameter("emergency11"));
		ob.setAddress(request.getParameter("address1"));
		ob.setStatus("결제완료");
		ob.setPayment("무통장");
		ob.setMember_id("test");
		ob.setDate(date);
		
		OrderProService orderService = new OrderProService();
		
		boolean isInsertSuccecc = orderService.InsertOrder(ob);
		
		if(!isInsertSuccecc) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('주문 등록 실패");
			out.println("history.back()");
			out.println("</script>");

		} else {
			forward = new ActionForward();
			forward.setPath("/cart/myorder.jsp");
		}
		
		
		return forward;
	}

}
