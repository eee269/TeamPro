package action.order;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import action.Action;
import svc.order.CopyDataService;
import vo.ActionForward;
import vo.MemberBean;

public class CopyDataAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CopyDataAction!");
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		ActionForward forward = null;
		if(member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
		CopyDataService copyData = new CopyDataService();
		
		ArrayList<JSONArray> mb = copyData.CopyData(member_id);
		
		if(mb == null) {
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('데이터없음");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("order/orderPro.jsp");
			request.setAttribute("mb", mb);
		}
		}
		return forward;
	}

}
