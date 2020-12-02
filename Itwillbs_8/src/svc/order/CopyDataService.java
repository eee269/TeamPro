package svc.order;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.order.OrderDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;
public class CopyDataService implements IntefaceSVC {

	public ArrayList<JSONArray> CopyData(String member_id) {
		System.out.println("CopyDataService - CopyData()!");
//		Connection con = getConnection();
//		OrderDAO orderDAO = OrderDAO.getInstance();
//		orderDAO.setConnection(con);
//		JSONArray mb = orderDAO.getData(member_id);
//		close(con);
		ArrayList<JSONArray> mb =  process(member_id);
		
		return mb;
	}

	@Override
	public ArrayList<JSONArray> process(String member_id) {
		System.out.println("interfaceSVC - process");
		Connection con = getConnection();
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		ArrayList<JSONArray> mb = orderDAO.getData(member_id);
		return mb;
	}

}
interface IntefaceSVC {


	public abstract ArrayList<JSONArray> process(String member_id);


} 



