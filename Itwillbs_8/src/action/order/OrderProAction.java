package action.order;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.order.OrderDAO;
import svc.order.OrderProService;
import vo.ActionForward;
import vo.OrderBean;

public class OrderProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderProAction!");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		ActionForward forward = null;
		Timestamp date = new Timestamp(System.currentTimeMillis());
		OrderBean ob = new OrderBean();
		ob.setCode(request.getParameter("imp_uid"));
		ob.setName(request.getParameter("buyer_name"));
		ob.setPhone(request.getParameter("buyer_tel"));
		ob.setAddress(request.getParameter("buyer_addr"));
		ob.setStatus("결제완료");
		ob.setPayment(request.getParameter("pay_method"));
		ob.setMember_id(member_id);
		ob.setDate(date);
		ob.setTotal_price(Integer.parseInt(request.getParameter("paid_amount")));

//		System.out.println(ob.getCode());
//		System.out.println(ob.getName());
//		System.out.println(ob.getPhone());
//		System.out.println(ob.getAddress());
//		System.out.println(ob.getStatus());
//		System.out.println(ob.getPayment());
//		System.out.println(ob.getMember_id());
//		System.out.println(ob.getDate());

		
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
