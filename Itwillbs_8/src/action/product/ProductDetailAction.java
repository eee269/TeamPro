package action.product;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.ProdReviewListService;
import svc.product.ProductDetailSelectService;
import svc.product.ProductOptionSelectService;
import vo.ActionForward;
import vo.PageInfo;
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
		
		request.setAttribute("productDetailList", productDetailList);
		request.setAttribute("productColorList", productColorList);
		request.setAttribute("productSizeList", productSizeList);
		
		forward = new ActionForward();
		forward.setPath("/product/product_detail.jsp");
		
		return forward;
	}

}
