package action.product.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;

public class ProdQnaUpReadcountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// qna 조회수 업데이트 && 조회수 가져오기
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProdQnaService prodQnaService = new ProdQnaService();
		int count = prodQnaService.qnaUpReadcount(num);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(count);
		
		return null;
	}

}
