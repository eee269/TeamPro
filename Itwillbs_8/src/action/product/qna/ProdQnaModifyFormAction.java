package action.product.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.product.qna.ProdQnaService;
import vo.ActionForward;
import vo.ProdQnaBean;
import vo.ProductBean;

public class ProdQnaModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String basicCode = request.getParameter("basicCode");
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		ProdQnaService prodQnaService = new ProdQnaService();
		
		// basicCode 상품 정보 가져오기 - 제목, 메인이미지, 가격만 간단히 얻을거라 새로 메서드 만듬
		ProductBean productBean = prodQnaService.getProductInfo(basicCode);
		ProdQnaBean prodQnaBean = prodQnaService.getQna(qna_num);
		
		
		request.setAttribute("productBean", productBean);
		request.setAttribute("prodQnaBean", prodQnaBean);
		
		forward = new ActionForward();
		forward.setPath("/product/qnaModify.jsp?basicCode="+basicCode);
		
		return forward;
	}

}
