package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductLikeService {

	public boolean isLike(String id,String basicCode) throws Exception{
		
		boolean isLike = false;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		isLike = pd.isLike(id,basicCode);
		
		close(con);
		
		return isLike;
	}

	
	

}
