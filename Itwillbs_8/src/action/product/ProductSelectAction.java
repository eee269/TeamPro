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

public class ProductSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		String xcode = request.getParameter("xcode");
		String ncode = request.getParameter("ncode");
		String id =(String)session.getAttribute("member_id");
		
		NcodeSelectService ncodeSelectService = new NcodeSelectService();
		BestSelectService bestSelectService = new BestSelectService();
		ProductSelectService productSelectService = new ProductSelectService();
		ProductCountService productCountService = new ProductCountService();
		ProductAjaxService pas = new ProductAjaxService();
		ArrayList<String> likeBasicCodeList = new ArrayList<String>();
		
		int page = 1;
		int limit = 8;
		if(request.getParameter("page") !=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		//대분류소분류 객체
		ArrayList<ProductBean> ncodeList = new ArrayList<ProductBean>();
		ncodeList = ncodeSelectService.getNcodeList(xcode);
		request.setAttribute("ncodeList", ncodeList);
		//BestProducts 객체
		ArrayList<ProductBean> bestList = new ArrayList<ProductBean>();
		bestList = bestSelectService.getBestList(xcode);
		request.setAttribute("bestList", bestList);
		
	

		
		//페이징, 상품 산출 객체
		if(ncode == null) {
			
			ArrayList<ProductBean> productListX = new ArrayList<ProductBean>();
			productListX = productSelectService.getProductListX(xcode,page,limit);
			request.setAttribute("productList", productListX);
			int productCount = productCountService.getProductCountX(xcode);
			int maxPage = (int)(productCount/(double)limit + 0.95);

			int startPage =  ((int)((double)page/ 10+0.9)-1)*10+1;

			int endPage = startPage + 10 -1;
			
			if(endPage > maxPage) {
				endPage =maxPage;
			}
			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, productCount);
		    request.setAttribute("pageInfo", pageInfo);
			
		}else if(ncode !=null) {
			
			ArrayList<ProductBean> productListN = new ArrayList<ProductBean>();
			productListN = productSelectService.getProductListN(ncode,page,limit);
			request.setAttribute("productList", productListN);
			int productCount = productCountService.getProductCountN(ncode);
			int maxPage = (int)(productCount/(double)limit + 0.95);

			int startPage =  ((int)((double)page/ 10+0.9)-1)*10+1;

			int endPage = startPage + 10 -1;
			
			if(endPage > maxPage) {
				endPage =maxPage;
			}

			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, productCount);
		    request.setAttribute("pageInfo", pageInfo);

		}
		
		if(id !=null) {
			
			likeBasicCodeList = pas.getLikeBasicCodeList(id);
			request.setAttribute("likeBasicCodeList",likeBasicCodeList);
		}
		
		
		forward = new ActionForward();
		forward.setPath("/product/shop.jsp");
		
		return forward;
	}

}
