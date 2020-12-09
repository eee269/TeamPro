package dao.order;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.xml.internal.ws.Closeable;

import vo.Cart;
import vo.DetailOrderBean;
import vo.OrderBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public int insertOrder(OrderBean ob) {
		System.out.println("OrderDAO - insertOrder()!");
		int insertCount = 1;
		
		PreparedStatement p = null;
		
		try {
			String sql = "INSERT INTO mainorder VALUES(?,?,?,?,?,?,?,?,?)";
			p = con.prepareStatement(sql);
			p.setString(1, ob.getCode());
			p.setString(2, ob.getName());
			p.setString(3, ob.getPhone());
			p.setString(4, ob.getAddress());
			p.setTimestamp(5, ob.getDate());
			p.setString(6, ob.getStatus());
			p.setString(7, ob.getPayment());
			p.setString(8, ob.getMember_id());
			p.setInt(9, ob.getTotal_price());
			
			insertCount = p.executeUpdate();
			System.out.println("insertCount : " +insertCount);
		} catch (Exception e) {
			System.out.println("OrderDAO insertOrder() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(p);
		}
		
		return insertCount;
	}

	public ArrayList<OrderBean> selectOrderList(String member_id) {
		System.out.println("OrderDAO - selectOrderList()");
		ArrayList<OrderBean> orderList = null;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM mainorder where member_id = ?";
			p = con.prepareStatement(sql);
			p.setString(1, member_id);
			rs = p.executeQuery();
			
			orderList = new ArrayList<OrderBean>();
			
			while(rs.next()) {
				OrderBean order = new OrderBean();
				
				order.setCode(rs.getString(1));
				order.setName(rs.getString(2));
				order.setPhone(rs.getString(3));
				order.setAddress(rs.getString(4));
				order.setDate(rs.getTimestamp(5));
				order.setStatus(rs.getString(6));
				order.setPayment(rs.getString(7));
				order.setMember_id(rs.getString(8));
				order.setTotal_price(rs.getInt("total_price"));
				
				orderList.add(order);
			}
			
			
		} catch (Exception e) {
			System.out.println("selectOrderList() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(p);
			close(rs);
		}
		
		return orderList;
	}

	public JSONArray getData(String member_id) {
		System.out.println("OrderDAO - getData()");
		JSONArray md = new JSONArray();
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		try {
		String sql = "select * from member where id = ?";
		p = con.prepareStatement(sql);
		p.setString(1, member_id);
		rs = p.executeQuery();
		if(rs.next()){
			JSONObject mb = new JSONObject();
			mb.put("id",rs.getString("id"));
			mb.put("name",rs.getString("pass"));
			mb.put("email",rs.getString("email"));
			
			mb.put("phone_0",rs.getString("phone").substring(0, 3));
			mb.put("phone_1",rs.getString("phone").substring(3, 7));
			mb.put("phone_2",rs.getString("phone").substring(7));
			
			
			
			md.add(mb);

			}
		} catch (Exception e) {
			System.out.println("getData() 오류! - " +e.getMessage());
			e.printStackTrace();
		}
		return md;
	}

	public ArrayList<OrderBean> getMainorder() {
		ArrayList<OrderBean> mainorderList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from mainorder order by date desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			mainorderList = new ArrayList<OrderBean>();
			
			while(rs.next()) {
				OrderBean order = new OrderBean();
				
				order.setCode(rs.getString("code"));
				order.setName(rs.getString("name"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setStatus(rs.getString("status"));
				order.setPayment(rs.getString("payment"));
				order.setMember_id(rs.getString("member_id"));
				order.setDate(rs.getTimestamp("date"));
				
				mainorderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return mainorderList;
	}

	public ArrayList<DetailOrderBean> getDetailorderList(String mainorder_code) {
		ArrayList<DetailOrderBean> detailorderList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from detailorder where mainorder_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mainorder_code);
			rs = pstmt.executeQuery();
			
			detailorderList = new ArrayList<DetailOrderBean>();
			while(rs.next()) {
				DetailOrderBean order = new DetailOrderBean();
				
				order.setNum(rs.getInt("num"));
				order.setName(rs.getString("name"));
				order.setMain_img(rs.getString("main_img"));
				order.setPrice(rs.getInt("price"));
				order.setCnt(rs.getInt("cnt"));
				order.setColor(rs.getString("color"));
				order.setSize(rs.getString("size"));
				order.setMainorder_code(mainorder_code);
				order.setOpt_productCode(rs.getString("opt_productCode"));
				order.setDate(rs.getTimestamp("date"));
				
				detailorderList.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return detailorderList;
	}

	public int updateMainorder(String code, String status) {
		int cnt = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update mainorder set status=? where code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, code);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cnt;
	}

	public int deleteMainorder(String code) {
		int cnt = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from mainorder where code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cnt;
	}

	//--------------------code에 해당하는 mainorder하나 들고오기------------------------
	public OrderBean selectMainorder(String code) {
		OrderBean mainorder = new OrderBean();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from mainorder where code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mainorder.setAddress(rs.getString("address"));
				mainorder.setCode(code);
				mainorder.setDate(rs.getTimestamp("date"));
				mainorder.setMember_id(rs.getString("member_id"));
				mainorder.setName(rs.getString("name"));
				mainorder.setPayment(rs.getString("payment"));
				mainorder.setPhone(rs.getString("phone"));
				mainorder.setStatus(rs.getString("status"));
				mainorder.setTotal_price(rs.getInt("total_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mainorder;
	}

	public ArrayList<Cart> selectCart(int num) {
		System.out.println("orderDAO - selectCart()!");
		ArrayList<Cart> cartList = null;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from cart where num = ?";
			p = con.prepareStatement(sql);
			p.setInt(1, num);
			rs = p.executeQuery();
			
			cartList = new ArrayList<Cart>();
			
			while(rs.next()) {
				Cart cart = new Cart();
				
				cart.setNum(rs.getInt(1));
				cart.setCnt(rs.getInt(2));
				cart.setProduct_name(rs.getString(3));
				cart.setPrice(rs.getInt(4));
				cart.setColor(rs.getString(5));
				cart.setSize(rs.getString(6));
				cart.setMember_id(rs.getString(7));
				cart.setProduct_basicCode(rs.getString(8));
				cart.setOpt_productCode(rs.getString(9));
				
				cartList.add(cart);
			}
			
			
		} catch (Exception e) {
			System.out.println("selectCart() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(p);
		}
		
		return cartList;
	}

	public int insertDetailOrder(int num, String code) {
		System.out.println("OrderDAO - insertDetailOrder()-1!");
		int insertCount = 0;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		int num1= 1;
		try {
			String sql = "select max(num) from detailorder";
			p = con.prepareStatement(sql);
			rs = p.executeQuery();
			
			if(rs.next()) {
				num1 =  rs.getInt(1)+1;
			}
			sql = "select * from cart where num = ?";
			
			p = con.prepareStatement(sql);
			p.setInt(1, num);
			rs = p.executeQuery();
			 
			if(rs.next()) {
				System.out.println("OrderDAO - insertDetailOrder()-2!");

				String name = rs.getString(3);
				int price =  rs.getInt(4);
				int cnt =  rs.getInt(2);
				String color = rs.getString(5);
				String size = rs.getString(6);
				String opt_productCode = rs.getString(9);
				sql = "select * from mainorder where code = ?";
				p = con.prepareStatement(sql);
				p.setNString(1, code);
				rs = p.executeQuery();
				
				if(rs.next()) {
					System.out.println("OrderDAO - insertDetailOrder()-3!");

					sql = "insert into detailorder values(?,?,?,?,?,?,?,?,?,?)";
					p = con.prepareStatement(sql);
					p.setInt(1, num1);
					p.setNString(2, name);
					p.setString(3, "null");
					p.setInt(4, price);
					p.setInt(5, cnt);
					p.setTimestamp(6, rs.getTimestamp(5));
					p.setString(7, color);
					p.setString(8, size);
					p.setString(9, code);
					p.setString(10, opt_productCode);
					
					insertCount = p.executeUpdate();
				}
				
			}
		} catch (Exception e) {
			System.out.println("OrderDAO insertDetailOrder() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(p);
		}
		
		return insertCount;
	}

}
