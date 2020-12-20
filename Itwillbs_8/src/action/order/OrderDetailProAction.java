package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.OrderProService;
import vo.ActionForward;

public class OrderDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailProAction!");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		ActionForward forward = null;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		}else {
//		int num =  Integer.parseInt(request.getParameter("num"));
//		System.out.println("num : "+num);
		String[] nums = request.getParameterValues("num");
		String code = request.getParameter("imp_uid");

		for(String str : nums) {
			System.out.println("orderDetailProAction : "+str);
		}
		
		OrderProService orderProService = new OrderProService();
		boolean isInsertSuccess = orderProService.insertDetailOrder(nums,code);
		
		if(!isInsertSuccess) {
			System.out.println("디테일 오더 생성 실패");
		} else {
			forward = new ActionForward();
			forward.setPath("MyOrderList.or");
			forward.setRedirect(true);
		}
		}
		
		return forward;
	}

}
