package action.community;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.CommDeleteProService;
import svc.community.CommDetailService;
import svc.community.CommModifyProService;
import vo.ActionForward;
import vo.CommBean;

public class CommDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommDeleteProAction!");
		ActionForward forward = null;
		String pass = request.getParameter("pass");
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		CommModifyProService commModifyProService = new CommModifyProService();
		CommDeleteProService commDeleteProService = new CommDeleteProService();
		CommDetailService commDetailService = new CommDetailService();
		
		// 비밀번호 맞는 지 검증
		boolean check = commModifyProService.isArticleWriter(member_id,pass);
		
		if(!check) {
			// 틀렸을 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 오류!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			// 일치할 경우 삭제 작업
			CommBean commBean = commDetailService.getArticle(num);
			boolean isDeleteSuccess = commDeleteProService.removeArticle(num);
			if(!isDeleteSuccess) {
				// 삭제 실패 시
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				ServletContext context = request.getServletContext();
				
				//db 데이터 삭제 성공 시 실제 저장된 이미지 삭제
				String saveFolder = "upload/prodReviewUpload";
				String realFolder = context.getRealPath(saveFolder);
				
				String img = commBean.getImg();
				File f = new File(realFolder + "/" + img);
				if(f.exists()) {f.delete();}
				
				forward = new ActionForward();
				forward.setPath("CommList.co?num="+num+"&page="+request.getParameter("page"));
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
