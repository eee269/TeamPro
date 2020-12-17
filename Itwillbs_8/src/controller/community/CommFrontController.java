package controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.community.CommBookCountAction;
import action.community.CommBookAction;
import action.community.CommDeleteProAction;
import action.community.CommDetailAction;
import action.community.CommListAction;
import action.community.CommModifyFormAction;
import action.community.CommModifyProAction;
import action.community.CommReDeleteProAction;
import action.community.CommReListProAction;
import action.community.CommReModifyProAction;
import action.community.CommReReCountProAction;
import action.community.CommReReListProAction;
import action.community.CommReReWriteProAction;
import action.community.CommReWriteProAction;
import action.community.CommWriteProAction;
import action.community.MybookmarkListAction;
import action.community.MycommListAction;
import action.community.MycommReplyListAction;
import vo.ActionForward;

@WebServlet("*.co")
public class CommFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");

		// 서블릿 주소 가져오기
		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);

		// 각 요청 처리에 필요한 객체를 다루는 변수 선언
		Action action = null;
		ActionForward forward = null;

		// if문을 사용하여 각 서블릿 주소 판별 및 각 요청 처리를 위한 작업 요청
		// ---------------------------글 쓰기---------------------------
		if (command.equals("/CommWriteForm.co")) {
			/*
			 * 글쓰기 페이지에 대한 요청은 비즈니스 로직 없이 View 페이지(JSP)로 바로 포워딩 수행 - 기존 서블릿 주소가 그대로 유지되어야
			 * 하므로 Dispathcer 방식 포워딩 => ActionForward 객체에 redirect 변수값을 false 로 설정 (boolean
			 * 타입 기본 값이 false 이므로 별도 설정 필요 없음) => 따라서, 포워딩 주소만 지정 - 포워딩 주소 : board 폴더 내의
			 * qna_board_write.jsp
			 */
			// 1. ActionForward 객체 생성(변수는 이미 선언되어 있음)
			forward = new ActionForward();
			// 2. 포워딩 경로 설정
			forward.setPath("/community/comm_write.jsp");
			// 3. 포워딩 방식 설정(Dispatcher 방식)
//					forward.setRedirect(false); // 기본값이 false 이므로 설정 생략 가능
		} else if (command.equals("/CommWritePro.co")) { // BoardWritePro.bo 서블릿 요청에 대한 처리
			// 1. BoardWriteProAction 클래스 객체 생성
			// => Action 클래스는 Action 인터페이스를 구현하므로 다형성 활용 가능
			action = new CommWriteProAction();
			// 2. Action 클래스의 execute() 메서드 호출
			// => 리턴되는 ActionForward 객체 전달받기(직접 생성하지 않음!)
			// => throws 에 의해 예외가 전달되므로 try ~ catch 필요
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------글 쓰기---------------------------
			// ---------------------------글 목록---------------------------
		} else if (command.equals("/CommList.co")) {
			System.out.println("CommList.co 로 포워딩!");
			action = new CommListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------글 목록---------------------------
			// ---------------------------내가 쓴 글 목록 ---------------------------
		} else if (command.equals("/MycommList.co")) {
			System.out.println("MycommList.co 로 포워딩!");
			action = new MycommListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------내가 쓴 글 목록---------------------------

			// ---------------------------글 상세---------------------------
		} else if (command.equals("/CommDetail.co")) {
			System.out.println("CommDetail.co로 포워딩!");
			action = new CommDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------글 상세---------------------------
			// ---------------------------글 수정---------------------------
		} else if (command.equals("/CommModifyForm.co")) {
			System.out.println("CommModifyForm.co로 포워딩!");
			action = new CommModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CommModifyPro.co")) {
			System.out.println("CommModifyPro.bo로 포워딩!");
			action = new CommModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------글 수정---------------------------
			// ---------------------------글 삭제---------------------------
		} else if (command.equals("/CommDeleteForm.co")) {
			System.out.println("CommDeleteForm.co로 포워딩!");
			try {
				forward = new ActionForward();
				forward.setPath("/community/comm_delete.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CommDeletePro.co")) {
			System.out.println("CommDeletePro.co로 포워딩!");
			action = new CommDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------글 삭제---------------------------
			// ---------------------------북마크 추가---------------------------
		} else if (command.equals("/CommBook.co")) {
			System.out.println("CommBook.co 로 포워딩");
			action = new CommBookAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CommBookCount.co")) {
			System.out.println("CommBookCount.co 로 포워딩");
			action = new CommBookCountAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ---------------------------댓글 시작---------------------------
		} else if (command.equals("/CommReWritePro.co")) {
			// 댓글 쓰기
			action = new CommReWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/CommReModifyPro.co")) {
			// 댓글 수정
			action = new CommReModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/CommReReWritePro.co")) {
			// 대댓글 쓰기
			action = new CommReReWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/CommReDeletePro.co")) {
			// 댓글 삭제
			action = new CommReDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/CommReReListPro.co")) {
			// 대댓글 리스트 ajax로 불러오기
			action = new CommReReListProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/CommReReCountProAction.co")) {
			// 대댓글 카운트
			action = new CommReReCountProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/CommReListPro.co")) {
			// 원댓글 가져오기
			action = new CommReListProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// ---------------------------내 북마크 보기---------------------------
		else if (command.equals("/MybookmarkList.co")) {
			System.out.println("MybookmarkList.co 로 포워딩");
			action = new MybookmarkListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ---------------------------내 댓글 보기---------------------------
		else if (command.equals("/MycommReplyList.co")) {
			System.out.println("MycommReplyList.co 로 포워딩");
			action = new MycommReplyListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
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
		doProcess(request, response);
	}

}
