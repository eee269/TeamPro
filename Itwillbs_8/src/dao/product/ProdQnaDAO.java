package dao.product;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import exception.member.QnaException;
import vo.ProdQnaBean;
import vo.ProductBean;

public class ProdQnaDAO {
	
		// -------------------싱글톤-----------------------
		private ProdQnaDAO() {}
		
		private static ProdQnaDAO instance = new ProdQnaDAO();
		
		public static ProdQnaDAO getInstance() {
			return instance;
		}
		// -------------------싱글톤-----------------------
		
		Connection con;
		public void setConnection(Connection con) {
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
				String sql = "SELECT max(qna_num) FROM product_qna";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}
				
				sql = "INSERT INTO product_qna VALUES(?,?,?,?,?,?,?,?,now(),?,?,?)";
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
				ps.setInt(11, prodQnaBean.getQna_re_seq());
				System.out.println(prodQnaBean.toString());
				insertCount = ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - insertQna : "+e.getMessage());
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
				System.out.println(qna_pass);
				System.out.println(qna_num);
				System.out.println(member_id);
				if(rs.next()) {
					if(rs.getString("qna_pass").equals(qna_pass)) {
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
						+ "ORDER BY qna_re_seq ASC, qna_re_ref desc limit ?,?";
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
					qna.setQna_date(rs.getTimestamp(9));
					qna.setProduct_basicCode((rs.getString(10)));
					qna.setQna_re_seq((rs.getInt(12)));
					qna.setUsername((rs.getString(13)));
					
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
		// -------------------getProductInfo()-----------------------
		// 상품 정보 가져오기
		public ProductBean getProductInfo(String basicCode) {
			ProductBean productBean = new ProductBean();
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				String sql ="SELECT name, main_img, price FROM product WHERE basicCode=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, basicCode);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					productBean.setName(rs.getString(1));
					productBean.setMain_img(rs.getString(2));
					productBean.setPrice(rs.getInt(3));
				}
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - getProductInfo : "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			return productBean;
		}
		// -------------------getProductInfo()-----------------------
		// -------------------updateQna()-----------------------
		// qna 수정
		public int updateQna(ProdQnaBean qna) {
			int updateCount = 0;
			
			PreparedStatement ps = null;
			
			try {
				String sql = "UPDATE product_qna SET qna_subject=?, qna_content=?, qna_file=? WHERE qna_num = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, qna.getQna_subject());
				ps.setString(2, qna.getQna_content());
				ps.setString(3, qna.getQna_file());
				ps.setInt(4, qna.getQna_num());
				updateCount = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - updateQna : "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(ps);
			}
			return updateCount;
		}
		// -------------------updateQna()-----------------------
		// -------------------insertReplyQna()-----------------------
		// qna 답글 등록
		public int insertReplyQna(ProdQnaBean qna) {
			int insertCount = 0;
			
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				int num = 1; 
				
				String sql = "SELECT MAX(qna_num) FROM product_qna WHERE product_basicCode=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, qna.getProduct_basicCode());
				rs = ps.executeQuery();
				
				if(rs.next()) { 
					num = rs.getInt(1) + 1;
				}

				int qna_re_ref = qna.getQna_re_ref(); 
				int qna_re_lev = qna.getQna_re_lev(); 
				int qna_re_seq = qna.getQna_re_seq(); 
				if(qna.getQna_re_seq() != 0) {
					sql = "UPDATE product_qna SET qna_re_seq=qna_re_seq+1 "
							+ "WHERE qna_re_ref=? AND qna_re_seq>? AND product_basicCode=?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, qna.getQna_re_ref());
					ps.setInt(2, qna.getQna_re_seq());
					ps.setString(3, qna.getProduct_basicCode());
					ps.executeUpdate();
				}
				qna_re_lev += 1;
				qna_re_seq += 1;
				
				sql = "INSERT INTO product_qna VALUES(?,?,?,?,?,?,?,?,now(),?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, num);
				ps.setString(2, qna.getQna_pass());
				ps.setString(3, qna.getQna_subject());
				ps.setString(4, qna.getQna_content());
				ps.setInt(5, 0);
				ps.setString(6, ""); // 파일업로드 생략
				ps.setInt(7, qna_re_ref);
				ps.setInt(8, qna_re_lev);
				ps.setString(9, qna.getProduct_basicCode());
				ps.setString(10, qna.getMember_id());
				ps.setInt(11, qna_re_seq);
				insertCount = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - insertReplyQna() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			
			return insertCount;
		}
		// -------------------insertReplyQna()-----------------------
		// -------------------getQna()-----------------------
		// qna 정보 가져오기
		public ProdQnaBean getQna(int qna_num) {
			ProdQnaBean prodQnaBean = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT q.*, m.username " + 
								"FROM product_qna q JOIN member m " + 
								"ON q.member_id = m.id " + 
								"WHERE qna_num=? ";
				
				ps= con.prepareStatement(sql);
				ps.setInt(1, qna_num);
				rs = ps.executeQuery();
				
				prodQnaBean = new ProdQnaBean();
				if(rs.next()) {
					prodQnaBean.setUsername(rs.getString("username"));
					prodQnaBean.setQna_subject(rs.getString("qna_subject"));
					prodQnaBean.setQna_content(rs.getString("qna_content"));
					prodQnaBean.setQna_num(rs.getInt("qna_num"));
					prodQnaBean.setQna_re_ref(rs.getInt("qna_re_ref"));
					prodQnaBean.setQna_re_seq(rs.getInt("qna_re_seq"));
					prodQnaBean.setQna_re_lev(rs.getInt("qna_re_lev"));
					
				}
				
			} catch (SQLException e) {
				System.out.println("ProdQnaDAO - getQna : "+e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(ps);
			}
			
			return prodQnaBean;
		}
		// -------------------getQna()-----------------------

		public ArrayList<ProdQnaBean> selectMyqnaList(String member_id) {
			ArrayList<ProdQnaBean> list = new ArrayList<ProdQnaBean>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "select * from product_qna where member_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				rs = pstmt.executeQuery();
				
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
					qna.setQna_date(rs.getTimestamp(9));
					qna.setProduct_basicCode((rs.getString(10)));
					qna.setUsername((rs.getString(12)));
					
					list.add(qna);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return list;
		}
}
