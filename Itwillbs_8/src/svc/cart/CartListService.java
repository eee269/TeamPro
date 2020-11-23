package svc.cart;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.cart.CartDAO;
import vo.Cart;

public class CartListService {
	
	public int getListCount() throws Exception {
		System.out.println("CartListService - getListCount()");
		int listCount = 0;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);

		close(con);
		
		return listCount;
	}
	
	
	
	public ArrayList<Cart> getCartList(int page , int limit) throws Exception  {
		System.out.println("CartListService - getCartList() ");
		
		ArrayList<Cart> CartList = null;
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);
		
		CartList = cartDAO.selectList(page, limit);
		
		close(con);
		
		return CartList;
	}

	
}
