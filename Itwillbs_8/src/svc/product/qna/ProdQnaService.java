package svc.product.qna;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.product.ProdQnaDAO;
import exception.member.QnaException;
import vo.ProdQnaBean;
public class ProdQnaService {
	
	// qna 등록 작업
	public boolean registQna(ProdQnaBean prodQnaBean) {
		System.out.println("ProdQnaService - ProdQnaBean");
		// 성공 여부
		boolean isSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		
		int insertCount = instance.insertQna(prodQnaBean);
		// DB 등록 성공 여부
		if(insertCount > 0) {
			commit(con);
			isSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isSuccess;
	}
	// qna 비밀번호 검증
	public boolean checkQna(int num, String pass, String member_id)throws QnaException {
		System.out.println("ProdQnaService - checkQna");
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		
		boolean isRightUser = instance.checkQna(num, pass, member_id);
		
		close(con);
		return isRightUser;
	}
	// qna 삭제
	public boolean deleteQna(int num) {
		System.out.println("ProdQnaService - deleteQna");
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		
		int isDeleteCount = instance.deleteQna(num);
		// qna 삭제 성공 여부
		if(isDeleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteSuccess;
	}

}
