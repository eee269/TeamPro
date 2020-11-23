package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.product.ProductDAO;
import vo.ProductBean;
import vo.ProductOptionBean;


public class ProductUploadService {

	public int getMaxBasicCode() {
		int basicCode = 0;
		
		Connection con = getConnection();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		productDAO.setConnection(con);

		basicCode = productDAO.getBasicCode() + 1;
		
		close(con);
		
		
		return basicCode;
	}

	public boolean uploadProduct(ProductBean productBean) {
		boolean isUploadProduct = false;

		Connection con = getConnection();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		productDAO.setConnection(con);

		int cnt = productDAO.insertProduct(productBean);
		
		if(cnt > 0) {
			commit(con);
			isUploadProduct = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUploadProduct;
	}

	public boolean uploadOption(ProductOptionBean optionBean) {
		boolean isUploadOption = false;

		Connection con = getConnection();
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		productDAO.setConnection(con);

		int cnt = productDAO.insertOption(optionBean);
		
		if(cnt > 0) {
			commit(con);
			isUploadOption = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isUploadOption;
	}
	
}
