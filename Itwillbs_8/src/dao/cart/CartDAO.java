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
	public ArrayList<Cart> selectList(String member_id) {
		System.out.println("CartDAO - selectList");
		ArrayList<Cart> CartList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			String sql = "SELECT * FROM cart WHERE member_id = ? ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, member_id);
			rs = pstmt.executeQuery();
			
		    CartList = new ArrayList<Cart>();
			 
			while(rs.next()) {
				Cart cart = new Cart();
			
			cart.setNum(rs.getInt("num"));
			cart.setCnt(rs.getInt("cnt"));
			cart.setProduct_name(rs.getString("product_name"));
			cart.setPrice(rs.getInt("price"));
			cart.setColor(rs.getString("color"));
			cart.setSize(rs.getString("size"));
			cart.setMember_id(rs.getString("member_id"));
			cart.setProduct_basicCode(rs.getString("product_basicCode"));
			cart.setOpt_productCode(rs.getString("opt_productCode"));
			cart.setMain_img(rs.getString("main_img"));

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
	
	
	// 삭제
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
	
	
	// 수량 업데이트
	public int cartUpdate(int num , int cnt) {
		System.out.println("CartDAO - cartUpdate");
		
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE cart SET cnt = ? WHERE num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnt);
			pstmt.setInt(2, num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("cartUpdate :" + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	// 가져오기
	public int cartGet(Cart ca) {
		System.out.println("CartDAO - cartUp");
		int upCount = 0;
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			String sql2 = "SELECT max(num) FROM cart";
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			
			int num = 0;
			
		if(rs.next()) {
			num = rs.getInt("max(num)") + 1;			
			String sql = "INSERT INTO cart(num,cnt,product_name,price,color,size,member_id,product_basicCode,opt_productCode,main_img)VALUES(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			System.out.println(num);
			pstmt.setInt(2, ca.getCnt());
			pstmt.setString(3, ca.getProduct_name());
			pstmt.setInt(4, ca.getPrice());
			pstmt.setString(5, ca.getColor());
			pstmt.setString(6, ca.getSize());
			pstmt.setString(7, ca.getMember_id());
			pstmt.setString(8, ca.getProduct_basicCode());
			pstmt.setString(9, ca.getOpt_productCode());
			pstmt.setString(10, ca.getMain_img());

			upCount = pstmt.executeUpdate();
			System.out.println("DAO upCount : " + upCount);
		}
			
		} catch (SQLException e) {
			System.out.println("cartUp :" + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt2);
			close(rs);
		}
		
		return upCount;
	}
	
	
	public int cartPlus(Cart ca) {
		System.out.println("CartDAO - cartPlus");

		ResultSet rs = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;


		int plusCount = 0;
		
		
		try {
			String sql = "SELECT * FROM cart WHERE opt_productCode = ?";	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ca.getOpt_productCode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql2 = "SELECT cnt FROM cart WHERE opt_productCode =? and member_id = ?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, ca.getOpt_productCode());
				pstmt2.setString(2, ca.getMember_id());
				rs2 = pstmt2.executeQuery();
			}
			int cnt2 = 0;
			if(rs2.next()) {
				cnt2 = rs2.getInt("cnt");
				plusCount = 1;
				String sql3 = "UPDATE cart SET cnt = ? WHERE opt_productCode = ? and member_id = ?";
				pstmt3 = con.prepareStatement(sql3);
				pstmt3.setInt(1, cnt2 + ca.getCnt());
				pstmt3.setString(2, ca.getOpt_productCode());
				pstmt3.setString(3, ca.getMember_id());

				plusCount = pstmt3.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("cartPlus -" + e.getMessage());
		} finally {
			close(pstmt);
			close(pstmt2);
			close(pstmt3);
			close(rs);
			close(rs2);
		}

		
		
		return plusCount;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
