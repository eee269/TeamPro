package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.MemberDupService;
import vo.ActionForward;

public class MemberDupCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		
		MemberDupService memberDupService = new MemberDupService();
		boolean isDup=memberDupService.dupMember(id);
		
	if(!isDup) {
			
			
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('아이디사용가능')");
		out.println("history.back()");
		out.println("</script>");
			
			
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디중복')");
			out.println("history.back()");
			out.println("</script>");
		}
			
		
		return forward;
	}
}
