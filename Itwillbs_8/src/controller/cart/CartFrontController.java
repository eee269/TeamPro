package controller.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.cart.cartDeleteAction;
import action.cart.cartListAction;
import action.cart.cartUpdateAction;
import vo.ActionForward;


@WebServlet("*.ca")
public class CartFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 요청에 한글 처리
		request.setCharacterEncoding("UTF-8");

		// 서블릿 주소 가져오기
		String command = request.getServletPath();

		// 필요한 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		
		if(command.equals("/Cart.ca")) {
			System.out.println("컨트롤러 - Cart.cart 로 포워딩");
			
			action = new cartListAction();
			
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				System.out.println("List컨트롤러 에러" + e.getMessage());
				e.printStackTrace();
		
			} finally {
				
			}
			
		} else if(command.equals("/CartDelete.ca")) {
			System.out.println("컨트롤러 - CartDelete");
			
			action = new cartDeleteAction();
			
			try {
				forward = action.execute(request, response);
				//forward.setPath("/Cart.cart");
			} catch (Exception e) {
				System.out.println("CartDelete" + e.getMessage());
				e.printStackTrace();
			}
	
		} else if(command.equals("/CartUpdate.ca")) {
			System.out.println("컨트롤러 - CartUpdate");
			
			action = new cartUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("CartUpdate ->: " + e.getMessage());
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

		// ------------------------------ 공통적으로 수행할 포워딩 -------------------
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
