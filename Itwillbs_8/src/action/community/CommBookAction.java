package action.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.CommBookService;
import vo.ActionForward;

public class CommBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("member_id");
		
		CommBookService commBookService = new CommBookService();
		int checkCount = commBookService.checkBook(num,id);
		if(checkCount == 0) {
			commBookService.updateBook(num,id);
		}else {
			commBookService.deleteBook(num,id);
		}
		
		return null;
	}

}
