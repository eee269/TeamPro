package svc.cart;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.cart.CartDAO;
import vo.Cart;

public class CartListService {
	

	
	public ArrayList<Cart> getCartList(String member_id) throws Exception  {
		System.out.println("CartListService - getCartList() ");
		
		
		ArrayList<Cart> CartList = new ArrayList<Cart>();
		
		Connection con = getConnection();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		cartDAO.setConnection(con);

		CartList = cartDAO.selectList(member_id);
		
		close(con);
		
		return CartList;
	}

	
}
