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
//		
//		ServletContext context = request.getServletContext();
//		String saveFolder = "member/memberUpload";
//		String realFolder = context.getRealPath(saveFolder);
//		int fileSize = 1024 * 1024 * 10;
//		
//		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
//		
//		String id = multi.getParameter("id");
//		String pass = multi.getParameter("pass");
//		
//		
//		
//		
		MemberLoginProService memberLoginProService = new MemberLoginProService();
		
		try {
			boolean isMember = memberLoginProService.isLoginMember(id, pass);
			
			if(isMember) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
								
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
		
		return forward;
	}

}