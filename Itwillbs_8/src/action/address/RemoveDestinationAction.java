package action.address;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.address.AddrBookService;
import vo.ActionForward;
import vo.AddrBean;

public class RemoveDestinationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RemoveDestinationAction()!");
		ActionForward forward = null;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");


		String postcode = request.getParameter("postcode");
		System.out.println(postcode);
		if (member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward = new ActionForward();
			forward.setPath("MemberLoginForm.mo");
		} else {
AddrBookService addrBookService = new AddrBookService();
			
			boolean isRemoveSuccess = addrBookService.RemoveDestination(postcode);
			
			if(isRemoveSuccess) {
				out.println("<script>");
				out.println("alert('배송지 삭제에 성공했습니다.')");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('배송지 삭제에 실패했습니다.')");
				out.println("window.close()");
				out.println("</script>");
			}
		}
		return forward;
	}

}
