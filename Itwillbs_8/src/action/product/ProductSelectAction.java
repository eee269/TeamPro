package action.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.BestSelectService;
import svc.product.NcodeSelectService;
import svc.product.ProductSelectService;
import vo.ActionForward;
import vo.ProductBean;

public class ProductSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		String xcode = request.getParameter("xcode");
		String ncode = request.getParameter("ncode");
		NcodeSelectService ncodeSelectService = new NcodeSelectService();
		BestSelectService bestSelectService = new BestSelectService();
		ProductSelectService productSelectService = new ProductSelectService();
		
		ArrayList<ProductBean> ncodeList = new ArrayList<ProductBean>();
		ncodeList = ncodeSelectService.getNcodeList(xcode);
		request.setAttribute("ncodeList", ncodeList);
		
		ArrayList<ProductBean> bestList = new ArrayList<ProductBean>();
		bestList = bestSelectService.getBestList(xcode);
		request.setAttribute("bestList", bestList);
		
		if(ncode == null) {
			
			ArrayList<ProductBean> productListX = new ArrayList<ProductBean>();
			productListX = productSelectService.getProductListX(xcode);
			request.setAttribute("productList", productListX);
			
		}else if(ncode !=null) {
			
			ArrayList<ProductBean> productListN = new ArrayList<ProductBean>();
			productListN = productSelectService.getProductListN(ncode);
			request.setAttribute("productList", productListN);
			
		}
		
		
		
		forward = new ActionForward();
		forward.setPath("/product/shop.jsp");
		
		return forward;
	}

}
