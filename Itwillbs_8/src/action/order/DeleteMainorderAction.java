package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.DeleteMainorderService;
import vo.ActionForward;

public class DeleteMainorderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String code = request.getParameter("code");
		
		DeleteMainorderService deleteService = new DeleteMainorderService();
		boolean isDelete = deleteService.deleteMainorder(code);
		
		if(!isDelete) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('주문 취소 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlOrderList.or");
		}
		
		return forward;
	}

}
