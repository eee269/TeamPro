package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommDetailService;
import svc.community.CommListService;
import vo.ActionForward;
import vo.CommBean;

public class CommWriteFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommWriteFormAction");
		ActionForward forward = null;
		
		// 글 상세페이지에 베스트 글 가져오기
		CommListService commListService = new CommListService();
		ArrayList<CommBean> articleList =  commListService.getArticleList(1, 3, "", "readcount");
		
		
		request.setAttribute("articleList",articleList);
				
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/community/comm_write.jsp");
		
		return forward;
	}
	
}
