package action.address;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.address.AddrService;
import vo.ActionForward;

public class RegistDefaultAddrAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("registDefaultAddrAction()!");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(member_id == null) {
			
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			
			AddrService addrService = new AddrService();
			
			boolean isRegistSuccess = addrService.RegistDefaultAddr(member_id,postcode,address);
			
			if(isRegistSuccess) {
				out.println("<script>");
				out.println("alert('현재 배송지를 기본 배송지로 설정했습니다.')");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('현재 배송지를 기본 배송지로 설정 실패했습니다.')");
				out.println("</script>");
			}
		}
		
		return forward;
	}

}
