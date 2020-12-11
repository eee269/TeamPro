package controller.address;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.address.AddrAction;
import action.address.DefaultAddrAction;
import action.address.RecentAddrAction;
import vo.ActionForward;
@WebServlet("*.ad")
public class AddressController extends HttpServlet{
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();
		
		if(command.equals("/Addr.ad")) {
			System.out.println("Addr.ad 포워딩");
			forward = new ActionForward();
			action = new AddrAction();
			
			try {
				System.out.println("AddrAction으로 포워딩");
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("AddrAction으로 포워딩 중 오류! -" +e.getMessage());
				e.printStackTrace();
			}
		} else if(command.equals("/DefaultAddr.ad")) {
			System.out.println("DefaultAddr.ad 포워딩");
			forward = new ActionForward();
			action = new DefaultAddrAction();
			
			try {
				System.out.println("DefaultAddrAction으로 포워딩");
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("DefaultAddrAction으로 포워딩 중 오류 - " +e.getMessage());
				e.printStackTrace();
			} 
		} else if(command.equals("/RecentAddr.ad")) {
			System.out.println("RecentAddr.ad 포워딩");
			forward = new ActionForward();
			action = new RecentAddrAction();
			try {
				System.out.println("RecentAddrAction으로 포워딩");
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("RecentAddrAction으로 포워딩 중 오류 - " +e.getMessage());
				e.printStackTrace();
			}
		}
		
		// ------------------------------ 공통적으로 수행할 포워딩 -------------------
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		// ------------------------------ 공통적으로 수행할 포워딩 끝 -------------------

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
