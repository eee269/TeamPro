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
		
		
		// ---------------------------댓글 시작---------------------------	 //
		System.out.println("CommReListAction!");
					
		int community_num =Integer.parseInt(request.getParameter("num"));
//		community_num=Integer.parseInt(request.getParameter("community_num"));
		System.out.println("community_num : "+community_num);
		
		// 페이징 처리를 위한 변수 선언
		int rePage = 1; // 현재 페이지 번호 저장할 변수
		int reLimit = 5; // 페이지 당 표시할 게시물 수를 결정하는 변수
		
		// request 객체로부터 "page" 파라미터가 전달됐을경우 (null이 아닐 경우)
		// 해당 파라미터 값을 page 변수에 저장 ( String -> int 변환 필요)
		if(request.getParameter("rePage")!=null) {
			rePage = Integer.parseInt(request.getParameter("rePage"));
		}

		
		CommReListService commReListService = new CommReListService();	
		int listCount = commReListService.getCommCount(community_num);
		System.out.println("총게시물수 : "+listCount);

		// 전체 게시물 목록을 저장할 ArrayList 객체 생성
		ArrayList<CommReBean> commentList = new ArrayList<CommReBean>();
		
		// CommReListService 클래스의 getCommentList() 메서드를 호출하여
		// 전체 게시물 목록 리턴받아 ArrayList 객체에 저장
		
		commentList = commReListService.getCommentList(community_num, rePage, reLimit);

		
		//페이지 계산 작업 수행
		//1. 전체 페이지 수 계산
		//   (총 게시물 수 / 페이지 당 게시물 수 + 0.950 -> 정수로 변환
		int reMaxPage = (int)((double)listCount / reLimit + 0.95);
		
		//2. 현재 페이지에서 보여줄 시작 페이지 수(1,11,21 페이지 등)
		int reStartPage=((int)((double)rePage/10+0.9)-1)*10+1;
		
		//3. 현재 페이지에서 보여줄 마지막 페이지 번호(10,20,30 페이지 등)
		int reEndPage = reStartPage + 10-1;
		
		//4. 마지막 페이지가 현재 페이지에서 표시할 최대 페이지(전체 페이지0 수 보다 클 경우
		//   마지막 페이지 번호를 전체 페이지 번호로 대체
		if(reEndPage>reMaxPage) {
			reEndPage=reMaxPage;
		}
		
		// 계산된 모든 페이지 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo(rePage, reMaxPage, reStartPage, reEndPage, listCount);
		
		
		// request 객체의 setAttribute() 메서드를 호출하여
		// 게시물 목록 정보(ArrayList)와 페이지 정보(PageInfo) 객체를 저장
		
		request.setAttribute("commentList", commentList);
		request.setAttribute("pageInfo", pageInfo);
		
		// ---------------------------댓글 끝---------------------------	 //
		
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/community/comm_detail.jsp");
		
		return forward;
	}
	
}
