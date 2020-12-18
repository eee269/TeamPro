package action.order;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.MyorderDetailService;
import vo.ActionForward;
import vo.DetailOrderBean;
import vo.OrderBean;

public class MyorderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String mainorder_code = request.getParameter("code");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(member_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else if (!member_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('접근 권한이 없습니다.')");
			out.println("</script>");
			
			forward.setPath("Main.go");
		} else {
		MyorderDetailService service = new MyorderDetailService();
		OrderBean mainorder = service.selectMainorder(mainorder_code);
		ArrayList<DetailOrderBean> detailorderList = service.getDetailorderList(mainorder_code);
		
		System.out.println("MyorderDetailAction- detailorderList.size(): " + detailorderList.size());
		
		if(detailorderList.size() == 0) {
	
			out.println("<script>");
			out.println("alert('잘못된 접근 방법입니다. 관리자에게 문의하세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			request.setAttribute("detailorderList", detailorderList);
			request.setAttribute("mainorder", mainorder);
			
			forward = new ActionForward();
			forward.setPath("/mypage/orderDetail.jsp");
		
		}
		}
		return forward;
	}

}
