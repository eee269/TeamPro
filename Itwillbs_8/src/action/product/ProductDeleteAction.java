package action.product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.ProductDeleteService;
import vo.ActionForward;

public class ProductDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String basicCode = request.getParameter("basicCode");
		
		ProductDeleteService productDeleteService = new ProductDeleteService();
		boolean isDelete = productDeleteService.deleteProduct(basicCode);
		
		if(!isDelete) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('상품 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("ControlProductList.po");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
