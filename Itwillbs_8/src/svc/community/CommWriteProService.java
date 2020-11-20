package svc.community;

import java.sql.Connection;

import dao.community.CommDAO;
import vo.CommBean;

import static db.JdbcUtil.*;

// Action 클래스로부터 요청받은 작업에 대한 데이터 등을 전달받아
// Model(DAO 클래스)을 통해 실제 작업 처리를 요청하고
// 처리 결과를 리턴받아 해당 결과에 대한 판별을 통해
// 결과값으로 처리할 데이터를 리턴
public class CommWriteProService {
	
	// 글 쓰기(등록) 요청을 처리하기 위한 registArticle() 메서드 정의
	// => 파라미터 : 게시물 정보(BoardBean)
	// => 리턴타입 : boolean(isWriteSuccess)
	public boolean registArticle(CommBean commBean) throws Exception {
		System.out.println("CommWriteProService - registArticle()");
		
		boolean isWriteSuccess = false; // 글 등록 성공 여부를 저장
		
		// 1(공통). DB 작업에 필요한 Connection 객체 가져오기
		Connection con = getConnection(); // 메서드명만으로 접근 가능
		
		
		// 2(공통). DB 작업에 필요한 DAO 객체 가져오기
		CommDAO commDAO = CommDAO.getInstance(); 
		
		// 3(공통). 가져온 Connection 객체를 DAO 객체에 전달하기
		commDAO.setConnection(con);
		
		// 4. BoardDAO 객체의 insertArticle() 메서드를 호출하여 글 등록 처리
		int insertCount = commDAO.insertArticle(commBean);
		
		
		// 5. 리턴받은 글 등록 결과를 판별
		if(insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isWriteSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		}else {
			rollback(con);
		}
		
		// 6(공통). 사용이 완료된 Connection 객체 반환하기
		close(con);
		
		// 7
		return isWriteSuccess;
	}
	
	
}
