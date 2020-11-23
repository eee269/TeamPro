package action.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.cart.CartListService;
import vo.ActionForward;
import vo.Cart;
import vo.PageInfo;

public class cartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartListAction");
		
		ActionForward forward = null;
		
		int page = 1; 
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		CartListService cartListService = new CartListService();
		int listCount = cartListService.getListCount();
	    System.out.println("전체 게시물 수: " + listCount);
	    
	    
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		
		cartList = cartListService.getCartList(page, limit);

		int maxPage = (int)((double)listCount / limit + 0.95);
		
		int startPage = ((int)((double)page / 10 + 0.9) -1) * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
				
		request.setAttribute("cartList", cartList);
		request.setAttribute("pageInfo", pageInfo);

		
		forward = new ActionForward();
		forward.setPath("cart/cart.jsp");
		
		
		return forward;
	}

}
