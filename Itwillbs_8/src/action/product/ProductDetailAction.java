package action.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.ProductDetailSelectService;
import vo.ActionForward;
import vo.ProductBean;

public class ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		ArrayList<ProductBean> productDetailList = new ArrayList<ProductBean>();
		ProductDetailSelectService pdss = new ProductDetailSelectService();
		String basicCode = request.getParameter("basicCode");
		
		productDetailList = pdss.getProductDetailList(basicCode);
		
		request.setAttribute("productDetailList", productDetailList);
		
		forward = new ActionForward();
		forward.setPath("/product/product_detail.jsp");
		
		return forward;
	}

}
