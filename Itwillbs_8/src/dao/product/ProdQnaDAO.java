package dao.product;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import exception.member.QnaException;
import vo.ProdQnaBean;

public class ProdQnaDAO {
	
		// -------------------싱글톤-----------------------
		private ProdQnaDAO() {}
		
		private static ProdQnaDAO instance = new ProdQnaDAO();
		
		public static ProdQnaDAO getInstance() {
			return instance;
		}
		// -------------------싱글톤-----------------------
		
		Connection con;
		public void setConnetion(Connection con) {
			this.con = con;
		}
		
		// -------------------insertQna()-----------------------
		// qna 등록
		public int insertQna(ProdQnaBean prodQnaBean) {
			// 리뷰 등록
			int insertCount = 0;
			
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			int num = 1;
			
			try {
				String sql = "SELECT max(num) FROM product_qna";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}
				
				sql = "INSERT INTO product_qna VALUES(?,?,?,?,?,?,?,?,now())";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setString(2, prodQnaBean.getSubject());
				ps.setString(3, prodQnaBean.getContent());
				ps.setInt(4, num);
				ps.setInt(5, prodQnaBean.getRe_lev());
				ps.setString(8, prodQnaBean.getFile());
				ps.setString(6, prodQnaBean.getProduct_basicCode());
				ps.setString(7, prodQnaBean.getMember_id());
				
				insertCount = ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("ProdReviewDAO - insertReview : "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			
			return insertCount;
		}
		// -------------------insertQna()-----------------------
		// -------------------checkQna()-----------------------
		// qna 비밀번호 맞는지 검증
		public boolean checkQna(int num, String pass, String member_id)throws QnaException {
			boolean isRightUser = false;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT pass FROM product_qna WHERE num=? AND member_id=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setString(2, member_id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					if(rs.getString("pass").equals(pass)) {
						isRightUser = true;
					}else {
						throw new QnaException("패스워드 틀림");
					}
				}else {
					throw new QnaException("아이디 없음");
				}
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - checkQna : "+e.getMessage());
				e.printStackTrace();
			}finally {
				close(rs);
				close(ps);
			}
			return isRightUser;
		}
		// -------------------checkQna()-----------------------
		// -------------------deleteQna()-----------------------
		// qna 삭제
		public int deleteQna(int num) {
			int deleteCount = 0;
			PreparedStatement ps = null;
			
			try {
				String sql = "DELETE FROM product_qna WHERE num=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				deleteCount = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - deleteQna : "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(ps);
			}
			return deleteCount;
		}
		// -------------------deleteQna()-----------------------
}
