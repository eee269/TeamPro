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
	private CartDAO() {
	}

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

			while (rs.next()) {
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

	// 개별 삭제
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

	// 전체 삭제
	public int cartAllDelete(String member_id , int num) {
		System.out.println("CartDAO - cartAllDelete()");

		int AllCount = 0;

		PreparedStatement pstmt = null;

		String sql = "DELETE FROM cart WHERE member_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			AllCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("CartDAO - cartAllDelete()");
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return AllCount;
	}

}
