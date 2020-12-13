package action.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.ControlMemberListService;
import vo.ActionForward;
import vo.CommBean;
import vo.MemberBean;
import vo.PageInfo;

public class ControlMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ControlMemberAction!");
		ActionForward forward = null;

		ControlMemberListService controlMemberListService = new ControlMemberListService();
		
		// 전체 게시물 수 가져오기
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		memberList = controlMemberListService.getMemberList();
		
		request.setAttribute("memberList", memberList);
		forward = new ActionForward();
		forward.setPath("/admin_control/control_member.jsp");
		return forward;
	}

}
