package action.product.qna;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import exception.member.LoginException;
import svc.member.MemberLoginProService;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;
import vo.ProdQnaBean;

public class ProdQnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("ProdQnaDeleteAction");
		ActionForward forward = null;
		
		// 로그인 시 세션 및 입력 정보 가져오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pass = request.getParameter("qna_pass");
		int qna_num = Integer.parseInt(request.getParameter("qna_num")); 
		
		// 입력된 비밀번호 검증
		MemberLoginProService memberLoginProService = new MemberLoginProService();
		try {
			boolean isRightUser = memberLoginProService.isLoginMember(member_id, pass);
			
			ProdQnaService prodQnaService = new ProdQnaService();
			
			if(isRightUser) { 
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
					ProdQnaBean prodReviewBean = prodQnaService.getQna(qna_num);
					
					ServletContext context = request.getServletContext();
					
					//db 데이터 삭제 성공 시 실제 저장된 이미지 삭제
					String saveFolder = "upload/prodReviewUpload";
					String realFolder = context.getRealPath(saveFolder);
					
					String img = prodReviewBean.getQna_file();
					File f = new File(realFolder + "/" + img);
					if(f.exists()) {f.delete();}
					// 삭제 성공 시
					forward = new ActionForward();
					forward.setPath("ProductDetail.po?basicCode="+request.getParameter("basicCode"));
					forward.setRedirect(true);
				}
			}
		} catch (LoginException e) {
			e.printStackTrace();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+e.getMessage()+"')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
