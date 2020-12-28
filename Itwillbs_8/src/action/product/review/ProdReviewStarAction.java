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
		ArrayList<Integer> starScore = new ArrayList<Integer>();
		
		String json = "{\"star\":[{";
//		int num = 1;
		int total = 0;
		// 별점 1~5점 별 갯수 가져오기
		for(int i = 1; i < 6; i++) {
			int num = prodReviewListService.getStarScoreCount(basicCode, i);
//		}
//		for(int i : starScore) {
			total += num;
			json += "\""+i+"\":\""+num+"\"";
			num++;
			if(i != 5) {
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
