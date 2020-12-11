package action.product.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberMypageService;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;
import vo.MemberBean;
import vo.ProductBean;

public class ProdQnaWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		String basicCode = request.getParameter("basicCode");
		
		ProdQnaService prodQnaService = new ProdQnaService();
		MemberMypageService memberMypageService = new MemberMypageService();
		
		// 로그인 시 유저 정보 가져오기
		// basicCode 상품 정보 가져오기 - 제목, 메인이미지, 가격만 간단히 얻을거라 새로 메서드 만듬
		ProductBean productBean = prodQnaService.getProductInfo(basicCode);
		
		request.setAttribute("productBean", productBean);
		
		if(member_id!=null) {
		MemberBean memberBean = memberMypageService.getMember(member_id);
		request.setAttribute("memberBean", memberBean);
		}
		
		forward = new ActionForward();
		forward.setPath("/product/qnaWrite.jsp?basicCode="+basicCode);
		
		return forward;
	}
	
}
