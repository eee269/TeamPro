package svc.cart;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.cart.CartDAO;


public class cartDeleteService {

	public boolean isCartDelete(String[] num) {
		System.out.println("cartDeleteService - isCartDelete");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);
		
		int deleteCount = 0;	
		
		for(String i : num) {		
		deleteCount += cartDAO.cartDelete(Integer.parseInt(i));
		}
		
		
		if(deleteCount == num.length) {
			commit(con);
			isDeleteSuccess = true;
			
		} else {
			rollback(con);
			
		}
		
		close(con);
		
		return isDeleteSuccess;
	}
}
