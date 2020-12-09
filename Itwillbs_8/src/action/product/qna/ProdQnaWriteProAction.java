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

public class ProdQnaWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProdQnaWriteProAction");
		ActionForward forward = null;
		
		// 로그인 시 세션 값 가져오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/product/prodQnaUploadImg";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10; // 10MB
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
		
		// 입력 받은 데이터 저장
		String qna_pass = multi.getParameter("qna_pass");
		String qna_subject = multi.getParameter("qna_subject");
		String qna_content = multi.getParameter("qna_content");
		String qna_file = multi.getOriginalFileName("qna_file");
		String product_basicCode = multi.getParameter("basicCode");
		ProdQnaBean prodQnaBean = new ProdQnaBean(0, qna_pass, qna_subject, qna_content, 0, qna_file, 0, 0, null, product_basicCode, member_id);
		
		// qna 등록 작업 요청
		ProdQnaService prodQnaService = new ProdQnaService();
		boolean isWriteSuccess = prodQnaService.registQna(prodQnaBean);
		
		// qna 등록 성공여부 판별
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('qna 등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); 
			out.println("</script>"); // 자바스크립트 끝 태그
		}else {
			forward = new ActionForward();
			forward.setPath("ProductDetail.po?basicCode="+product_basicCode);
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
