package svc.order;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.order.OrderDAO;
import vo.DetailOrderBean;
import vo.OrderBean;

public class MyorderDetailService {

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

	public OrderBean selectMainorder(String mainorder_code) {
		OrderBean mainorder = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		mainorder = new OrderBean();
		mainorder = orderDAO.selectMainorder(mainorder_code);
		
		close(con);
		
		return mainorder;
	}
}
