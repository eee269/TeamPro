package action.product.review;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;

public class ProdReviewStarAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품에 대한 별점들 계산
		String basicCode = request.getParameter("basicCode");
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		
		// 별점 1~5점 별 갯수 가져오기
		ArrayList<Integer> starScore = prodReviewListService.getStarScoreCount(basicCode);
		
		String json = "{\"star\":[{";
		int num = 1;
		int total = 0;
		for(int i : starScore) {
			total += i;
			json += "\""+num+"\":\""+i+"\"";
			num++;
			if(num != 6) {
				json += ",";
			}
		}
		json += "}],\"total\":\""+total+"\"}";
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json);
		
		return null;
	}

}
