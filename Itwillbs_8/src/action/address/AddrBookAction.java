package action.address;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.address.AddrBookService;
import vo.ActionForward;
import vo.AddrBean;

public class AddrBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddrBookAction()!");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward = new ActionForward();
			forward.setPath("MemberLoginForm.mo");
		} else {
			AddrBookService addrBookService = new AddrBookService();
			
			ArrayList<AddrBean> addrBook = new ArrayList<AddrBean>();
			
			addrBook = addrBookService.getAddrBook(member_id);
			
			for(int i = 0;i<addrBook.size();i++) {
				System.out.println(addrBook.get(i).getNum());
				System.out.println(addrBook.get(i).getLocation());
				System.out.println(addrBook.get(i).getPostcode());
				System.out.println(addrBook.get(i).getAddress());
				System.out.println(addrBook.get(i).getMember_id());
				System.out.println(addrBook.get(i).getType());
			}
			request.setAttribute("addrBook", addrBook);
			forward = new ActionForward();
			forward.setPath("/member/addr.jsp");
			
		}
		
		return forward;
	}

}
