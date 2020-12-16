package action.product.qna;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;
import vo.ProdQnaBean;

public class ProdQnaModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProdQnaModifyProAction");
		ActionForward forward = new ActionForward();
		
		// 로그인 시 세션 가져오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/upload/prodQnaUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
		
		int qna_num = Integer.parseInt(multi.getParameter("qna_num"));
		
		// qna 비밀번호 맞는 지 검증
		ProdQnaService ProdQnaService = new ProdQnaService();
		boolean isRightUser = ProdQnaService.checkQna(qna_num, multi.getParameter("qna_pass"), member_id);
		
		// 적합한 사용자 판별에 따른 처리
		if(!isRightUser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			
			ProdQnaBean qna = new ProdQnaBean();
			qna.setQna_num(qna_num);
			qna.setQna_subject(multi.getParameter("qna_subject"));
			qna.setQna_content(multi.getParameter("qna_content"));
			qna.setQna_file(multi.getOriginalFileName("qna_file"));
			// 글 수정 작업 요청
			boolean isModifySuccess = ProdQnaService.modifyQna(qna);
			
			// 수정 결과에 따른 처리
			if(!isModifySuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('QnA 수정 실패!!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setPath("ProductDetail.po?basicCode="+multi.getParameter("basicCode"));
				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
