package svc.cart;

import java.sql.Connection;

import dao.cart.CartDAO;

import static db.JdbcUtil.*;

public class cartAllDeleteService {
	
	
	public boolean isCartAllDelete(String member_id , int num) {
		System.out.println("cartAllDeleteService - isCartAllDelete");
		
		boolean isAllDeleteSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);
		int AllCount = cartDAO.cartAllDelete(member_id , num);
				
		
		if(AllCount > 0) {
			commit(con);
			isAllDeleteSuccess = true;
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		
		return isAllDeleteSuccess;
				
	}
}
