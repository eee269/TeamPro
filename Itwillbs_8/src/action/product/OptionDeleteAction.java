package action.product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.OptionDeleteService;
import svc.product.ProductDeleteService;
import vo.ActionForward;

public class OptionDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String productCode = request.getParameter("productCode");
		String basicCode = request.getParameter("basicCode");
		OptionDeleteService optionDeleteService = new OptionDeleteService();
		
		System.out.println("OptionDeleteAction");
		boolean isDelete = optionDeleteService.getDeleteOption(productCode);
		
		if(!isDelete) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('상품 옵션 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			int count = optionDeleteService.getOptionCount(basicCode);
			
			if(count <= 0) {
				ProductDeleteService productDeleteService = new ProductDeleteService();
				productDeleteService.deleteProduct(basicCode);
			}
			
			forward = new ActionForward();
			forward.setPath("ControlProductList.po");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
