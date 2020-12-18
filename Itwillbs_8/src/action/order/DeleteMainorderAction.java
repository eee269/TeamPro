package action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.DeleteMainorderService;
import vo.ActionForward;

public class DeleteMainorderAction implements Action {

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
		} else {
		String code = request.getParameter("code");
		
		DeleteMainorderService deleteService = new DeleteMainorderService();
		boolean isDelete = deleteService.deleteMainorder(code);
		
		if(!isDelete) {
			out.println("<script>");
			out.println("alert('주문 취소 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlOrderList.or");
		}
		}
		return forward;
	}

}
