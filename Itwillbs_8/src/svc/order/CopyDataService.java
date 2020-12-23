package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.order.OrderDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class CopyDataService {

	public ArrayList<JSONArray> CopyData(String member_id) {
		System.out.println("CopyDataService - CopyData()!");
		
		ArrayList<JSONArray> mb = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		mb = orderDAO.getData(member_id);

		close(con);
		
		return mb;
	}

}
