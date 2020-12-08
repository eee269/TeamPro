package svc.community;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.community.CommReDAO;
import vo.CommReBean;

public class CommReReWriteProService {

	public boolean registReComment(CommReBean crb) {
		System.out.println("CommReReWriteProService - registReComment()");
		
		boolean isWriteSuccess=false;
		
		// 1(공통).
		Connection con = getConnection();
		
		// 2(공통).
		CommReDAO commReDAO = CommReDAO.getInstance();
		
		// 3(공통).
		commReDAO.setConnection(con);
		
		// 4. CommReDAO 객체의 insertReComment() 메서드를 호출하여 대댓글 등록 처리
		// => 파라미터 : CommReBean, 리턴타입 : int(insertCount)
		int insertCount = commReDAO.insertReComment(crb);		
		
		// 5. 리턴받은 글 등록 결과를 판별
		// => 0보다 클 경우 성공 commit, 0일 경우 실패 rollback 작업 수행
		if(insertCount>0) {
			commit(con); //DB 커밋 작업 수행
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		
		// 5(공통).
		close(con);

		return isWriteSuccess;
	}

}
