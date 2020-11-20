package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.member.ControlMemberListAction;
import vo.ActionForward;

@WebServlet("*.mo")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();
		
		if(command.equals("/MemberJoinForm.mo")) {
			forward = new ActionForward();
			forward.setPath("/member/login.jsp");
			
		} else if(command.equals("/ControlMember.mo")) {
			forward = new ActionForward();
			
			action = new ControlMemberListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} 
		
		if(forward != null) {
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		// 기본 설정 후 공통적으로 수행할 포워딩작업
			// 1. ActionForward 객체 존재 여부 판별
			if(forward != null ) {
				// 2. ActionForward 객체 내의 포워딩 방식에 따라 각각의 포워딩 수행
				// -> Redirect 방식: isRedirect() == true
				// -> Dispatcher 방식: isRedirect() == false
				if(forward.isRedirect()) {
					// 3. Redirect 방식일 경우
					// response 객체의 sendRedirect() 메서드를 호출하여 포워딩
					// -> 파라미터: 포워딩할 URL
					response.sendRedirect(forward.getPath());
				} else {
					// 4. Dispatcher 방식일 경우
					// 4-1. response 객체의 getRequestDispatcher() 메서드를 호출하여
					// RequestDispatcher 객체를 리턴받기
					// -> 파라미터: 포워딩할 URL
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					// 4-2. RequestDispatcher 객체의 forward() 메서드를 호출하여
					// 		포워딩 수행(파라미터: request, response 객체)
					dispatcher.forward(request, response);
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
