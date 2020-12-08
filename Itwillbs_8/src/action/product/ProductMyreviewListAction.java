package action.product;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.ProductMyreviewListService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProductMyreviewListAction implements Action {

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
			ProductMyreviewListService service = new ProductMyreviewListService();
			ArrayList<ProdReviewBean> proReviewList = service.getProMyreviewList(member_id);
			
			request.setAttribute("proReviewList", proReviewList);
			
			forward.setPath("/mypage/myreview.jsp");
		}
		
		return forward;
	}

}
