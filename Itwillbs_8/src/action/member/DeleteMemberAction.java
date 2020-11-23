package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.DeleteMemberService;
import vo.ActionForward;

public class DeleteMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		
		DeleteMemberService deleteMemberService = new DeleteMemberService();
		
		request.setAttribute("id", id);
		
		return forward;
	}

}
