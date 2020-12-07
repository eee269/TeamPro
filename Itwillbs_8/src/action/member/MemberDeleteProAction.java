package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.DeleteMemberService;
import vo.ActionForward;

public class MemberDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("member_id");
		String pass = request.getParameter("password");

		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			if(id.equals("admin")) {
				id = request.getParameter("id");
			}
			DeleteMemberService deleteMemberService = new DeleteMemberService();
			
			boolean isDelete = deleteMemberService.deleteMember(id, pass);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(!isDelete) {
				out.println("<script>");
				out.println("alert('회원 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				session.invalidate();
				forward.setPath("Main.go");
				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
