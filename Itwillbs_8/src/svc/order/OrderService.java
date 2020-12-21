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
	
//	cartList = orderDAO.selectCart(num);
	cart = new Cart();
	while(cartList.size()!=nums.length) {
	for(String str : nums) {
		cart = orderDAO.selectCart(Integer.parseInt(str));
		
		cartList.add(cart);
	}
	}
//	System.out.println("Service : "+cart.getNum());
//	System.out.println("Service : "+cart.getCnt());
//	System.out.println("Service : "+cart.getProduct_name());
//	System.out.println("Service : "+cart.getPrice());
//	System.out.println("Service : "+cart.getColor());
//	System.out.println("Service : "+cart.getSize());
//	System.out.println("Service : "+cart.getMember_id());
//	System.out.println("Service : "+cart.getProduct_basicCode());
//	System.out.println("Service : "+cart.getOpt_productCode());
	
	if(!cartList.isEmpty()) {
		for(int i = 0 ; i <cartList.size() ; i++) {
			System.out.println("Service List : "+cartList.get(i).getNum());
			System.out.println("Service List : "+cartList.get(i).getCnt());
			System.out.println("Service List : "+cartList.get(i).getProduct_name());
			System.out.println("Service List : "+cartList.get(i).getPrice());
			System.out.println("Service List : "+cartList.get(i).getColor());
			System.out.println("Service List : "+cartList.get(i).getSize());
			System.out.println("Service List : "+cartList.get(i).getMember_id());
			System.out.println("Service List : "+cartList.get(i).getProduct_basicCode());
			System.out.println("Service List : "+cartList.get(i).getOpt_productCode());
		}
	}
	
	close(con);
	
	return cartList;
	}

}
