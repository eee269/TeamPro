package dao.product;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				String sql = "SELECT max(qna_num) FROM product_qna WHERE product_basicCode=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, prodQnaBean.getProduct_basicCode());
				rs = ps.executeQuery();
				
				// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}
				
				sql = "INSERT INTO product_qna VALUES(?,?,?,?,?,?,?,?,now(),?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setString(2, prodQnaBean.getQna_pass());
				ps.setString(3, prodQnaBean.getQna_subject());
				ps.setString(4, prodQnaBean.getQna_content());
				ps.setInt(5, 0);
				ps.setString(6, prodQnaBean.getQna_file());
				ps.setInt(7, num);
				ps.setInt(8, prodQnaBean.getQna_re_lev());
				ps.setString(9, prodQnaBean.getProduct_basicCode());
				ps.setString(10, prodQnaBean.getMember_id());
				System.out.println(prodQnaBean.toString());
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
		public boolean checkQna(int qna_num, String qna_pass, String member_id)throws QnaException {
			boolean isRightUser = false;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT qna_pass FROM product_qna WHERE qna_num=? AND member_id=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, qna_num);
				ps.setString(2, member_id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					if(rs.getString("pass").equals(qna_pass)) {
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
		public int deleteQna(int qna_num) {
			int deleteCount = 0;
			PreparedStatement ps = null;
			
			try {
				String sql = "DELETE FROM product_qna WHERE qna_num=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, qna_num);
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
		// -------------------selectQnaCount()-----------------------
		// basicCode에 따른 전체 qna 조회
		public int selectQnaCount(String basicCode) {
			int listCount = 0;
			PreparedStatement ps = null;
			ResultSet rs = null;
					
			try {
				String sql = "SELECT count(qna_num) FROM product_qna WHERE product_basicCode=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, basicCode);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - selectQnaCount() 오류 "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			
			return listCount;
		}
		// -------------------selectQnaCount()-----------------------
		// -------------------selectQnaList()-----------------------
		// qna page ~ limit 수 만큼 가져오기
		public ArrayList<ProdQnaBean> selectQnaList(int page, int limit, String basicCode) {
			ArrayList<ProdQnaBean> qnaList = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			int startRow = (page - 1) * limit; 
			
			try {
				String sql = "SELECT q.*, m.username "
						+ "FROM product_qna q JOIN member m "
						+ "ON q.member_id = m.id "
						+ "WHERE product_basicCode=? "
						+ "ORDER BY qna_num desc limit ?,?";
				ps = con.prepareStatement(sql);
				ps.setString(1, basicCode);
				ps.setInt(2, startRow);
				ps.setInt(3, limit);
				rs = ps.executeQuery();
				
				qnaList = new ArrayList<ProdQnaBean>();
				
				while(rs.next()) {
					ProdQnaBean qna = new ProdQnaBean();
					qna.setQna_num((rs.getInt(1)));
					qna.setQna_pass((rs.getString(2)));
					qna.setQna_subject((rs.getString(3)));
					qna.setQna_content((rs.getString(4)));
					qna.setQna_readcount((rs.getInt(5)));
					qna.setQna_file((rs.getString(6)));
					qna.setQna_re_ref((rs.getInt(7)));
					qna.setQna_re_lev((rs.getInt(8)));
					qna.setDate(rs.getTimestamp(9));
					qna.setProduct_basicCode((rs.getString(10)));
					qna.setUsername((rs.getString(12)));
					
					qnaList.add(qna);
				}
				
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - selectQnaList() 오류 "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			return qnaList;
		}
		// -------------------selectQnaList()-----------------------
}
