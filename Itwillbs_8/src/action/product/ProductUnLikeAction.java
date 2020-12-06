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
import svc.product.ProductUnLikeInsertService;
import svc.product.ProductUnLikeyService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ProdReviewBean;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductUnLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String id = request.getParameter("id");
		String basicCode = request.getParameter("basicCode");
		ActionForward forward = null;
		boolean isLike = false;//좋아요 있는지 판별여부
		int isDelete = 0;//product_like의 Delete성공여부
		int isUnLikey = 0;//product.likey의 -성공여부
		
		ProductLikeService productLikeService = new ProductLikeService();
		ProductUnLikeInsertService productUnLikeInsert = new ProductUnLikeInsertService();
		ProductUnLikeyService productUnLikeyService = new ProductUnLikeyService();
		isLike = productLikeService.isLike(id, basicCode);
		
		
		
		if(!isLike) {
			//좋아요가 안되어있음
			forward = new ActionForward();
			forward.setPath("/product/product_ajax.jsp");
			System.out.println("삽입하면단됨");
		}else {//좋아요가 되어있으므로 
			isDelete = productUnLikeInsert.isDelete(id,basicCode);
			//product_like에 delete하고 product.likey에 -11
			if(isDelete>0) {
				System.out.println("삭제성공!");
				//product.likey에 -1
				isUnLikey = productUnLikeyService.isUnLikey(basicCode);
				if(isUnLikey>0) {
					System.out.println("+성공");
					
				}else {
					System.out.println("+실패!");
				}
			}else {
				System.out.println("삭제실패!");
				
			}
			
		}

		return forward;
	}

}
