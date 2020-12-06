package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductLikeInsertService {

	public int isInsert(String id,String basicCode) throws Exception{
		
		int isInsert = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		isInsert = pd.isInsert(id,basicCode);
		if(isInsert > 0) {
			commit(con);
//			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isInsert;
	}

	
	

}
