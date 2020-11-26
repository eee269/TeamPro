package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.DeleteMemberService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		
		DeleteMemberService deleteMemberService = new DeleteMemberService();
		
		boolean isDelete = deleteMemberService.deleteMember(id);
		
		if(!isDelete) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('회원 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlMemberList.mo");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
