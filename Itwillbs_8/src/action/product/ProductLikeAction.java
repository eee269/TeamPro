package action.product;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.ProdReviewListService;
import svc.product.ProductDetailSelectService;
import svc.product.ProductLikeInsertService;
import svc.product.ProductLikeService;
import svc.product.ProductLikeyService;
import svc.product.ProductOptionSelectService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProdReviewBean;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String id = request.getParameter("id");
		String basicCode = request.getParameter("basicCode");
		ActionForward forward = null;
		boolean isLike = false;//좋아요 있는지 판별여부
		int isInsert = 0;//product_like의 insert성공여부
		int isLikey = 0;//product.likey의 +성공여부
		
		ProductLikeService productLikeService = new ProductLikeService();
		ProductLikeInsertService productLikeInsert = new ProductLikeInsertService();
		ProductLikeyService productLikeyService = new ProductLikeyService();
		isLike = productLikeService.isLike(id, basicCode);
		
		
		
		
		
		if(isLike) {
			//이미 좋아요됬음
			forward = new ActionForward();
			forward.setPath("/product/product_ajax.jsp");
			System.out.println("삽입하면단됨");
		}else {
			isInsert = productLikeInsert.isInsert(id,basicCode);
			//product_like에 insert하고 product.likey에 +1
			if(isInsert>0) {
				System.out.println("삽입성공!");
				//product.likey에 +1
				isLikey = productLikeyService.isLikey(basicCode);
				if(isLikey>0) {
					System.out.println("+성공");
					
				}else {
					System.out.println("+실패!");
				}
			}else {
				System.out.println("삽입실패!");
				
			}
			
		}

		return forward;
	}

}
