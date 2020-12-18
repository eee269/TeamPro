package action.product;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.ProductAjaxService;
import vo.ActionForward;

public class ProductCartLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		String id =(String)session.getAttribute("member_id");
		
		
		
		if(id !=null) {
			PrintWriter out = response.getWriter();
			ProductAjaxService pas = new ProductAjaxService();
			Map<String, String> cartLike = new HashMap<String, String>();
			cartLike = pas.getCartLike(id);

			out.print(cartLike.get("Cart"));
			out.print("/");
			out.print(cartLike.get("Like"));

		}
		
		
//		forward = new ActionForward();
//		forward.setPath("/product/shop.jsp");
		
		return forward;
	}

}
