package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import dao.order.OrderDAO;

import static db.JdbcUtil.*;

import vo.DetailOrderBean;
import vo.OrderBean;

public class ControlOrderListService {

	public ArrayList<OrderBean> getMainorderList() {
		ArrayList<OrderBean> mainorderList = new ArrayList<OrderBean>();
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		mainorderList = orderDAO.getMainorder();
		
		close(con);
		
		return mainorderList;
	}

	public int getDetailOrderCount(String mainorder_code) {
		int count = 0;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		count = orderDAO.getDetailorderCount(mainorder_code);
		
		close(con);
		
		return count;
	}

	public ArrayList<DetailOrderBean> getDetailorderList(String mainorder_code) {
		ArrayList<DetailOrderBean> detailorderList = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		detailorderList = new ArrayList<DetailOrderBean>();
		detailorderList = orderDAO.getDetailorderList(mainorder_code);
		
		close(con);
		
		return detailorderList;
	}

}
