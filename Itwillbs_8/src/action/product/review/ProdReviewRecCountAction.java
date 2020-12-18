package action.product.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.community.CommBookCountService;
import svc.community.CommBookService;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;

public class ProdReviewRecCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProdReviewRecCountAction");
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		int recommand = Integer.parseInt(request.getParameter("recommand"));
		
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		int count = prodReviewListService.CountReviewRec(num, recommand);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(count);
		out.close();
		
		return null;
	}

}
