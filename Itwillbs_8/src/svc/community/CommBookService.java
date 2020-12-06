package svc.community;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.community.CommDAO;
public class CommBookService {
	
	// 북마크 조회
	public int checkBook(int num, String id) {
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		int checkCount = commDAO.checkBookmark(num,id);
		close(con);
		
		return checkCount;
	}
	// 북마크 추가
	public void updateBook(int num, String id) {
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		int updateCount = commDAO.updateBookmark(num,id);
		if(updateCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
	}
	// 북마크 제거
	public void deleteBook(int num, String id) {
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		int deleteCount = commDAO.deleteBookmark(num,id);
		if(deleteCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
	}

}
