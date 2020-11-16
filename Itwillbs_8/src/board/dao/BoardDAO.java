package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.vo.BoardBean;

import static board.db.JdbcUtil.*;

public class BoardDAO {
	// --------------싱글톤 패턴 활용---------------
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
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
	public int insertArticle(BoardBean boardBean) {
		System.out.println("BoardDAO - insertArticle()~");
		int insertCount = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int num = 1; // 글 번호를 저장할 변수
		
		try {
			String sql = "SELECT max(board_num) FROM board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// 조회 값 있으면 + 1, 없으면 작성된 글이 없으므로 num = 1 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO board VALUES(?,?,?,?,?,?,?,?,?,?,now())";
			ps.setInt(1, num);
			ps.setString(2, boardBean.getBoard_name());
			ps.setString(3, boardBean.getBoard_pass());
			ps.setString(4, boardBean.getBoard_subject());
			ps.setString(5, boardBean.getBoard_content());
			ps.setString(6, boardBean.getBoard_file());
			ps.setInt(7, num); // 참조글 번호(새 글이므로 자신이 참조글이 됨)
			ps.setInt(8, boardBean.getBoard_re_lev());
			ps.setInt(9, boardBean.getBoard_re_seq());
			ps.setInt(10, boardBean.getBoard_readCount());
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
		System.out.println("BoardDAO - selectListCount()~");
		
		int listCount = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {
			String sql = "SELECT count(board_num) FROM board";
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
	public ArrayList<BoardBean> selectArticleList(int page, int limit){
		ArrayList<BoardBean> articleList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit; // 조회를 시작할 레코드(행) 번호 계산
		
		try {
			String sql = "SELECT * FROM board ORDER BY board_re_ref desc, board_re_seq limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, limit);
			rs = ps.executeQuery();
			
			articleList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				// 1개 게시물 정보를 저장할 BoardBean 객체 생성 및 데이터 저장
				BoardBean article = new BoardBean();
				
				// 비밀번호는 제외
				article.setBoard_num(rs.getInt(1));
				article.setBoard_name(rs.getString(2));
				article.setBoard_subject(rs.getString(4));
				article.setBoard_content(rs.getString(5));
				article.setBoard_file(rs.getString(6));
				article.setBoard_re_ref(rs.getInt(7));
				article.setBoard_re_lev(rs.getInt(8));
				article.setBoard_re_seq(rs.getInt(9));
				article.setBoard_readCount(rs.getInt(10));
				article.setBoard_date(rs.getDate(11));
				
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