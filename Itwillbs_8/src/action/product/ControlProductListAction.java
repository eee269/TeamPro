package action.product;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.ControlMemberListService;
import svc.product.ControlProductListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.PageInfo;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ControlProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();


		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else if (!member_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('접근 권한이 없습니다.')");
			out.println("</script>");
			
			forward.setPath("Main.go");
		} else {
			ControlProductListService controlProductListService = new ControlProductListService();
	
			ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
			HashMap<String, ArrayList<ProductOptionBean>> optionList = new HashMap<String, ArrayList<ProductOptionBean>>();
			ArrayList<ProductOptionBean> subOptionList = null;
	
			productList = controlProductListService.getProductList();
			for (int i = 0; i < productList.size(); i++) {
				ProductBean product = new ProductBean();
				product = productList.get(i);
	
				String basicCode = product.getBasicCode();
	
				subOptionList = new ArrayList<ProductOptionBean>();
				subOptionList = controlProductListService.getOptionList(basicCode);
				optionList.put(basicCode, subOptionList);
			}
	
			request.setAttribute("productList", productList);
			request.setAttribute("optionList", optionList);
			
			forward.setPath("/admin_control/control_product.jsp");
		}
		return forward;
	}

}
