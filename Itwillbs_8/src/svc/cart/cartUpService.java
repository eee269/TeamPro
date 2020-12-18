package svc.cart;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.cart.CartDAO;

public class cartUpService {
	
	
	public boolean isCartUp() throws Exception{
		System.out.println("cartDeleteService - isCartUp");
		
		boolean isCartUpSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);

		int upCount = 0;	
		
		
		if(upCount > 0) {
			commit(con);
			isCartUpSuccess = true;
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		
		
		
		return isCartUpSuccess;
		
		
		
		
	}
}
