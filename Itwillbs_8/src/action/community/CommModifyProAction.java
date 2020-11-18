package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommModifyProService;
import vo.ActionForward;
import vo.CommBean;



public class CommModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 게시물 수정을 요청하는 Action 클래스
		System.out.println("CommModifyProAction!");
		
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		// isArticleWriter() 메서드를 호출하여 적합한 사용자인지 판별
		CommModifyProService boardModifyProService = new CommModifyProService();
		boolean isRightUser = boardModifyProService.isArticleWriter(num, request.getParameter("pass"));
		
		// 적합한 사용자 판별에 따른 처리
		if(!isRightUser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			CommBean article = new CommBean();
			article.setNum(num);
			article.setSubject(request.getParameter("subject"));
			article.setContent(request.getParameter("content"));
			article.setImg(request.getParameter("img"));
			// 글 수정 작업 요청
			boolean isModifySuccess = boardModifyProService.modifyArticle(article);
			
			// 수정 결과에 따른 처리
			if(!isModifySuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setPath("CommDetail.co?num="+num+"&page="+request.getParameter("page"));
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
