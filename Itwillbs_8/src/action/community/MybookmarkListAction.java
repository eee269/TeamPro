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
		
		ArrayList<Integer> mybookList = new ArrayList<Integer>();
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
			mybookList = service.getMybookmarkList(member_id);
			
			if(mybookList.size() > 0) {
				articleList = service.getArticleList(mybookList);
			}
			
			request.setAttribute("mybookList", mybookList);
			request.setAttribute("articleList", articleList);
			
			forward.setPath("/community/mybookmark.jsp");
		}
		
		return forward;
	}

}
