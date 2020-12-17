package action.product.review;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProdReviewBean;

public class ProdReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String basicCode = request.getParameter("basicCode");
		int	page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		int loop = Integer.parseInt(request.getParameter("loop"));
		int pic = 0;
		// 정렬 방식
		int sort = Integer.parseInt(request.getParameter("sort"));
		
		if(loop < 2) {
			// 사용자가 포토 또는 일반 리뷰탭을 선택할 시 해당 값들만 가져오기 위한 설정
			pic = Integer.parseInt(request.getParameter("pic"));
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ProdReviewListService prodReviewListService = new ProdReviewListService();
		
		
		ArrayList<ProdReviewBean> reviewList = new ArrayList<ProdReviewBean>();
		
		// 리뷰 목록 가져오기
		HashMap<Integer, String> reviewMap = new HashMap<Integer, String>();
		for(int i =0; i < loop; i++) {
			String json="";
			
			// 리뷰 총 갯수 카운트
			int listCount = prodReviewListService.getReviewListCount(basicCode, loop > 1 ?  i:pic);
			
			// i값(포토 유무)에 따른 리뷰 목록 호출
			reviewList = prodReviewListService.getReviewList(page, limit, basicCode, loop > 1 ?  i:pic, sort);
			
			// Json
			json = "{\"replyList\":["; 
			for (int j = 0; j < reviewList.size(); j++) {
				int num = reviewList.get(j).getNum();
				String id = reviewList.get(j).getMember_id();
				SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd");
				Date date = reviewList.get(j).getDate();
				int starScore = reviewList.get(j).getStarScore();
				String content = reviewList.get(j).getContent();
				String product_img = reviewList.get(j).getProduct_img();
				int re_ref = reviewList.get(j).getRe_ref();
				
				if(product_img == null) {
					product_img = ""; // javascipt 에서 null 로 인식 시키기 위해 초기화
				}
				
				
				json += "[{\"num\":\""+num+"\",\"id\":\"" + id + "\"},";
				json += "{\"num\":\""+num+"\",\"date\":\"" + df.format(date) + "\"},";
				json += "{\"num\":\""+num+"\",\"starScore\":\"" + starScore + "\"},";
				json += "{\"num\":\""+num+"\",\"content\":\"" + content + "\"},";
				json += "{\"num\":\""+num+"\",\"product_img\":\""+product_img+"\"},";
				json += "{\"num\":\""+num+"\",\"id\":\""+id+"\",\"re_ref\":\""+re_ref+"\"}]";
				
				if (j != reviewList.size() - 1) {
					json += ",";
				}
			}
			json += "],\"listCount\":\""+listCount+"\"}";
			reviewMap.put(i, json);
		}
		JSONObject jsonObject = new JSONObject(reviewMap);
		out.print(jsonObject);
		
		return null;
	}

}
