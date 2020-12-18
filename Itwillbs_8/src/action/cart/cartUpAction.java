package action.cart;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class cartUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("cartUpAction");
		HttpSession session = request.getSession();

		String member_id = (String) session.getAttribute("member_id"); 	// 아이디
		String name = request.getParameter("name");	// 상품이름
		int price = Integer.parseInt(request.getParameter("price"));	// 가격
		String color = request.getParameter("color");	//색
		color = color.trim();
		
		String size = request.getParameter("size");	//사이즈
		size = size.trim();
		
		String basicCode = request.getParameter("basicCode"); 
		
		String productCode = basicCode + color + size;
		productCode = productCode.replace(" ", "");
		
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		String cnt2 = request.getParameter("cnt"); 
		
		System.out.println("member_id :" + member_id);
		System.out.println("name :" + name);
		System.out.println("price :" + price);
		System.out.println("color :" + color);
		System.out.println("size :" + size);
		System.out.println("basic_code :" + basicCode);
		System.out.println("productCode :" + productCode);
		
			System.out.println("cnt :" + cnt);
			System.out.println("cnt2 :" + cnt2);

		
		ActionForward forward = new ActionForward();
		
		
		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		}
		
		
		
		
		return forward;
	}

}
