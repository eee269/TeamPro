package action.product.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.product.review.ProdReviewWriteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품 리뷰 답글 등록
		System.out.println("ProdReviewReplyAction");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("member_id");
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		String isImg = request.getParameter("isImg");
		
		// 전달할 데이터 저장
		ProdReviewBean prodReviewBean = new ProdReviewBean();
		prodReviewBean.setContent(request.getParameter("content"));
		prodReviewBean.setProduct_basicCode(request.getParameter("basicCode"));
		prodReviewBean.setMember_id(id);
		prodReviewBean.setRe_ref(re_ref);
		if(isImg.equals("ture")) {
			prodReviewBean.setProduct_img("");
		};
		ProdReviewWriteService prodReviewService = new ProdReviewWriteService();
		
		boolean isReviewSuccess = prodReviewService.registReviewReply(prodReviewBean);
		if(!isReviewSuccess) {
			// 리뷰 답글 등록 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('리뷰 답글 등록 실패!')"); 
			out.println("history.back()"); 
			out.println("</script>"); 
		}
		
		
		return null;
	}

}
