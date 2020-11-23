package action.product;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.ProdReviewWriteService;
import vo.ActionForward;
import vo.ProdReviewBean;

public class ProdReviewWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 상품 리뷰 등록
		System.out.println("ProdReviewWriteAction");
		
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/productUpload";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024 * 1024 * 10; // 10mb
		
		MultipartRequest multi = new MultipartRequest(
				request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		// 전달할 데이터 저장
		ProdReviewBean prodReviewBean = new ProdReviewBean();
		prodReviewBean.setNum(Integer.parseInt(multi.getParameter("num")));
		prodReviewBean.setSubject(multi.getParameter("subject"));
		prodReviewBean.setContent(multi.getParameter("sontent"));
		prodReviewBean.setStarScore(Integer.parseInt(multi.getParameter("starScore")));
		prodReviewBean.setGoodsCode(multi.getParameter("goodsCode"));
		prodReviewBean.setId(multi.getParameter("id"));
		prodReviewBean.setUsername(multi.getParameter("username"));
		
		
		ProdReviewWriteService prodReviewService = new ProdReviewWriteService();
		
		boolean isReviewSuccess = prodReviewService.registReview(prodReviewBean);
		if(!isReviewSuccess) {
			// 리뷰 등록 실패 시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('리뷰 등록 실패!')"); 
			out.println("history.back()"); 
			out.println("</script>"); 
		}else {
			// 리뷰 등록 성공
			forward = new ActionForward();
			forward.setPath("ProductList.po?goodsCode="+multi.getParameter("goodsCode"));
			// 상품 상세 페이지에서 리뷰 단다는 가정하에 dispatcher 방식으로 지정했음
		}
		
		return forward;
	}
	
}
