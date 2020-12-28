package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommDetailService;
import svc.community.CommListService;
import svc.product.ProductSelectService;
import vo.ActionForward;
import vo.CommBean;
import vo.ProductBean;

public class CommWriteFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommWriteFormAction");
		ActionForward forward = null;
		
		// 글 상세페이지에 베스트 글 가져오기
		CommListService commListService = new CommListService();
		ArrayList<CommBean> articleList =  commListService.getArticleList(1, 4, "", "readcount");
		
		// 글 상세페이지에 베스트 상품 가져오기
		ProductSelectService productSelectService = new ProductSelectService();
		ArrayList<ProductBean> bestList = new ArrayList<ProductBean>();
		bestList = productSelectService.getMainProductList();
		request.setAttribute("bestList", bestList);
		
		request.setAttribute("articleList",articleList);
				
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/community/comm_write.jsp");
		
		return forward;
	}
	
}
