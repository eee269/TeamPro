package board.svc;

import static board.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.dao.BoardDAO;
import board.vo.BoardBean;

public class BoardListService {
	
	// -------------------getListCount()-------------------
	// 전체 게시물 수 리턴하는 메서드
	public int getListCount() throws Exception{
		System.out.println("BoardListService - getListCount()");
		int listCount = 0;
		
		// 1(공통).
		Connection con = getConnection();
		
		// 2(공통).
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		// 3(공통).
		boardDAO.setConnection(con);
		
		// 4.
		listCount = boardDAO.selectListCount();
				
		// 5(공통).
		close(con);
		
		// 6.
		return listCount;
	}
	// -------------------getListCount()-------------------
	// -------------------getArticleList()-------------------
	// 게시물 목록 가져오기 작업 요청 수행
	public ArrayList<BoardBean> getArticleList(int page, int limit)throws Exception{
		System.out.println("BoardListService - getArticleList()");
		ArrayList<BoardBean> articleList = null;
		
		// 1(공통).
		Connection con = getConnection();
		
		// 2(공통).
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		// 3(공통).
		boardDAO.setConnection(con);
		
		// 4.
		articleList = boardDAO.selectArticleList(page, limit);
		
		// 5(공통).
		close(con);
		
		// 6.
		return articleList;
	}
	// -------------------getArticleList()-------------------
	
	
	
	
	
	
	
	
	
	
	
}
