package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.UpdateOrderStatusService;
import vo.ActionForward;

public class UpdateOrderStatusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		} else if (!member_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('접근 권한이 없습니다.')");
			out.println("</script>");
			
			forward.setPath("Main.go");
		} else {
		String code = request.getParameter("code");
		String status = request.getParameter("status");
				
		UpdateOrderStatusService updateService = new UpdateOrderStatusService();
		boolean isUpdate = updateService.updateOrderStatus(code, status);
		
		if(!isUpdate) {

			out.println("<script>");
			out.println("alert('상태 변경 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlOrderList.or");
			forward.setRedirect(true);
		}
		}
		return forward;
	}

}
