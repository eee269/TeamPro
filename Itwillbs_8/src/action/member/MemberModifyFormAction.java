package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberDetailService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
ActionForward forward=null;
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("member_id");
	
		MemberDetailService memberDetailService=new MemberDetailService();
		MemberBean member=memberDetailService.getMember(id);

		
		request.setAttribute("member", member);
		
		forward = new ActionForward();
		forward.setPath("/member/member_Update.jsp");
		
		
		
		return forward;
	}

}