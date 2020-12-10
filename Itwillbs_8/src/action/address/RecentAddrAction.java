package action.address;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import action.Action;
import svc.address.AddrService;
import vo.ActionForward;

public class RecentAddrAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RecentAddrAction");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String addrType = request.getParameter("addrType");
		System.out.println("addrType : " +addrType);
		
		if(member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
			AddrService addrService = new AddrService();
			
			ArrayList<JSONArray> recentAddr = null;
			
			recentAddr = addrService.getRecentAddr(member_id);
			request.setAttribute("recentAddr", recentAddr);
			forward.setPath("address/recentaddr.jsp");
		}
		
		return forward;
	}

}
