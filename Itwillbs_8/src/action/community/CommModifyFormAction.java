package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommDetailService;
import svc.community.CommListService;
import vo.ActionForward;
import vo.CommBean;

public class CommModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 게시물 수정을 위해 기존 게시물 정보를 요청하는 Action 클래스
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 원본 게시물 정보 요청을 위해 새로운 Service 클래스를 정의하지 않고
		// 기존의 CommDetailService 클래스의 getArticle() 메서드를 호출하여
		// 원본 게시물 정보 요청을 수행
		// => 파라미터 : 글번호(num), 리턴타입 : CommBean(article)
		CommDetailService boardDetailService = new CommDetailService();
		CommBean article = boardDetailService.getArticle(num);
		// 글 상세페이지에 베스트 글 가져오기
		CommListService commListService = new CommListService();
		ArrayList<CommBean> articleList =  commListService.getArticleList(1, 3, "", "readcount");
		
		request.setAttribute("article", article);
		request.setAttribute("articleList",articleList);
		
		// => Dispatcher 방식
		forward = new ActionForward();
		forward.setPath("/community/comm_modify.jsp");
		
		return forward;
	}

}
