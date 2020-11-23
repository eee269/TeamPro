package action.product;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.ProductUploadService;
import vo.ActionForward;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductUploadPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductUploadPro.po");
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/product/uploadImg";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest
				(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String mainImg = multi.getOriginalFileName("mfile1");
		
		if(multi.getOriginalFileName("mfile2") != null) {
			mainImg += "/" + multi.getOriginalFileName("mfile2"); 
		}
		if(multi.getOriginalFileName("mfile3") != null) {
			mainImg += "/" + multi.getOriginalFileName("mfile3"); 
		}
		
		String subImg = multi.getOriginalFileName("sfile1");
		
		if(multi.getOriginalFileName("sfile2") != null) {
			subImg += "/" + multi.getOriginalFileName("sfile2"); 
		}
		if(multi.getOriginalFileName("sfile3") != null) {
			subImg += "/" + multi.getOriginalFileName("sfile3"); 
		}
		
		ProductUploadService productUploadService = new ProductUploadService();
		
		System.out.println(mainImg + ", " + subImg);
		
		// 상품 기본코드 ex 0001, 0002...
		// 가장 큰 기본코드 가져와서 +1 한 값을 String형식으로 저장
		String basicCode = String.format("%4d", productUploadService.getMaxBasicCode()).replace(' ', '0');
		
		
		
		ProductBean productBean = new ProductBean();
		productBean.setBasicCode(basicCode);
		productBean.setName(multi.getParameter("goods_name"));
		productBean.setPrice(Integer.parseInt(multi.getParameter("goods_price")));
		productBean.setStock(Integer.parseInt(multi.getParameter("goods_stock")));
		productBean.setMain_img(mainImg);
		productBean.setSub_img(subImg);
		productBean.setXcode("xcode");
		productBean.setNcode("ncode");
		
		// 상품을 DB에 넣기
		boolean isSuccessProduct = productUploadService.uploadProduct(productBean);
		boolean isSuccessOption = false;
		if(!isSuccessProduct) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('상품 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
		
			String[] color = multi.getParameterValues("goods_color");
			String[] size = multi.getParameterValues("goods_size");
	
			for(int i=0; i<color.length; i++) {
				for(int j=0; j<size.length; j++) {
					ProductOptionBean optionBean = new ProductOptionBean();
					optionBean.setColor(color[i]);
					optionBean.setSize(size[j]);
					
					String productCode = basicCode + color[i] + size[j];
					optionBean.setProductCode(productCode);
					optionBean.setBasicCode(basicCode);
					
					// option을 DB에 등록
					isSuccessOption = productUploadService.uploadOption(optionBean);
	//				System.out.println(basicCode + ", " + productCode);
					
					if(!isSuccessOption) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();

						out.println("<script>");
						out.println("alert('상품 등록 실패!')");
						out.println("history.back()");
						out.println("</script>");
					}
				}
			}
		}
		 if(isSuccessOption){
				forward = new ActionForward();
				forward.setPath("/member/control_goods.jsp");
				forward.setRedirect(true);
			}
		
		
		
		return forward;
	}

}
