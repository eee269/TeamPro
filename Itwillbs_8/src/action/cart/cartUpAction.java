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
		
		boolean isCartUpSuccess	= false;
		
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

		String[] size = request.getParameterValues("size"); // 사이즈 
		String[] color = request.getParameterValues("color"); //색  color
		
		int length = color.length;		// 반복문 횟수 = 넘어온 옵션의 갯수
		
		String[] product_basicCode = request.getParameterValues("product_basicCode");  // basicCode코드
		String[] opt_productCode = new String[length];
		String[] s_cnt = request.getParameterValues("cnt");
		int[] cnt = new int[length]; 	// 수량
		
		for(int i=0; i<length; i++) {
			color[i] = color[i].trim(); 	// 색 공백제거
			size[i] = size[i].trim();  	// 사이즈 공백제거
			opt_productCode[i] = product_basicCode[i].toString() + color[i].toString() + size[i].toString();  // productCode코드
			opt_productCode[i] =  opt_productCode[i].replace(" ", ""); 	// productCode코드 공백제거
			cnt[i] = Integer.parseInt(s_cnt[i]);
		 
		  
			 System.out.println("cnt : " + cnt[i]);
			 System.out.println("product_name : " + product_name);
			 System.out.println("price : " + price);
			 System.out.println("color : " + color[i]);
			 System.out.println("size : " + size[i]);
			 System.out.println("member_id : " + member_id);
			 System.out.println("product_basicCode : " + product_basicCode[i]);
			 System.out.println("opt_productCode : " + opt_productCode[i]);
			 
			 System.out.println("-------------------------------------------------------");

			 Cart ca = new Cart();
			 ca.setMember_id(member_id);
			 ca.setColor(color[i].toString());
			 ca.setOpt_productCode(opt_productCode[i].toString());
			 ca.setPrice(price);
			 ca.setProduct_name(product_name);
			 ca.setSize(size[i]);
			 ca.setProduct_basicCode(product_basicCode[i]);
			 ca.setCnt(cnt[i]);
			 
			 System.out.println("-------------------------------------------------------");
			 System.out.println("ca.getCnt() : " + ca.getCnt());
			 System.out.println("ca.getProduct_name() : " + ca.getProduct_name());
			 System.out.println("ca.getPrice() : " + ca.getPrice());
			 System.out.println("ca.getColor() : " + ca.getColor());
			 System.out.println("ca.getSize() : " + ca.getSize());
			 System.out.println("ca.getMember_id() : " + ca.getMember_id());
			 System.out.println("ca.getProduct_basicCode() : " + ca.getProduct_basicCode());
			 System.out.println("ca.getOpt_productCode() : " + ca.getOpt_productCode());
			 
			 
			 // 이거..리스트로..바꿀까..?
			 cartGetService cartGetService = new cartGetService();
			 isCartUpSuccess= cartGetService.isCartGet(ca);
			 System.out.println("isCartUpSuccess : " +  isCartUpSuccess);
		 }
		 
		
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
