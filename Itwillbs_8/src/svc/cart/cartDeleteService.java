package svc.cart;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.cart.CartDAO;


public class cartDeleteService {

	public boolean isCartDelete(int num) {
		System.out.println("cartDeleteService - isCartDelete");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);
		
		int deleteCount = cartDAO.cartDelete(num);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}
}
