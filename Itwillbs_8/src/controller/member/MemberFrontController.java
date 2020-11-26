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
import action.member.MemberDeleteAction;
import action.member.MemberLoginProAction;
import action.product.ControlProductListAction;
import vo.ActionForward;

@WebServlet("*.mo")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();
		
		if(command.equals("/MemberLoginForm.mo")) {
			forward = new ActionForward();
			forward.setPath("/member/login.jsp");
		} else if(command.equals("/MemberLoginPro.mo")) {
			forward = new ActionForward();
			
			action = new MemberLoginProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		// -------------전체 멤버 리스트 보기----------------
		else if(command.equals("/ControlMemberList.mo")) {
			forward = new ActionForward();
			
			action = new ControlMemberListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} 
		
		// -------------회원 삭제(탈퇴)----------------
		else if(command.equals("/MemberDelete.mo")) {
			forward = new ActionForward();
			
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// ------------공통적으로 수행할 포워딩 작업----------------
		if(forward != null) {
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		// ------------공통적으로 수행할 포워딩 작업----------------
		
	}
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
