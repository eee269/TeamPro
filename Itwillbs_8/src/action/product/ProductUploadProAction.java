package action.product;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.product.ProductDeleteService;
import svc.product.ProductUploadService;
import vo.ActionForward;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductUploadProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductUploadPro.po");
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/upload/productUploadImg";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest
				(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String mainImg = multi.getFilesystemName("mfile1");
	      
	      if(multi.getFilesystemName("mfile2") != null) {
	         mainImg += "/" + multi.getFilesystemName("mfile2"); 
	      }
	      if(multi.getFilesystemName("mfile3") != null) {
	         mainImg += "/" + multi.getFilesystemName("mfile3"); 
	      }
	      
	      String subImg = multi.getFilesystemName("sfile1");
	      
	      if(multi.getFilesystemName("sfile2") != null) {
	         subImg += "/" + multi.getFilesystemName("sfile2"); 
	      }
	      if(multi.getFilesystemName("sfile3") != null) {
	         subImg += "/" + multi.getFilesystemName("sfile3"); 
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
		productBean.setMain_img(mainImg);
		productBean.setSub_img(subImg);

		String xcode = multi.getParameter("xcode");
		String ncode = "";
		
		productBean.setXcode(xcode);
		
		if(xcode.equals("CLOTHES")) {
			ncode = multi.getParameter("clothes");
		} else if(xcode.equals("BAGS")) {
			ncode = multi.getParameter("bag");
		} else if(xcode.equals("SHOES")) {
			ncode = multi.getParameter("shoes");
		} 
		productBean.setNcode(ncode);
		
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
					
					String stock_name = color[i] + "/" + size[j];
					int stock = Integer.parseInt(multi.getParameter(stock_name));
					optionBean.setStock(stock);
					
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
						
						ProductDeleteService productDeleteService = new ProductDeleteService();
						productDeleteService.deleteProduct(basicCode);
					}
				}
			}
		}
		 if(isSuccessOption){
				forward = new ActionForward();
				forward.setPath("ControlProductList.po");
				forward.setRedirect(true);
			}
		
		
		
		return forward;
	}

}
