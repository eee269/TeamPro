package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommDetailService;
import svc.community.CommReListService;
import vo.ActionForward;
import vo.CommBean;
import vo.CommReBean;
import vo.PageInfo;

//게시물 목록에서 클릭된 게시물에 대한 상세 내용을 가져오기 위한 클래스
//=> 1개 게시물의 상세 내용을 가져와서 comm_view.jsp 페이지로 전달
public class CommDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommDetailAction으로 이동!");
		
		ActionForward forward = null;
		
		// 파라미터로 전달받은 게시물 번호(num) 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		
		// getArticle() 메서드를 호출하여 게시물 번호에 해당하는 글 내용 가져오기
		CommDetailService commDetailService = new CommDetailService();
		CommBean article = commDetailService.getArticle(num);
		
		request.setAttribute("article",article);
				
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/community/comm_detail.jsp");
		
		return forward;
	}
	
}
