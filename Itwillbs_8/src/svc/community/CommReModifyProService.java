package svc.community;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.community.CommReDAO;
import vo.CommReBean;

public class CommReModifyProService {

	public boolean modifyComment(CommReBean crb) {
		
		System.out.println("CommReModifyProService");
		// 글 수정 작업 요청 수행
		boolean isModifySuccess = false;
		
		// DB 작업을 위한 비즈니스 로직 수행 준비
		// 1(공통). DB 작업에 필요한 Connection 객체 가져오기
//		Connection con = JdbcUtil.getConnection();
		Connection con = getConnection();
		
		// 2(공통). DB 작업에 필요한 DAO 객체 가져오기
		CommReDAO commReDAO = CommReDAO.getInstance();
		
		// 3(공통). 가져온 Connection 객체를 DAO 객체에 전달하기
		commReDAO.setConnection(con);
		
		// 4. CommReDAO 클래스의 updateComment() 메서드를 호출하여 글 수정
		int updateCount =commReDAO.updateComment(crb);
		
		// 5. 글 수정 결과에 대한 판별 적업 수행
		// => updateCount 가 0 보다 크면 commit 수행, isModifySuccess 를 true 변경
		// => 아니면 rollback 수행
		if(updateCount>0) {
			commit(con); //DB 커밋 작업 수행
			isModifySuccess = true;
		}else {
			rollback(con);
		}
		
		// 6(공통). 사용이 완료된 Connection 객체 반환하기
		close(con);
				
		return isModifySuccess;
	}

}
