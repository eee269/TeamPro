package dao.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommReBean;

import static db.JdbcUtil.*;

public class CommReDAO {
	// --------------싱글톤 패턴 활용---------------
	private CommReDAO() {}
	
	private static CommReDAO instance = new CommReDAO();

	public static CommReDAO getInstance() {
		return instance;
	}
	// --------------싱글톤 패턴 활용---------------
	Connection con; // Connection 객체를 전달받아 저장할 멤버변수

	// --------------setConnection()---------------
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아
	// 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {
		this.con = con;
	}


	public int insertComment(CommReBean crb) {
		System.out.println("CommReDAO - insertComment()");
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 댓글번호를 저장할 변수
		
		
		try {
			String sql="SELECT MAX(num) FROM community_reply";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			// 조회된 결과가 있을 경우 조회된 번호 +1 값을 num에 저장
			if(rs.next()) {
				num=rs.getInt(1)+1; // 새 글 번호 만들기
			}
			
			sql = "INSERT INTO community_reply(member_id,contents,num,community_num,date,re_lev,re_ref,img,del) VALUES(?,?,?,?,?,?,?,?,'N')";
			pstmt = con.prepareStatement(sql);
			//CommReBean 객체로부터 데이터를 꺼내서 쿼리문 ? 대체
			pstmt.setString(1, crb.getUsername());
			pstmt.setString(2, crb.getContents());
			pstmt.setInt(3, num);
			pstmt.setInt(4, crb.getCommunity_num());
			pstmt.setTimestamp(5, crb.getDate());
			pstmt.setInt(6, crb.getRe_lev());
			pstmt.setInt(7, num); //참조글 번호(새 글이므로 자신이 참조글이 됨)
			pstmt.setString(8, crb.getImg());

			
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("insertComment() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
			
		}
		
		// TODO Auto-generated method stub
		return insertCount;
	}



	public ArrayList<CommReBean> selectcommentList(int community_num,int page,int limit, int arraymode) {
		// 지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		ArrayList<CommReBean> commentList = null;
//		int limit = 5;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page-1)*limit;
		// 게시물 조회

		try {			
			if(arraymode == 0) {
				sql="SELECT c.*,m.username FROM community_reply c JOIN member m ON c.member_id=m.id"
					+" INNER JOIN (SELECT re_ref, count(re_ref) AS ct FROM community_reply GROUP BY re_ref) as y on c.num = y.re_ref"
					+" where community_num=? and re_lev=0 Order by y.ct desc limit ?,?";			
			}else if(arraymode == 1) {
				sql="SELECT c.*,m.username FROM community_reply c JOIN member m ON c.member_id = m.id"
					+" WHERE community_num=? and re_lev=0 ORDER BY num desc limit ?,?";
				
			}
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, community_num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs=pstmt.executeQuery();
			
			commentList= new ArrayList<CommReBean>();
			
			// 읽어올 게시물이 존재할 경우 다음 작업 반복

			while(rs.next()) {
				CommReBean crb = new CommReBean();
				crb.setUsername(rs.getString("member_id"));
				crb.setContents(rs.getString("contents"));
				crb.setNum(rs.getInt("num"));
				crb.setCommunity_num(rs.getInt("community_num"));
				crb.setDate(rs.getTimestamp("date"));
				crb.setRe_lev(rs.getInt("re_lev"));
				crb.setRe_ref(rs.getInt("re_ref"));
				crb.setImg(rs.getString("img"));
				crb.setDel(rs.getString("del"));
				crb.setId(rs.getString("username"));
				
				commentList.add(crb);

				
			}	
			
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
			
		}
		
		return commentList;
	}	
	
	public int updateComment(CommReBean crb) {	
		System.out.println("DAO - updateComment");
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql="UPDATE community_reply SET contents=?,date=? where num=? and community_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, crb.getContents());
			pstmt.setTimestamp(2, crb.getDate());
			pstmt.setInt(3, crb.getNum());
			pstmt.setInt(4, crb.getCommunity_num());
			updateCount=pstmt.executeUpdate();
						
			// 임시 확인용 상세 내용 출력
//			System.out.println(updateCount);
			
		} catch (SQLException e) {
			System.out.println("updateComment() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return updateCount;
	}

	
	

	public int insertReComment(CommReBean crb) {
		System.out.println("CommReDAO - insertReComment()");
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 댓글번호를 저장할 변수
		
		try {
			String sql="SELECT MAX(num) FROM community_reply";
			pstmt=con.prepareStatement(sql);
//			pstmt.setInt(1, crb.getCommunity_num());
			rs=pstmt.executeQuery();
			
			// 조회된 결과가 있을 경우 조회된 번호 +1 값을 num에 저장
			if(rs.next()) {
				num=rs.getInt("max(num)")+1; // 새 글 번호 만들기
			}else {
				num=1;
			}
			
			sql = "INSERT INTO community_reply(member_id,contents,num,community_num,date,re_lev,re_ref,del) VALUES(?,?,?,?,?,?,?,'N')";
			pstmt = con.prepareStatement(sql);
			//CommReBean 객체로부터 데이터를 꺼내서 쿼리문 ? 대체
			pstmt.setString(1, crb.getUsername());
			pstmt.setString(2, crb.getContents());
			pstmt.setInt(3, num);
			pstmt.setInt(4, crb.getCommunity_num());
			pstmt.setTimestamp(5, crb.getDate());
			pstmt.setInt(6, crb.getRe_lev());
			pstmt.setInt(7, crb.getRe_ref());
			
			insertCount = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("insertComment() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);			
		}
			
		// TODO Auto-generated method stub
		return insertCount;
	}

	
	
	public int deleteComment(int num, int community_num) {
		System.out.println("CommentDAO - deleteComment()");
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
	
		try {
//			String sql = "DELETE FROM community_reply WHERE num=? and community_num=?";
			String sql = "UPDATE community_reply SET del='Y' where num=? and community_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, community_num);
			deleteCount = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			System.out.println("deleteComment() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(pstmt);
			
		}
		// TODO Auto-generated method stub
		return deleteCount;
	}


	public int selectCommCount(int community_num) {
		System.out.println("CommentDAO - selectCommCount()");
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "SELECT COUNT(*) FROM community_reply where community_num=? and re_lev=0";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, community_num);
			rs=pstmt.executeQuery();
			
			// 조회 결과가 있을 경우 (= 게시물이 하나라도 존재하는 경우)
			// => 게시물 수를 listCount 에 저장
			
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectCommCount() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
			
		}		
		
		return listCount;
	}

	
	

	
	public ArrayList<CommReBean> selectReCommentList(int community_num, int re_ref) {
		// 지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		System.out.println("selectReCommentList");
		
		ArrayList<CommReBean> commentReList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 게시물 조회
		// 참조글번호(board_re_ref) 번호를 기준으로 내림차순 정렬,
		// 순서번호(board_re_seq) 번호를 기준으로 오름차순 정렬
		// 조회 시작 게시물 번호(startRow)부터 limit 갯수만큼 조회

		try {
			
//			String sql="SELECT * FROM community_reply WHERE community_num=? and re_ref=? and re_lev=1 ORDER BY re_ref,num";
			String sql="SELECT c.*,m.username FROM community_reply c JOIN member m ON c.member_id = m.id WHERE community_num=? and re_ref=? and re_lev=1 ORDER BY re_ref,num";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, community_num);
			pstmt.setInt(2, re_ref);
			rs=pstmt.executeQuery();
			
			commentReList= new ArrayList<CommReBean>();
			
			// 읽어올 게시물이 존재할 경우 다음 작업 반복
	
			while(rs.next()) {
				CommReBean crb = new CommReBean();
				crb.setUsername(rs.getString("member_id"));
				crb.setContents(rs.getString("contents"));
				crb.setNum(rs.getInt("num"));
				crb.setCommunity_num(rs.getInt("community_num"));
				crb.setDate(rs.getTimestamp("date"));
				crb.setRe_lev(rs.getInt("re_lev"));
				crb.setRe_ref(rs.getInt("re_ref"));
				crb.setDel(rs.getString("del"));
				crb.setId(rs.getString("username"));
								
				commentReList.add(crb);
			}	
			
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
			
		}
		
		return commentReList;
	}	
	
	
	
	
	public int selectReCommCount(int community_num, int re_ref) {
		System.out.println("selectReCommCount");
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "SELECT COUNT(*) FROM community_reply where community_num=? and re_ref=? and re_lev=1";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, community_num);
			pstmt.setInt(2, re_ref);
			rs=pstmt.executeQuery();
			
			// 조회 결과가 있을 경우 (= 게시물이 하나라도 존재하는 경우)
			// => 게시물 수를 listCount 에 저장
			
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectCommCount() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
			
		}		
		
		return listCount;
	}	
	
	public int selectCommAllCount(int community_num) {
		System.out.println("CommentDAO - selectCommCount()");
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "SELECT COUNT(*) FROM community_reply where community_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, community_num);
			rs=pstmt.executeQuery();
			
			// 조회 결과가 있을 경우 (= 게시물이 하나라도 존재하는 경우)
			// => 게시물 수를 listCount 에 저장
			
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectCommCount() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
		}				
		return listCount;
	}

	
	public CommReBean getComment(int num, int community_num) {
		CommReBean commReBean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT img FROM community_reply WHERE num=? and community_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, community_num);
			rs = pstmt.executeQuery();
			
			commReBean = new CommReBean();
			if(rs.next()) {
				commReBean.setImg(rs.getString(1));
			}
			
		} catch (SQLException e) {
			System.out.println("getComment() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return commReBean;
	}
	
	


	public ArrayList<CommReBean> selectMyreplyList(String member_id) {
		ArrayList<CommReBean> list = new ArrayList<CommReBean>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from community_reply where member_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CommReBean reply = new CommReBean();
				
				reply.setCommunity_num(rs.getInt("community_num"));
				reply.setContents(rs.getString("contents"));
				reply.setDate(rs.getTimestamp("date"));
				reply.setDel(rs.getString("del"));
				reply.setImg(rs.getString("img"));
				reply.setNum(rs.getInt("num"));
				reply.setRe_lev(rs.getInt("re_lev"));
				reply.setRe_ref(rs.getInt("re_ref"));
				reply.setId(member_id);
				
				list.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return list;
	}
}
