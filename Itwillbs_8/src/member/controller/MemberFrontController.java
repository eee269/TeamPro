package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.action.ControlMemberAction;
import member.vo.ActionForward;

@WebServlet("*.mo")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();
		
		if(command.equals("/MemberJoinForm.mo")) {
			forward = new ActionForward();
			forward.setPath("/member/join_complete.jsp");
		} else if(command.equals("/ControlMember.mo")) {
			forward = new ActionForward();
			
			action = new ControlMemberAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
