package action.community;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.MycommListService;
import svc.community.MycommReplyListService;
import vo.ActionForward;
import vo.CommBean;
import vo.CommReBean;

public class MycommReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
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
			HashMap<Integer, CommBean> articleList = new HashMap<Integer, CommBean>();
			ArrayList<CommReBean> myreplyList = new ArrayList<CommReBean>();
			
			MycommReplyListService service = new MycommReplyListService();
			
			// num값을 key로 가지는 HashMap 형식으로 게시글 목록 가져오기
			myreplyList = service.getMyreplyList(member_id);
			articleList = service.getArticleHash(myreplyList);
			
			
			request.setAttribute("articleList", articleList);
			request.setAttribute("myreplyList", myreplyList);
			
			forward.setPath("/mypage/myreply.jsp");
		}
		
		return forward;
	}

}
