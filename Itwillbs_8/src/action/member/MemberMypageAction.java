package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.MemberMypageService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberMypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String member_id = request.getParameter("member_id");
		
		MemberMypageService memberMypageService = new MemberMypageService();
		MemberBean member = memberMypageService.getMember(member_id);
		
		request.setAttribute("member", member);
		
		forward = new ActionForward();
		forward.setPath("/member/mypage.jsp");
		
		return forward;
	}

}
