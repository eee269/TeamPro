<<<<<<< HEAD:Itwillbs_8/src/board/svc/BoardListService.java
package board.svc;
=======
package svc.community;
>>>>>>> origin/sb:Itwillbs_8/src/svc/community/CommListService.java

import static board.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

<<<<<<< HEAD:Itwillbs_8/src/board/svc/BoardListService.java
import board.dao.BoardDAO;
import board.vo.BoardBean;
=======
import dao.community.CommDAO;
import vo.CommBean;
>>>>>>> origin/sb:Itwillbs_8/src/svc/community/CommListService.java

public class CommListService {
	
	// -------------------getListCount()-------------------
	// 전체 게시물 수 리턴하는 메서드
	public int getListCount() throws Exception{
		System.out.println("CommListService - getListCount()");
		int listCount = 0;
		
		// 1(공통).
		Connection con = getConnection();
		
		// 2(공통).
		CommDAO commDAO = CommDAO.getInstance();
		
		// 3(공통).
		commDAO.setConnection(con);
		
		// 4.
		listCount = commDAO.selectListCount();
				
		// 5(공통).
		close(con);
		
		// 6.
		return listCount;
	}
	// -------------------getListCount()-------------------
	// -------------------getArticleList()-------------------
	// 게시물 목록 가져오기 작업 요청 수행
	public ArrayList<CommBean> getArticleList(int page, int limit)throws Exception{
		System.out.println("CommListService - getArticleList()");
		ArrayList<CommBean> articleList = null;
		
		// 1(공통).
		Connection con = getConnection();
		
		// 2(공통).
		CommDAO commDAO = CommDAO.getInstance();
		
		// 3(공통).
		commDAO.setConnection(con);
		
		// 4.
		articleList = commDAO.selectArticleList(page, limit);
		
		// 5(공통).
		close(con);
		
		// 6.
		return articleList;
	}
	// -------------------getArticleList()-------------------
	
	
	
	
	
	
	
	
	
	
	
}
