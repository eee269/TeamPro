package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/upload/commUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
		
		int num = Integer.parseInt(multi.getParameter("num"));
		
		// isArticleWriter() 메서드를 호출하여 적합한 사용자인지 판별
		CommModifyProService boardModifyProService = new CommModifyProService();
		boolean isRightUser = boardModifyProService.isArticleWriter(multi.getParameter("pass"), member_id);
		
		// 적합한 사용자 판별에 따른 처리
		if(!isRightUser) {
			// 비밀번호 틀림
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			// 본인 맞음
			CommBean article = new CommBean();
			article.setNum(num);
			article.setSubject(multi.getParameter("subject"));
			article.setContent(multi.getParameter("content"));
			article.setImg(multi.getOriginalFileName("img"));
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
				forward.setPath("CommDetail.co?num="+num+"&page="+multi.getParameter("page"));
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
