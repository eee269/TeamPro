package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import dao.order.OrderDAO;
import vo.Cart;

import static db.JdbcUtil.*;


public class OrderService {
	public ArrayList<Cart> getSelectCart(int num) {
	System.out.println("orderService - getSelectCart()");
	
	ArrayList<Cart> cartList = new ArrayList<Cart>();
	
	Connection con = getConnection();
	
	OrderDAO orderDAO = OrderDAO.getInstance();
	
	orderDAO.setConnection(con);
	
	cartList = orderDAO.selectCart(num);
//			
	close(con);
	
	return cartList;
	}
}
