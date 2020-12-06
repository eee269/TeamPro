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
//		request.setAttribute("num", Integer.parseInt(request.getParameter("chk")));
		System.out.println("OrderProAction!");
		ActionForward forward = null;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		OrderBean ob = new OrderBean();
		ob.setCode(request.getParameter("imp_uid"));
		ob.setName(request.getParameter("buyer_name"));
		ob.setPhone(request.getParameter("buyer_tel"));
		ob.setAddress(request.getParameter("buyer_addr"));
		ob.setStatus("결제완료");
		ob.setPayment(request.getParameter("pay_method"));
		ob.setMember_id("test");
		ob.setDate(date);
		ob.setTotal_price(Integer.parseInt(request.getParameter("paid_amount")));
		System.out.println("OrderPro에서 : "+ob.getCode());
		System.out.println("OrderPro에서 : "+ob.getName());
		System.out.println("OrderPro에서 : "+ob.getPhone());
		System.out.println("OrderPro에서 : "+ob.getAddress());
		System.out.println("OrderPro에서 : "+ob.getStatus());
		System.out.println("OrderPro에서 : "+ob.getPayment());
		System.out.println("OrderPro에서 : "+ob.getMember_id());
		System.out.println("OrderPro에서 : "+ob.getDate());
		System.out.println("OrderPro에서 : "+ob.getTotal_price());

		
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
			forward.setPath("OrderDetail.or");
		}
		
		
		return forward;
	}

}
