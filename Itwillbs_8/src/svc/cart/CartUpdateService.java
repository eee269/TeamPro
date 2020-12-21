package svc.cart;

import java.sql.Connection;

import dao.cart.CartDAO;

import static db.JdbcUtil.*;

public class CartUpdateService {

	public boolean isCartUpdate(int num , int cnt) throws Exception {
		System.out.println("CartUpdateService - isCartUpdate");
		
		int updateCount = 0;

		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);
		
		updateCount = cartDAO.cartUpdate(num, cnt);
		
		if(updateCount > 0) {
			System.out.println("업데이트서비스 : " + updateCount);
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		
		}
		close(con);
		
		
		return isUpdateSuccess;
	}
}
