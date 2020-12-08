package action.product;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommListService;
import svc.product.ProductDetailSelectService;
import svc.product.ProductOptionSelectService;
import svc.product.qna.ProdQnaService;
import svc.product.review.ProdReviewListService;
import vo.ActionForward;
import vo.CommBean;
import vo.PageInfo;
import vo.ProdQnaBean;
import vo.ProdReviewBean;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		ArrayList<ProductBean> productDetailList = new ArrayList<ProductBean>();
		ProductDetailSelectService pdss = new ProductDetailSelectService();
		String basicCode = request.getParameter("basicCode");
		//-------옵션가져오는겁니다-------
		ArrayList<ProductOptionBean> productColorList = new ArrayList<ProductOptionBean>();
		ArrayList<ProductOptionBean> productSizeList = new ArrayList<ProductOptionBean>();
		//---------------------------------
		ProductOptionSelectService poss = new ProductOptionSelectService();
		
		productDetailList = pdss.getProductDetailList(basicCode);
		productColorList = poss.getColorList(basicCode);
		productSizeList = poss.getSizeList(basicCode);
		
		// 상품 qna 목록 호출 시작 -BIN-
		// 페이징 작업
		int page = 1;
		int limit = 10;
		
		// basicCode에 달린 전체 qna 수 가져오기
		ProdQnaService prodQnaService = new ProdQnaService();
		int listCount = prodQnaService.getQnaCount(basicCode);
		
		// qna page ~ limit 갯수만큼 가져오기
		ArrayList<ProdQnaBean> qnaList = new ArrayList<ProdQnaBean>();
		qnaList = prodQnaService.getQnaList(page, limit, basicCode);
				
		// 페이지 계산
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = ((int)((double)page / 10 + 0.9) -1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("qnaList", qnaList);
		// 상품 qna 목록 호출 끝
		
		request.setAttribute("productDetailList", productDetailList);
		request.setAttribute("productColorList", productColorList);
		request.setAttribute("productSizeList", productSizeList);
		
		forward = new ActionForward();
		forward.setPath("/product/product_detail.jsp");
		
		return forward;
	}

}
