package svc.community;

import java.sql.Connection;

import dao.community.CommReDAO;
import dao.product.ProdReviewDAO;
import vo.CommReBean;
import vo.ProdReviewBean;

import static db.JdbcUtil.*;



public class CommReDeleteProService {

	public boolean removeComment(int num, int community_num) {
		boolean isDeleteSuccess =false;
		
		//1. 공통
		Connection con = getConnection();
		//2. 공통
		CommReDAO commReDAO = CommReDAO.getInstance();
		//3. 공통
		commReDAO.setConnection(con);
		
		// 4. commReDAO 클래스의 deleteComment() 메서드를 호출
		int deleteCount = commReDAO.deleteComment(num,community_num);	
	
		// 5. 글 수정 결과에 대한 판별 적업 수행
		// => updateCount 가 0 보다 크면 commit 수행, isModifySuccess 를 true 변경
		// => 아니면 rollback 수행
		if(deleteCount>0) {
			commit(con); //DB 커밋 작업 수행
			isDeleteSuccess = true;
		}else {
			rollback(con);
		}
		
		// 6(공통). 사용이 완료된 Connection 객체 반환하기
		close(con);
			
		// 6. 결과 리턴
		return isDeleteSuccess;
	}
	
	public CommReBean getComment(int num, int community_num) {
		
		Connection con = getConnection();
		CommReDAO commReDAO = CommReDAO.getInstance();
		commReDAO.setConnection(con);
		
		CommReBean commReBean = commReDAO.getComment(num,community_num);
		
		close(con);
		return commReBean;
	}
	
}
