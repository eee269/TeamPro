package svc.community;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.community.CommDAO;
import vo.CommBean;


public class CommDetailService {

	// -----------------------getArticle()-------------------------
	public CommBean getArticle (int num) throws Exception {
		System.out.println("CommDetailService - getArticle()!");
		
		// 1
		Connection con = getConnection();
		
		// 2 
		CommDAO commDAO = CommDAO.getInstance();
		
		// 3 
		commDAO.setConnection(con);
		
		// 4. 
		CommBean article = commDAO.selectArticle(num);
		
		// 게시물 상세 내용 조회가 성공했을 경우 
		// updateReadCount() 메서드 호출하여
		// 해당 게시물 조회수(readCount)를 1만큼 증가시키기
		if(article != null) { // 게시물 상세 내용이 리턴되었을 경우(= 조회 성공)
			int updateCount = commDAO.updateReadcount(num);
			
			// 조회수 증가가 성공했을 경우 commit, 실패했을 경우 rollback 수행
			if(updateCount > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		// 5 
		close(con);
		// 6
		return article;
	}
	// -----------------------getArticle()-------------------------
	
	
}
