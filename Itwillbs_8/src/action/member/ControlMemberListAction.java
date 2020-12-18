package action.member;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		ActionForward forward = new ActionForward();


		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else if (!member_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('접근 권한이 없습니다.')");
			out.println("</script>");
			
			forward.setPath("Main.go");
		} else {
			ControlMemberListService controlMemberListService = new ControlMemberListService();
			
			// 전체 게시물 수 가져오기
			ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
			memberList = controlMemberListService.getMemberList();
			
			request.setAttribute("memberList", memberList);
			forward.setPath("/admin_control/control_member.jsp");
		}
		return forward;
	}

}
