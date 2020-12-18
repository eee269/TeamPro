package action.product.qna;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.qna.ProductMyqnaListService;
import vo.ActionForward;
import vo.ProdQnaBean;

public class ProductMyqnaListAction implements Action {

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
			ProductMyqnaListService service = new ProductMyqnaListService();
			ArrayList<ProdQnaBean> myqnaList = service.getMyqnaList(member_id);
			
			request.setAttribute("myqnaList", myqnaList);
			
			forward.setPath("/mypage/myqna.jsp");
		}
		
		
		return forward;
	}

}
