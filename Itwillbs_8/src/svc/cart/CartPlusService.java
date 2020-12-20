package svc.cart;

import java.sql.Connection;

import dao.cart.CartDAO;
import vo.Cart;

import static db.JdbcUtil.*;

public class CartPlusService {
	
	public boolean isCartPlus(Cart ca) {
		System.out.println("CartPlusService - isCartPlus");
		
		int PlusCount = 0;
		boolean isPlusSuccess = false;
		
		Connection con = getConnection();
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.setConnection(con);
		
		PlusCount = cartDAO.cartPlus(ca);
		System.out.println("PlusCount : " + PlusCount);
		if(PlusCount > 0) {
			commit(con);
			isPlusSuccess = true;
		} else {
			rollback(con);

		}
		
		
		
		return isPlusSuccess;
		
	}
}
