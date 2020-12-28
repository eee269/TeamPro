package svc.community;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.community.CommDAO;
import vo.CommBean;


public class CommModifyProService {

	// --------------------------------isArticleWriter()------------------------------
	public boolean isArticleWriter(String member_id, String pass) {
		// 글 수정 작업 전 작성자 확인을 위한 패스워드 비고
		boolean isRightUser = false;
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		
		commDAO.setConnection(con);
		
		// CommDAO 클래스의 isArticleBoardWriter() 메서드를 호출하여
		// 적합한 사용자인지 판별
		isRightUser = commDAO.isArticleCommWriter(member_id, pass);
		
		close(con);
		
		return isRightUser;
	}
	// --------------------------------isArticleWriter()------------------------------
	// --------------------------------modifyArticle()------------------------------
	public boolean modifyArticle(CommBean article) {
		// 글 수정 작업 요청 수행
		boolean isModifySuccess = false;
		
		// 1
		Connection con = getConnection();
		
		// 2
		CommDAO commDAO = CommDAO.getInstance();
		
		// 3
		commDAO.setConnection(con);
		
		// 4. CommDAO 클래스의 updateArticle() 메서드를 호출하여 글 수정
		int updateCount = commDAO.updateArticle(article);
		
		// 5. 글 수정 결과에 대한 판별 작업 수행
		// => updateCount 가 0보다 크면 commit 수행, isModifySuccess 를 true 변경
		// => 아니면 rollback 수행
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		}else {
			rollback(con);
		}
		
		// 6(공통). Connection 객체 반환하기
		close(con);
		
		// 7. 결과 리턴
		return isModifySuccess;
	}
	// --------------------------------modifyArticle()------------------------------

}
