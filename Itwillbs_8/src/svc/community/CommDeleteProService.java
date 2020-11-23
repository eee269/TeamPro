package svc.community;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.community.CommDAO;

public class CommDeleteProService {

	// --------------------------------isArticleWriter()------------------------------
	public boolean isArticleWriter(int num, String pass) {
		// 비밀번호 검증
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		
		commDAO.setConnection(con);
		
		isArticleWriter = commDAO.isArticleCommWriter(num,pass);
		
		close(con);
		
		return isArticleWriter;
	}
	// --------------------------------isArticleWriter()------------------------------
	// --------------------------------removeArticle()------------------------------
	public boolean removeArticle(int num) {
		// 글 삭제
		boolean isDeleteSuccess = false;
		int deleteCount = 0;
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		
		commDAO.setConnection(con);
		
		// 글 삭제 작업
		deleteCount = commDAO.isDeleteArticle(num);
		if(deleteCount > 0) {
			// 성공 시
			commit(con);
			isDeleteSuccess = true;
		}else {
			// 실패 시
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}
	// --------------------------------removeArticle()------------------------------

}
