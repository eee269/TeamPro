package dao.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProdReviewBean;

public class ProdReviewDAO {
	
	// -------------------싱글톤-----------------------
	private ProdReviewDAO() {}
	private static ProdReviewDAO instance = new ProdReviewDAO();
	public static ProdReviewDAO getInstance() {
		return instance;
	}
	// -------------------싱글톤-----------------------
	
	Connection con;
	public void setConnetion(Connection con) {
		this.con = con;
	}
	
	// -------------------insertReview()-----------------------
	public int insertReview(ProdReviewBean prodReviewBean) {
		// 리뷰 등록
		int insertCount = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int num = 1;
		
		try {
			String sql = "SELECT max(num) FROM product_review";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO product_review VALUES(?,?,?,?,?,?,?,?,?,?,now())";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, prodReviewBean.getSubject());
			ps.setString(3, prodReviewBean.getContent());
			ps.setInt(4, prodReviewBean.getStarScore());
			ps.setInt(5, prodReviewBean.getRe_ref());
			ps.setInt(6, prodReviewBean.getRe_lev());
			ps.setInt(7, prodReviewBean.getRe_seq());
			ps.setString(8, prodReviewBean.getGoodsCode());
			ps.setString(9, prodReviewBean.getId());
			ps.setString(10, prodReviewBean.getUsername());
			
			insertCount = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - insertReview : "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return insertCount;
	}
	// -------------------insertReview()-----------------------
	// -------------------selectListCount()-----------------------
	public int selectListCount(String basicCode) {
		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(num) FROM product_review where product_basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			rs = ps.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - selectListCount"+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		return listCount;
	}
	// -------------------selectListCount()-----------------------
	// -------------------selectReviewList()-----------------------
	public ArrayList<ProdReviewBean> selectReviewList(int page, int limit, String basicCode) {
		ArrayList<ProdReviewBean> reviewList =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startRow = (page-1) * limit;
		
		try {
			String sql = "SELECT * FROM product_review WHERE product_basicCode=? ORDER BY num desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			ps.setInt(2, startRow);
			ps.setInt(3, limit);
			rs = ps.executeQuery();
			
			reviewList = new ArrayList<ProdReviewBean>();
			
			while(rs.next()) {
				ProdReviewBean review = new ProdReviewBean();
				review.setContent(rs.getString("contents"));
				review.setDate(rs.getTimestamp("date"));
				review.setUsername(rs.getNString("username"));
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - selectReviewList"+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return reviewList;
	}
	// -------------------selectReviewList()-----------------------
	
}
