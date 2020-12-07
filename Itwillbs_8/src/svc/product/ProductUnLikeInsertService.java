package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductUnLikeInsertService {

	public int isDelete(String id,String basicCode) throws Exception{
		
		int isDelete = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		isDelete = pd.isDelete(id,basicCode);
		if(isDelete > 0) {
			commit(con);
//			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isDelete;
	}

	
	

}
