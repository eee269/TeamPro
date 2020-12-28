package action.product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonObject;

import action.Action;
import svc.product.qna.ProdQnaService;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;

public class ProdGetCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// review, qna 총 갯수 가져오기
		String basicCode = request.getParameter("basicCode");
		
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		int count = prodReviewListService.getReviewListCount(basicCode, 2);
		JSONObject json = new JSONObject();
		json.put(1, count);
		
		ProdQnaService prodQnaService = new ProdQnaService();
		count = prodQnaService.getQnaCount(basicCode);
		json.put(2, count);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		
		return null;
	}

}
