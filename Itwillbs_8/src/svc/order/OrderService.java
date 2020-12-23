package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import dao.order.OrderDAO;
import vo.Cart;

import static db.JdbcUtil.*;


public class OrderService {
	public ArrayList<Cart> getSelectCart(String[] nums) {
	System.out.println("orderService - getSelectCart()");
	
	ArrayList<Cart> cartList = new ArrayList<Cart>();
	Cart cart = null;
	
	Connection con = getConnection();
	
	OrderDAO orderDAO = OrderDAO.getInstance();
	
	orderDAO.setConnection(con);
	
	cart = new Cart();
	
	while(cartList.size()!=nums.length) {
	for(String str : nums) {
		cart = orderDAO.selectCart(Integer.parseInt(str));
		
		cartList.add(cart);
		}
	}
	
	close(con);
	
	return cartList;
	}

}
