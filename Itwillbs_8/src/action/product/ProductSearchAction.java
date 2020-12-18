package action.product;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import action.Action;
import svc.product.BestSelectService;
import svc.product.NcodeSelectService;
import svc.product.ProductAjaxService;
import svc.product.ProductCountService;
import svc.product.ProductSelectService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProductBean;
import vo.ProductLikeBean;

public class ProductSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		String id =(String)session.getAttribute("member_id");
		String search = request.getParameter("search");
		
		ProductSelectService productSelectService = new ProductSelectService();
		ProductAjaxService pas = new ProductAjaxService();
		ArrayList<String> likeBasicCodeList = new ArrayList<String>();
		ArrayList<ProductBean> searchProductList = new ArrayList<ProductBean>();
		
		searchProductList=productSelectService.getSearchProductList(search);
		request.setAttribute("productList", searchProductList);

		
		if(id !=null) {
			
			likeBasicCodeList = pas.getLikeBasicCodeList(id);
			request.setAttribute("likeBasicCodeList",likeBasicCodeList);
		}
		
		
		forward = new ActionForward();
		forward.setPath("/product/shopSearch.jsp");
		
		return forward;
	}

}
