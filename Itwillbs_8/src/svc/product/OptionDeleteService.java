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
		
		// option 테이블에 남은 basicCode기준 옵션 수 체크
		int resultOptCount = productDAO.deleteOption(productCode);

		/*
		 *  option 테이블에 남은 basicCode가 있으면 커밋
		 *  없으면 Action에서 productDelete.po로 포워딩
		 */
		if(resultOptCount > 0) {
			commit(con);
			isDelete = true;
		}
		
		close(con);
		
		return isDelete;
	}



}
