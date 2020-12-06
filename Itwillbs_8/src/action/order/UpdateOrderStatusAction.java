package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.UpdateOrderStatusService;
import vo.ActionForward;

public class UpdateOrderStatusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String code = request.getParameter("code");
		String status = request.getParameter("status");
				
		UpdateOrderStatusService updateService = new UpdateOrderStatusService();
		boolean isUpdate = updateService.updateOrderStatus(code, status);
		
		if(!isUpdate) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('상태 변경 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlOrderList.or");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
