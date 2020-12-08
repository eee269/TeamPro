package action.order;

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
		int num =  Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("imp_uid");

		OrderProService orderProService = new OrderProService();
		boolean isInsertSuccess = orderProService.insertDetailOrder(num,code);
		
		if(!isInsertSuccess) {
			System.out.println("디테일 오더 생성 실패");
		} else {
			forward = new ActionForward();
			forward.setPath("MyOrderList.or");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
