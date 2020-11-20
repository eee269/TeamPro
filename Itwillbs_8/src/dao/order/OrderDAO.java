package dao.order;

import java.sql.Connection;
import java.util.Date;

import com.sun.xml.internal.ws.Closeable;

import vo.OrderBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import static db.JdbcUtil.*;

public class OrderDAO {
	Connection con;
	
	// 싱글톤 패턴 활용
	private OrderDAO() {}
	
	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
		
	}
	
	public String createOrderCode() {
		String orderCode = null;
		Date now = new Date();
		
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		
		String date = format.format(now);
		
		int index = 1;
		
		orderCode = date + index;
		index++;
		
		return orderCode;
	}

	public int insertOrder(OrderBean ob) {
		System.out.println("OrderDAO - insertOrder()!");
		int insertCount = 0;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		try {
			String sql = "INSERT INTO teampro.order VALUES(?,?,?,?,?,?,?,?)";
			p = con.prepareStatement(sql);
			p.setString(1, ob.getCode());
			p.setString(2, ob.getName());
			p.setString(3, ob.getPhone());
			p.setString(4, ob.getAddress());
			p.setTimestamp(5, ob.getDate());
			p.setString(6, ob.getStatus());
			p.setString(7, ob.getPayment());
			p.setString(8, ob.getMember_id());
			
			System.out.println(ob.getCode());
			System.out.println(ob.getName());
			System.out.println(ob.getPhone());
			System.out.println(ob.getAddress());
			System.out.println(ob.getDate());
			System.out.println(ob.getStatus());
			System.out.println(ob.getPayment());
			System.out.println(ob.getMember_id());
			
			insertCount = p.executeUpdate();
		} catch (Exception e) {
			System.out.println("OrderDAO insertOrder() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(p);
			close(rs); 
		}
		
		return insertCount;
	}

}
