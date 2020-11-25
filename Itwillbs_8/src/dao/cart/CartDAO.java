package dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Cart;

import static db.JdbcUtil.*;

public class CartDAO extends Exception {
	// ==================================================
	private CartDAO() {}
	
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
			return instance;
	}
	// ==================================================
	
	Connection con;
	
	public void setConnection(Connection con) {
		
		this.con = con;
		
	}
	
	

	// 주문 조회
	public ArrayList<Cart> selectList() {
		System.out.println("CartDAO - selectList");
		ArrayList<Cart> CartList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			String sql = "SELECT * FROM cart ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		    CartList = new ArrayList<Cart>();
			 
			while(rs.next()) {
				Cart cart = new Cart();
			
			cart.setNum(rs.getInt("num"));
			cart.setCnt(rs.getInt("cnt"));
			cart.setColor(rs.getString("color"));
			cart.setSize(rs.getString("size"));
			cart.setMember_id(rs.getString("member_id"));
			cart.setGoods_code(rs.getString("goods_code"));
			cart.setPrice(rs.getInt("price"));
			cart.setGoods_name(rs.getString("goods_name"));
			
			CartList.add(cart);
			
			
			 }
		} catch (SQLException e) {
			System.out.println("CartDAO - selectList() 에러" + e.getMessage());
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
	 return CartList;
	}
	

	public int cartDelete(int num) {
		System.out.println("CartDAO - cartDelete()");
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM cart WHERE num = ?";
		
		try {
			pstmt = con.prepareCall(sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("CartDAO - cartDelete()" + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
