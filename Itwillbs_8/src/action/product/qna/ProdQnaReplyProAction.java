package action.product.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;
import vo.ProdQnaBean;

public class ProdQnaReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ProdQnaReplyProAction!");
			
			ActionForward forward = null;
			HttpSession session = request.getSession();
			String member_id = (String)session.getAttribute("member_id");
			
			
			ProdQnaBean qna = new ProdQnaBean();
			qna.setQna_num(Integer.parseInt(request.getParameter("qna_num")));
			qna.setMember_id(member_id);
			qna.setQna_pass(request.getParameter("qna_pass"));
			qna.setQna_subject(request.getParameter("qna_subject"));
			qna.setQna_content(request.getParameter("qna_content"));
			qna.setQna_re_ref(Integer.parseInt(request.getParameter("qna_re_ref")));
			qna.setQna_re_lev(Integer.parseInt(request.getParameter("qna_re_lev")));
			qna.setProduct_basicCode(request.getParameter("basicCode"));

			ProdQnaService prodQnaService = new ProdQnaService();
			boolean isReplySuccess = prodQnaService.replyQna(qna);
			
			if(!isReplySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('QnA 답글 등록 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("ProductDetail.po?basicCode="+request.getParameter("basicCode"));
				forward.setRedirect(true);
			}
			
			return forward;
	}

}
