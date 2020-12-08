package action.product;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.ProductMylikeListService;
import vo.ActionForward;
import vo.ProductBean;

public class ProductMylikeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		// like 테이블에 표시된 상품코드(product_basicCode)만 가져와서 저장
		ArrayList<String> mylikeList = new ArrayList<String>();
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			ProductMylikeListService service = new ProductMylikeListService();
			mylikeList = service.getMylikeList(member_id);
			
			if(mylikeList.size() > 0) {
				productList = service.getProductList(mylikeList);
			}
			
			request.setAttribute("mylikeList", mylikeList);
			request.setAttribute("productList", productList);
			
			forward.setPath("/product/mylike.jsp");
		}
		
		return forward;
	}

}
