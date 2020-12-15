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
import vo.ProductBean;
public class ProdQnaService {
	
	// qna 등록 작업
	public boolean registQna(ProdQnaBean prodQnaBean) {
		System.out.println("ProdQnaService - registQna");
		// 성공 여부
		boolean isSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		instance.setConnection(con);
		
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
		instance.setConnection(con);
		
		boolean isRightUser = instance.checkQna(qna_num, qna_pass, member_id);
		
		close(con);
		return isRightUser;
	}
	// qna 비밀글 일 경우, 비밀번호 검증
	// qna 삭제
	public boolean deleteQna(int qna_num) {
		System.out.println("ProdQnaService - deleteQna");
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		ProdQnaDAO instance = ProdQnaDAO.getInstance();
		instance.setConnection(con);
		
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
		prodQnaDAO.setConnection(con);
		
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
		prodQnaDAO.setConnection(con);
		
		qnaList = prodQnaDAO.selectQnaList(page, limit, basicCode);
		
		close(con);
		
		return qnaList;
	}
	// product 제목, 메인이미지, 가격 가져오기
	public ProductBean getProductInfo(String basicCode) {
		System.out.println("ProdQnaService - getProductInfo()");
		
		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnection(con);
		
		ProductBean productBean = prodQnaDAO.getProductInfo(basicCode);
		
		close(con);
		
		return productBean;
	}
	// qna 수정
	public boolean modifyQna(ProdQnaBean qna) {
		System.out.println("ProdQnaService - modifyQna()");
		boolean isModifySuccess = false;

		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnection(con);
		
		int updateCount = prodQnaDAO.updateQna(qna);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
	}
	// qna 답글 등록
	public boolean replyQna(ProdQnaBean qna) {
		System.out.println("ProdQnaService - replyQna()");
		boolean isReplySuccess = false;
		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnection(con);
		
		int insertCount = prodQnaDAO.insertReplyQna(qna);
		
		if(insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isReplySuccess;
	}
	// qna 정보 가져오기
	public ProdQnaBean getQna(int qna_num) {
		System.out.println("ProdQnaService - getQna()");
		Connection con = getConnection();
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnection(con);
		
		ProdQnaBean prodQnaBean = prodQnaDAO.getQna(qna_num);
		
		return prodQnaBean;
	}

	

}
