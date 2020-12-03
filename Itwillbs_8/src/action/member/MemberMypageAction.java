package action.member;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberMypageService;
import svc.order.ControlOrderListService;
import vo.ActionForward;
import vo.DetailOrderBean;
import vo.MemberBean;
import vo.OrderBean;

public class MemberMypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("</script>");
			
			forward.setPath("MemberLoginForm.mo");
		} else {
		
			MemberMypageService memberMypageService = new MemberMypageService();
			MemberBean member = memberMypageService.getMember(member_id);
			
			ArrayList<OrderBean> mainorderList = new ArrayList<OrderBean>();
			HashMap<String, ArrayList<DetailOrderBean>> detailorderList = new HashMap<String, ArrayList<DetailOrderBean>>();
	
			mainorderList = memberMypageService.getMainorderList(member_id);
			
			for (int i = 0; i < mainorderList.size(); i++) {
				OrderBean mainorder = new OrderBean();
				mainorder = mainorderList.get(i);
	
				String mainorder_code = mainorder.getCode();
				
				ArrayList<DetailOrderBean> detailorderSubList = new ArrayList<DetailOrderBean>();
				detailorderSubList = memberMypageService.getDetailorderList(mainorder_code);
				detailorderList.put(mainorder_code, detailorderSubList);
	
			}
	
			
			
			request.setAttribute("mainorderList", mainorderList);
			request.setAttribute("detailorderList", detailorderList);
			request.setAttribute("member", member);
			
			forward.setPath("/member/mypage.jsp");
		}
		
		return forward;
	}

}
