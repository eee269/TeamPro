package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.product.ProductDAO;

public class ProductDeleteService {

	public boolean deleteProduct(String basicCode) {
		boolean isDelete = false;
		
		Connection con = getConnection();
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.setConnection(con);
		
		int count = productDAO.deleteProduct(basicCode);
		
		if(count > 0) {
			commit(con);
			isDelete = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDelete;
	}

}
