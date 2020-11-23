package dao.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			String sql = "SELECT max(num) FROM goods_review";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO goods_review VALUES(?,?,?,?,?,?,?,?,?,?,now())";
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
	
}
