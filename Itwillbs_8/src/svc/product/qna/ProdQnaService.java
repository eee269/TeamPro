package svc.product.qna;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProdQnaDAO;
import exception.member.QnaException;
import vo.ProdQnaBean;
public class ProdQnaService {
	
	// qna 등록 작업
	public boolean registQna(ProdQnaBean prodQnaBean) {
		System.out.println("ProdQnaService - registQna");
		// 성공 여부
		boolean isSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		instance.setConnetion(con);
		
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
	public boolean checkQna(int qna_num, String qna_pass, String member_id)throws QnaException {
		System.out.println("ProdQnaService - checkQna");
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		instance.setConnetion(con);
		
		boolean isRightUser = instance.checkQna(qna_num, qna_pass, member_id);
		
		close(con);
		return isRightUser;
	}
	// qna 삭제
	public boolean deleteQna(int qna_num) {
		System.out.println("ProdQnaService - deleteQna");
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		instance.setConnetion(con);
		
		int isDeleteCount = instance.deleteQna(qna_num);
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
	// qna 전체 갯수 가져오기
	public int getQnaCount(String basicCode) {
		System.out.println("ProdQnaService - getQnaCount()");
		int qnaCount = 0;
		
		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnetion(con);
		
		qnaCount = prodQnaDAO.selectQnaCount(basicCode);
				
		close(con);
		
		return qnaCount;
	}
	// qna page ~ limit 갯수만큼 가져오기
	public ArrayList<ProdQnaBean> getQnaList(int page, int limit, String basicCode) {
		System.out.println("ProdQnaService - getQnaList()");
		ArrayList<ProdQnaBean> qnaList = null;
		
		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnetion(con);
		
		qnaList = prodQnaDAO.selectQnaList(page, limit, basicCode);
		
		// 5(공통).
		close(con);
		
		// 6.
		return qnaList;
	}
}
