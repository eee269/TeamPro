package action.address;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.address.AddrBookService;
import vo.ActionForward;
import vo.AddrBean;

public class RegistDestinationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RegistDestinationAction()!");
		ActionForward forward = null;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		AddrBean addr = new AddrBean();

		addr.setLocation(request.getParameter("location"));
		addr.setPostcode(request.getParameter("postcode"));
		addr.setAddress(request.getParameter("address"));
		addr.setDetailAddress(request.getParameter("detailAddress"));
		addr.setMember_id(member_id);
		addr.setType("");
		
		if (member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward = new ActionForward();
			forward.setPath("MemberLoginForm.mo");
		} else {
			AddrBookService addrBookService = new AddrBookService();
			
			boolean isRegistSuccess = addrBookService.RegistDestination(addr);
			
			if(isRegistSuccess) {
				out.println("<script>");
				out.println("alert('배송지 추가에 성공했습니다.')");
				out.println("opener.parent.location.reload();");
				out.println("window.close()");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('배송지 추가에 실패했습니다.')");
				out.println("window.close()");
				out.println("</script>");
			}
		}
		return forward;
	}

}
