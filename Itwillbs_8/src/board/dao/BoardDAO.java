<<<<<<< HEAD:Itwillbs_8/src/board/dao/BoardDAO.java
package board.dao;
=======
package dao.community;
>>>>>>> origin/sb:Itwillbs_8/src/dao/community/CommDAO.java

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

<<<<<<< HEAD:Itwillbs_8/src/board/dao/BoardDAO.java
import board.vo.BoardBean;
=======
import vo.CommBean;
>>>>>>> origin/sb:Itwillbs_8/src/dao/community/CommDAO.java

import static board.db.JdbcUtil.*;

public class CommDAO {
	// --------------싱글톤 패턴 활용---------------
	private CommDAO() {}
	
	private static CommDAO instance = new CommDAO();

	public static CommDAO getInstance() {
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
	// --------------setConnection()---------------
	// --------------insertArticle()---------------
	// 글 등록 작업
	public int insertArticle(CommBean commBean) {
		System.out.println("CommDAO - insertArticle()~");
		int insertCount = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int num = 1; // 글 번호를 저장할 변수
		
		try {
			String sql = "SELECT max(num) FROM community";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO community VALUES(?,?,?,?,?,?,now(),?)";
			ps.setInt(1, num);
			ps.setString(2, commBean.getUsername());
			ps.setString(3, commBean.getPass());
			ps.setString(4, commBean.getSubject());
			ps.setString(5, commBean.getContent());
			ps.setInt(6, commBean.getReadCount());
			ps.setDate(7, commBean.getDate());
			ps.setString(8, commBean.getImg());
			insertCount = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertArticle() 오류 "+e.getMessage() );
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		return insertCount;
	}
	// --------------insertArticle()---------------
	
	// --------------selectListCount()---------------
	// 전체 게시물 수 조회
	public int selectListCount() {
		System.out.println("CommDAO - selectListCount()~");
		
		int listCount = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {
			String sql = "SELECT count(num) FROM community";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류 "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return listCount;
	}
	// --------------selectListCount()---------------
	// --------------selectArticleList()---------------
	// 게시물 목록 조회
	public ArrayList<CommBean> selectArticleList(int page, int limit){
		ArrayList<CommBean> articleList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit; // 조회를 시작할 레코드(행) 번호 계산
		
		try {
			String sql = "SELECT * FROM community ORDER BY board_re_ref desc, board_re_seq limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, limit);
			rs = ps.executeQuery();
			
			articleList = new ArrayList<CommBean>();
			
			while(rs.next()) {
				// 1개 게시물 정보를 저장할 BoardBean 객체 생성 및 데이터 저장
				CommBean article = new CommBean();
				
				// 비밀번호는 제외
				article.setNum(rs.getInt(1));
				article.setUsername(rs.getString(2));
				article.setSubject(rs.getString(4));
				article.setContent(rs.getString(5));
				article.setReadCount(rs.getInt(6));
				article.setDate(rs.getDate(7));
				article.setImg(rs.getString(8));
				
				// 1개 게시물을 전체 게시물 저장 객체에 추가
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("selectArticleList() 오류 "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		return articleList;
	}
	// --------------selectArticleList()---------------
	
	
	
	
	
}