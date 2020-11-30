package controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.member.ControlMemberListAction;
import action.order.ControlOrderListAction;
import action.order.DeleteMainorderAction;
import action.order.OrderProAction;
import action.order.UpdateOrderStatusAction;
import vo.ActionForward;

@WebServlet("*.or")
public class OrderFrontController extends HttpServlet {
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();

		if (command.equals("/Order.or")) {
			forward = new ActionForward();
			forward.setPath("/cart/order.jsp");
		} else if (command.equals("/OrderPro.or")) {
			forward = new ActionForward();
			action = new OrderProAction();

			try {
				System.out.println("OrderProAction으로 포워딩");
				forward = action.execute(request, response);

			} catch (Exception e) {
				System.out.println("OrderProAction으로 포워딩 중 오류! - " + e.getMessage());
				e.printStackTrace();
			}

		}

		// -------------------------주문 관리 페이지--------------------------------
		else if (command.equals("/ControlOrderList.or")) {
			forward = new ActionForward();

			action = new ControlOrderListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("OrderListAction으로 포워딩 중 오류! - " + e.getMessage());

				e.printStackTrace();
			}
		}
		// -------------------------주문 상태 변경--------------------------------
		else if (command.equals("/UpdateOrderStatus.or")) {
			forward = new ActionForward();

			action = new UpdateOrderStatusAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("UpdateOrderStatusAction으로 포워딩 중 오류! - " + e.getMessage());

				e.printStackTrace();
			}
		}
		// -------------------------주문 상태 변경--------------------------------
		else if (command.equals("/DeleteMainorder.or")) {
			forward = new ActionForward();

			action = new DeleteMainorderAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("UpdateOrderStatusAction으로 포워딩 중 오류! - " + e.getMessage());

				e.printStackTrace();
			}
		}
		// ------------공통적으로 수행할 포워딩 작업----------------
		if (forward != null) {

			if (forward.isRedirect()) {
				// Redirect 방식일 경우
				response.sendRedirect(forward.getPath());
			} else {
				// Dispatcher 방식일 경우
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		// ------------공통적으로 수행할 포워딩 작업----------------

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
