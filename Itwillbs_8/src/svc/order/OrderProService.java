package svc.order;

import java.sql.Connection;

import dao.order.OrderDAO;
import vo.OrderBean;

import static db.JdbcUtil.*;

public class OrderProService {
		public boolean InsertOrder(OrderBean ob) {
			System.out.println("OrderProService - InsertOrder!");
			boolean isInsertSuccess = false;
			
			Connection con = getConnection();
			
			OrderDAO orderDAO = OrderDAO.getInstance();
			
			orderDAO.setConnection(con);
			
			int insertCount = orderDAO.insertOrder(ob);
			
			if(insertCount > 0) {
				commit(con);
				isInsertSuccess = true;
			} else {
				rollback(con);
			}
			
			close(con);
			
			return isInsertSuccess;
		}

		public boolean insertDetailOrder(String[] nums, String code) {
			System.out.println("OrderProService - InsertDetailOrder!");
			boolean isInsertSuccess = false;
			
			Connection con = getConnection();
			
			OrderDAO orderDAO = OrderDAO.getInstance();
			
			orderDAO.setConnection(con);
			
			for(String str : nums) {
				System.out.println("orderPRo : "+str);
			}
			int insertCount = orderDAO.insertDetailOrder(nums,code);
			
			if(insertCount > 0) {
				commit(con);
				isInsertSuccess = true;
			} else {
				rollback(con);
			}
			
			close(con);
			return isInsertSuccess;
		}
}
