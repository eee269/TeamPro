package action.order;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.order.ControlOrderListService;
import vo.ActionForward;
import vo.DetailOrderBean;
import vo.OrderBean;

public class ControlOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

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
			
			ControlOrderListService controlOrderListService = new ControlOrderListService();
	
			ArrayList<OrderBean> mainorderList = new ArrayList<OrderBean>();
			HashMap<String, ArrayList<DetailOrderBean>> detailorderList = new HashMap<String, ArrayList<DetailOrderBean>>();
	
			mainorderList = controlOrderListService.getMainorderList();
					
			for (int i = 0; i < mainorderList.size(); i++) {
				OrderBean mainorder = new OrderBean();
				mainorder = mainorderList.get(i);
	
				String mainorder_code = mainorder.getCode();
				
				ArrayList<DetailOrderBean> detailorderSubList = new ArrayList<DetailOrderBean>();
				detailorderSubList = controlOrderListService.getDetailorderList(mainorder_code);
				detailorderList.put(mainorder_code, detailorderSubList);
	
			}
	
			request.setAttribute("mainorderList", mainorderList);
			request.setAttribute("detailorderList", detailorderList);
	
			forward.setPath("/admin_control/control_order.jsp");
		}
		return forward;
	}

}
