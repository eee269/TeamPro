package action.member;

import java.io.PrintWriter;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import exception.member.LoginException;
import svc.member.MemberLoginProService;
import vo.ActionForward;


public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("</script>");
			
			forward = new ActionForward();
			forward.setPath("Main.go");
			forward.setRedirect(true);
		} else {

			MemberLoginProService memberLoginProService = new MemberLoginProService();
			
			try {
				boolean isMember = memberLoginProService.isLoginMember(id, pass);
				
				if(isMember) {
					session.setAttribute("member_id", id);
									
					forward = new ActionForward();
					forward.setPath("Main.go"); 
				}
				
	
			} catch (LoginException e) { 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('" + e.getMessage() + "')"); // 실패 메세지 출력
				out.println("history.back()");
				out.println("</script>");
			}
		}
		return forward;
	}

}