package action.community;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.MybookmarkListService;
import vo.ActionForward;
import vo.CommBean;

public class MybookmarkListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		ArrayList<CommBean> articleList = new ArrayList<CommBean>();

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			MybookmarkListService service = new MybookmarkListService();
			//내가 북마크 한 게시글의 목록
			articleList = service.getMybookArticleList(member_id);
				
			request.setAttribute("articleList", articleList);
			
			forward.setPath("/mypage/mybookmark.jsp");
		}
		
		return forward;
	}

}
