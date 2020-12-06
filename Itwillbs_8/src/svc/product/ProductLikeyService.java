package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductLikeyService {

	public int isLikey(String basicCode) throws Exception{
		
		int isLikey = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		isLikey = pd.isLikey(basicCode);
		if(isLikey > 0) {
			commit(con);
//			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isLikey;
	}

	
	

}
