package action.product.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberLoginProService;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;

public class ProdQnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProdQnaDeleteAction");
		ActionForward forward = null;
		
		// 로그인 시 세션 및 입력 정보 가져오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pass = request.getParameter("qna_pass");
		int qna_num = Integer.parseInt(request.getParameter("qna_num")); 
		
		// 입력된 비밀번호 검증
		MemberLoginProService memberLoginProService = new MemberLoginProService();
		boolean isRightUser = memberLoginProService.isLoginMember(member_id, pass);
		
		ProdQnaService prodQnaService = new ProdQnaService();
		
		if(!isRightUser) {
			// 틀리면 오류
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('접근 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			// 맞으면 삭제
			boolean isDeleteSuccess = prodQnaService.deleteQna(qna_num);
			if(!isDeleteSuccess) {
				// 삭제 실패 시
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('qna 삭제 실패!!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				// 삭제 성공 시
				forward = new ActionForward();
				forward.setPath("ProductDetail.po?basicCode="+request.getParameter("basicCode"));
				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
