package action.product.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;

public class ProdReviewRecAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProdReviewRecAction");
		// review num 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		// 로그인 값 
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("member_id");
		
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		int recommand = Integer.parseInt(request.getParameter("recommand"));
		
		// 현재 로그인 아이디로 추천했는지 판별
		int checkCount = prodReviewListService.checkReviewRec(num,id,recommand);
		
		// 0 -> 추천 안함
		if(checkCount == 0) {
			prodReviewListService.updateReviewRec(num,id,recommand);
		}else {
			// -> 추천했음
			prodReviewListService.deleteReviewRec(num,id,recommand);
		}
		
		return null;
	}

}
