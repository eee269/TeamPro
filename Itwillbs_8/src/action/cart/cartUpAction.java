package action.cart;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cart.CartUpdateService;
import svc.cart.cartGetService;
import vo.ActionForward;
import vo.Cart;

public class cartUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action - cartUpAction");
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		String member_id = (String) session.getAttribute("member_id"); 	// 아이디

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("MemberLoginForm.mo");
		}
		
		
		 String product_name = request.getParameter("name");	// 상품이름
		 int price = Integer.parseInt(request.getParameter("price"));  //가격
		 String color = request.getParameter("color"); //색  color
		 color.trim(); 	// 색 공백제거
		 String size = request.getParameter("size"); // 사이즈 
		 size = size.trim();  	// 사이즈 공백제거
		 String product_basicCode = request.getParameter("product_basicCode");  // basicCode코드
		 String opt_productCode = product_basicCode + color + size;  // productCode코드
		 opt_productCode =  opt_productCode.replace(" ", ""); 	// productCode코드 공백제거
		 int cnt = Integer.parseInt(request.getParameter("cnt")); 	// 수량
		  
		 
		 System.out.println("cnt : " + cnt);
		 System.out.println("product_name : " + product_name);
		 System.out.println("price : " + price);
		 System.out.println("color : " + color);
		 System.out.println("size : " + size);
		 System.out.println("member_id : " + member_id);
		 System.out.println("product_basicCode : " + product_basicCode);
		 System.out.println("opt_productCode : " + opt_productCode);
		 
		 System.out.println("-------------------------------------------------------");

		 Cart ca = new Cart();
		 ca.setMember_id(member_id);
		 ca.setColor(color);
		 ca.setOpt_productCode(opt_productCode);
		 ca.setPrice(price);
		 ca.setProduct_name(product_name);
		 ca.setSize(size);
		 ca.setProduct_basicCode(product_basicCode);
		 ca.setCnt(cnt);
		 
		 System.out.println("-------------------------------------------------------");
		 System.out.println("ca.getCnt() : " + ca.getCnt());
		 System.out.println("ca.getProduct_name() : " + ca.getProduct_name());
		 System.out.println("ca.getPrice() : " + ca.getPrice());
		 System.out.println("ca.getColor() : " + ca.getColor());
		 System.out.println("ca.getSize() : " + ca.getSize());
		 System.out.println("ca.getMember_id() : " + ca.getMember_id());
		 System.out.println("ca.getProduct_basicCode() : " + ca.getProduct_basicCode());
		 System.out.println("ca.getOpt_productCode() : " + ca.getOpt_productCode());

		
		
		cartGetService cartGetService = new cartGetService();
		boolean isCartUpSuccess	= cartGetService.isCartGet(ca);
		System.out.println("isCartUpSuccess : " +  isCartUpSuccess);
		
		if(!isCartUpSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('담기 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
