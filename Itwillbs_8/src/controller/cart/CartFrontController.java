package controller.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

/**
 * Servlet implementation class BasketFrontController
 */
@WebServlet("*.ca")
public class CartFrontController extends HttpServlet {
      
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 서블릿 주소 가져오기
		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : "+command);
		
		// 각 요청 처리에 필요한 객체를 다루는 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		// if문을 사용하여 각 서블릿 주소 판별 및 각 요청 처리를 위한 작업 요청
				if(command.equals("/Cart.ca")) {
					/*
					 * 글쓰기 페이지에 대한 요청은 비즈니스 로직 없이
					 * View 페이지(JSP)로 바로 포워딩 수행
					 * - 기존 서블릿 주소가 그대로 유지되어야 하므로 Dispathcer 방식 포워딩
					 * 	 => ActionForward 객체에 redirect 변수값을 false 로 설정
					 *      (boolean 타입 기본 값이 false 이므로 별도 설정 필요 없음)
					 *   => 따라서, 포워딩 주소만 지정
					 * - 포워딩 주소 : board 폴더 내의 qna_board_write.jsp
					 */
					// 1. ActionForward 객체 생성(변수는 이미 선언되어 있음)
					forward = new ActionForward();
					// 2. 포워딩 경로 설정
					forward.setPath("/cart/cart.jsp");
					// 3. 포워딩 방식 설정(Dispatcher 방식)
				}
					
				
		// ------------공통적으로 수행할 포워딩 작업----------------
		if(forward != null) {
			
			if(forward.isRedirect()) {
				// Redirect 방식일 경우
				response.sendRedirect(forward.getPath());
			}else {
				// Dispatcher 방식일 경우
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
