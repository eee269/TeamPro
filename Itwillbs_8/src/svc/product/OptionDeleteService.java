package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.product.ProductDAO;

public class OptionDeleteService {

	public boolean getDeleteOption(String productCode) {
		boolean isDelete = false;
		
		Connection con = getConnection();
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.setConnection(con);
		int count = productDAO.deleteOption(productCode);

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
