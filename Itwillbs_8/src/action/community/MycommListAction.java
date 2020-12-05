package action.community;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.MycommListService;
import vo.ActionForward;
import vo.CommBean;

public class MycommListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			ArrayList<CommBean> articleList = new ArrayList<CommBean>();
			
			MycommListService service = new MycommListService();
			String username = service.getUsername(member_id);
			// 회원의 username으로 작성한 게시글 목록
			articleList = service.getArticleList(username);
			
			// reply 갯수 가지고 올건지?
			
			
			request.setAttribute("articleList", articleList);
			
			forward = new ActionForward();
			forward.setPath("/community/mycomm.jsp");
		
		}
		return forward;
	}

}
