package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommListService;
import vo.ActionForward;
import vo.CommBean;
import vo.PageInfo;

public class CommListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// BoardListService 클래스 통해 게시물 목록 조회 후
		// /board/blog.jsp 페이지로 포워딩
		//  request 객체 유지, 서블릿 주소 변경 없이 포워딩 -> Dispatcher
		System.out.println("BoardListAction~");
		
		ActionForward forward = null;
		
		// 페이징 처리 위해 변수 선언
		int page = 1; // 현재 페이지 번호 저장
		int limit = 10; // 페이지 당 표시할 게시물 수
		
		// request 객체로부터 null 이 아닌 "page" 파라미터 전달 시 해당 변수에 값 저장
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// BoardListService -> getListCount() -> 전체 게시물 수 가져오기
		// getListCount()
		CommListService commListService = new CommListService();
		int listCount = commListService.getListCount();
		
		// 전체 게시물 수 가져오기
		ArrayList<CommBean> articleList = new ArrayList<CommBean>();
		articleList = commListService.getArticleList(page, limit);
		
		// 페이지 계산 작업
		// 1. 전체 페이지 계산
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		// 2. 현재 페이지에서 보여줄 시작 페이지 수
		int startPage = ((int)((double)page / 10 + 0.9) -1) * 10 + 1;
		
		// 3. 현재 페이지에서 보여줄 마지막 페이지
		int endPage = startPage + 10 - 1;
		
		// 4. 마지막 페이지 > 현재 페이지에서 표시할 최대 페이지 
		//    -> 마지막 페이지 == 전체 페이지 번호 처리
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 모든 페이지 정보 PageInfo 저장
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		forward = new ActionForward();
		forward.setPath("/board/blog.jsp");
				
				
		return forward;
	}
	
}
