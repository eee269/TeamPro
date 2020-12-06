package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import dao.order.OrderDAO;
import vo.OrderBean;

import static db.JdbcUtil.*;

public class OrderListService {

	public ArrayList<OrderBean> getOrderList(String member_id) {
		System.out.println("OrderListService - getOrderList()!");
		ArrayList<OrderBean> orderList = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		orderList = orderDAO.selectOrderList(member_id);
		
		close(con);
		
		return orderList;
	}

}
