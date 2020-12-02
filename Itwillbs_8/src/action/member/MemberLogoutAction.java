package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("로그아웃액션");
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("Main.go"); 
		
		return forward;
	}

}
