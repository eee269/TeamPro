package svc.cart;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.cart.CartDAO;
import vo.Cart;

public class cartUpService {
	
	
	public boolean isCartUp(Cart ca) throws Exception{
		System.out.println("cartDeleteService - isCartUp");
		
		int upCount = 0;	
		
		boolean isCartUpSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);

		upCount = cartDAO.cartUp(ca);
		System.out.println("upCount : " + upCount);
		
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
