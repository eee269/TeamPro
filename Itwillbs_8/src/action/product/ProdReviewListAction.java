package action.product;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.ProdReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProdReviewBean;

public class ProdReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String basicCode = request.getParameter("basicCode");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int page = 1; 
		int limit = 10; 
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		// 리뷰 총 갯수 카운트
		int listCount = prodReviewListService.getReviewListCount(basicCode);
		
		ArrayList<ProdReviewBean> reviewList = new ArrayList<ProdReviewBean>();
		
		// 리뷰 목록 가져오기
		reviewList = prodReviewListService.getReviewList(page, limit, basicCode);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
				page, maxPage, startPage, endPage, listCount);
		// Json
		String json = "{\"replyList\":["; 
		for (int i = 0; i < reviewList.size(); i++) {
			String id = reviewList.get(i).getMember_id();
			String content = reviewList.get(i).getContent();
			Date date = reviewList.get(i).getDate();
			SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd");
			int starScore = reviewList.get(i).getStarScore();
			String product_img = reviewList.get(i).getProduct_img();
			int num = reviewList.get(i).getNum();
			
			json += "[{\"id\":\"" + id + "\"},";
			json += "{\"date\":\"" + df.format(date) + "\"},";
			json += "{\"starScore\":\"" + starScore + "\"},";
			json += "{\"content\":\"" + content + "\"},";
			json += "{\"product_img\":\""+product_img+"\"},";
			json += "{\"num\":\""+num+"\"}]";
			
			if (i != reviewList.size() - 1) {
				json += ",";
			}
		}
		json += "]}";
		
		out.print(json);
		
		
		return null;
	}

}
