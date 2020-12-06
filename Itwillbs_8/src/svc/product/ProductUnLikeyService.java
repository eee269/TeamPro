package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductUnLikeyService {

	public int isUnLikey(String basicCode) throws Exception{
		
		int isUnLikey = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		isUnLikey = pd.isUnLikey(basicCode);
		if(isUnLikey > 0) {
			commit(con);
//			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isUnLikey;
	}

	
	

}
