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
	public void setConnection(Connection con) {
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
			
			sql = "INSERT INTO product_review VALUES(?,?,?,?,?,?,?,now(),?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, prodReviewBean.getContent());
			ps.setInt(3, prodReviewBean.getStarScore());
			ps.setInt(4, num);
			ps.setInt(5, prodReviewBean.getRe_lev());
			ps.setString(6, prodReviewBean.getProduct_basicCode());
			ps.setString(7, prodReviewBean.getMember_id());
			ps.setString(8, prodReviewBean.getProduct_img());
			
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
	public int selectListCount(String basicCode, int pic) {
		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			if(pic == 0) {
				sql = "SELECT count(num) FROM product_review where product_basicCode=? and product_img IS NOT NULL";
			}else if(pic == 1){
				sql = "SELECT count(num) FROM product_review where product_basicCode=? and product_img IS NULL";
			}
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
			close(rs);
			close(ps);
		}
		return listCount;
	}
	// -------------------selectListCount()-----------------------
	// -------------------selectReviewList()-----------------------
	// 리뷰 목록 호출
	public ArrayList<ProdReviewBean> selectReviewList(int page, int limit, String basicCode, int pic, int sort) {
		ArrayList<ProdReviewBean> reviewList =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		int startRow = (page-1) * limit;
		
		
		try {
			if(pic == 0) {
				switch (sort) {
					case 0:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NOT NULL ORDER BY num desc limit ?,?";
						break;
					case 1:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NOT NULL ORDER BY StarScore desc, num desc limit ?,?";
						break;
					default:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NOT NULL ORDER BY num desc limit ?,?";
						break;
				}
			}else if(pic == 1) {
				switch (sort) {
					case 0:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NULL ORDER BY num desc limit ?,?";
						break;
					case 1:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NULL ORDER BY StarScore desc, num desc limit ?,?";
						break;
					default:
						sql ="SELECT * FROM product_review WHERE product_basicCode=? AND product_img IS NULL ORDER BY num desc limit ?,?";
						break;
				}
			}
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			ps.setInt(2, startRow);
			ps.setInt(3, limit);
			rs = ps.executeQuery();
			reviewList = new ArrayList<ProdReviewBean>();
			
			while(rs.next()) {
				ProdReviewBean review = new ProdReviewBean();
				review.setContent(rs.getString("content"));
				review.setDate(rs.getTimestamp("date"));
				review.setProduct_img(rs.getString("product_img"));
				review.setStarScore(rs.getInt("starScore"));
				review.setMember_id(rs.getString("member_id"));
				review.setNum(rs.getInt("num"));
				
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - selectReviewList"+e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return reviewList;
	}
	// -------------------selectReviewList()-----------------------
	// -------------------deleteReview()-----------------------
	public int deleteReview(int num) {
		int deleteCount = 0;
		PreparedStatement ps = null;
		try {
			String sql ="DELETE FROM product_review WHERE num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			deleteCount = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - deleteReview() : "+e.getMessage() );
			e.printStackTrace();
		}finally {
			close(ps);
		}
		return deleteCount;
	}
	// -------------------deleteReview()-----------------------
	// -------------------updateReview()-----------------------
	public int updateReview(ProdReviewBean prodReviewBean, int num) {
		int updateCount = 0;
		PreparedStatement ps = null;
		try {
			String sql = "UPDATE product_review SET starScore=?, content=?, product_img=? WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, prodReviewBean.getStarScore());
			ps.setString(2, prodReviewBean.getContent());
			ps.setString(3, prodReviewBean.getProduct_img());
			ps.setInt(4, num);
			updateCount = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("ProdReviewDAO - updateReview : "+e.getMessage());
			e.printStackTrace();
		}
		return updateCount;
	}
	// -------------------updateReview()-----------------------

	public ArrayList<ProdReviewBean> selectMyreviewList(String member_id) {
		ArrayList<ProdReviewBean> list = new ArrayList<ProdReviewBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product_review where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProdReviewBean review = new ProdReviewBean();
				
				review.setMember_id(member_id);
				review.setNum(rs.getInt("num"));
				review.setContent(rs.getString("content"));
				review.setStarScore(rs.getInt("starScore"));
				review.setRe_ref(rs.getInt("re_ref"));
				review.setRe_lev(rs.getInt("re_lev"));
				review.setProduct_basicCode(rs.getString("product_basicCode"));
				review.setProduct_img(rs.getString("product_Img"));
				review.setDate(rs.getTimestamp("date"));
				
				list.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	// 페이징 없이 상품 목록 받아가기 ( 상품삭제 )
	public ArrayList<ProdReviewBean> selectReviewList(String basicCode) {
		ArrayList<ProdReviewBean> list = new ArrayList<ProdReviewBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product_review where product_basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProdReviewBean review = new ProdReviewBean();
				
				review.setProduct_basicCode(rs.getString("product_basicCode"));
				review.setProduct_img(rs.getString("product_Img"));
				
				list.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}

	

	
}
