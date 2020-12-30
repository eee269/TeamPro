package action.order;

import java.io.PrintWriter;
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
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
		String[] nums = request.getParameterValues("chk");
		
		
		for(String str : nums) {
			System.out.println("액션에서의 : "+str);
		}
		OrderService orderService = new OrderService();
		
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		cartList = orderService.getSelectCart(nums);

		forward = new ActionForward();
		forward.setPath("/order/order.jsp");
		request.setAttribute("cartList", cartList);
		}
		return forward;
	}

}
