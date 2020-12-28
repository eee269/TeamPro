package action.community;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.CommBookCountService;
import svc.community.CommBookService;
import vo.ActionForward;

public class CommBookCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int num = 0;
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		CommBookService commBookService = new CommBookService();
		CommBookCountService commBookCountService = new CommBookCountService();
		
		// 게시글 북마크 갯수 카운트
		int count = commBookCountService.CountBook(num);
		// 북마크 했는지 유무 검증
		int has = 0;
		
		String json = "{\"total\":\""+count+"\"";
		
		// 로그인 했을 경우 해당 아이디가 추천한 북마크 가져오기
		if(member_id != null) {
			// 첫 새로고침 시
			if(num == 0) {
				ArrayList<Integer> bookList = commBookCountService.hasBook(member_id);
				json += ",\"list\":[";
				
				for(int i = 0; i < bookList.size(); i++) {
					json += "{\""+i+"\":\""+bookList.get(i)+"\"}";
					if(i != bookList.size()-1) {
						json += ",";
					}
				}
				json += "]";
			}else {
				has = commBookService.checkBook(num, member_id);
				json += ",\"has\":\""+has+"\"";
			}
		}
		
		json += "}";
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
		
		return null;
	}

}
