package action.cart;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.cart.CartPlusService;
import svc.cart.CartUpdateService;
import svc.cart.cartGetService;
import vo.ActionForward;
import vo.Cart;

public class cartGetPlusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action - cartGetPlusAction");
		HttpSession session = request.getSession();
		ActionForward forward = null;
		Cart ca = new Cart();
		boolean isPlusSuccess = false;
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
		String[] main_img = request.getParameterValues("main_img");
		int result = 0;
		
		for(int i=0; i<length; i++) {
			color[i] = color[i].trim(); 	// 색 공백제거
			size[i] = size[i].trim();  	// 사이즈 공백제거
			opt_productCode[i] = product_basicCode[i].toString() + color[i].toString() + size[i].toString();  // productCode코드
			opt_productCode[i] =  opt_productCode[i].replace(" ", ""); 	// productCode코드 공백제거
			cnt[i] = Integer.parseInt(s_cnt[i]);
			
			
			 ca = new Cart();
			 ca.setCnt(cnt[i] + ca.getCnt());
			 ca.setProduct_name(product_name);
			 ca.setPrice(price);
			 ca.setColor(color[i].toString());
			 ca.setSize(size[i]);
			 ca.setMember_id(member_id);
			 ca.setProduct_basicCode(product_basicCode[i]);
			 ca.setOpt_productCode(opt_productCode[i].toString());
			 ca.setMain_img(main_img[i]);
			 
			// 			cartUpAction -> CartPlusService -> CartDAO.cartPlus
			//--------------------------------수정하기--------------------------------------
			 // isPlusSuccess => true 면 중복 상품 있음 수량만 업데이트 
			 // isPlusSuccess => false 면 중복 상품 없음 cartGetService 로 이동
			 
			// 같은 상품 있는지 체크
			CartPlusService cartPlustService = new CartPlusService();
			 isPlusSuccess = cartPlustService.isCartPlus(ca);
			System.out.println("isPlusSuccess : " + isPlusSuccess);
			
				//--------------------------------수정하기--------------------------------------
				
			 // 이거..리스트로..바꿀까..?
			if(!isPlusSuccess) {
				cartGetService cartGetService = new cartGetService();
				isCartUpSuccess = cartGetService.isCartGet(ca);
				System.out.println("isCartUpSuccess : " +  isCartUpSuccess);
			}
		 }
		 
		
		if(!isCartUpSuccess) {
			// 수량만 업데이트
			forward = new ActionForward();
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
		} else {
			// 상품 업데이트
			forward = new ActionForward();
			forward.setPath("Cart.ca");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
