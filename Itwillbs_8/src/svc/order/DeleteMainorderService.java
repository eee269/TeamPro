package svc.order;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.order.OrderDAO;


public class DeleteMainorderService {

	public boolean deleteMainorder(String code) {
		boolean isDelete = false;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		int cnt = orderDAO.deleteMainorder(code);
		
		if(cnt > 0) {
			commit(con);
			isDelete = true;
		} else {
			rollback(con);
		}
		
		return isDelete;
	}

}
