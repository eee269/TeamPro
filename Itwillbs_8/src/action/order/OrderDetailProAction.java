package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.OrderProService;
import vo.ActionForward;

public class OrderDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderDetailProAction!");
		ActionForward forward = null;
		int num =  Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("imp_uid");

		OrderProService orderProService = new OrderProService();
		boolean isInsertSuccess = OrderProService.insertDetailOrder(num,code);
		
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
