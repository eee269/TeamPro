package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.product.BestSelectService;
import svc.product.ProductAjaxService;
import svc.product.ProductSelectService;
import vo.ActionForward;
import vo.ProductBean;

public class MainSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		String id =(String)session.getAttribute("member_id");
		
		BestSelectService bestSelectService = new BestSelectService();
		ProductSelectService productSelectService = new ProductSelectService();
		ProductAjaxService pas = new ProductAjaxService();
		ArrayList<String> likeBasicCodeList = new ArrayList<String>();
		
		//BestProducts 객체
		ArrayList<ProductBean> newList = new ArrayList<ProductBean>();
		newList = bestSelectService.getNewList();
		request.setAttribute("newList", newList);
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		productList = productSelectService.getMainProductList();
		request.setAttribute("productList", productList);

		if(id !=null) {
			
			likeBasicCodeList = pas.getLikeBasicCodeList(id);
			request.setAttribute("likeBasicCodeList",likeBasicCodeList);
		}
		
		
		forward = new ActionForward();
		forward.setPath("/index.jsp");
		
		return forward;
	}

}
