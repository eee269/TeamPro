package svc.community;

import java.util.ArrayList;

import java.sql.Connection;

import dao.community.CommReDAO;
import vo.CommReBean;

import static db.JdbcUtil.*;



public class CommReReCountService {
	
	public int getReReCommCount(int community_num, int re_ref) throws Exception {
		// 전체 댓글수를 조회하여 리턴하는 작업을 요청하는 getCommCount()
		System.out.println("BoardListService - getLBoardListServiceistCount()");
		
		int listCount = 0;
		
		//1. 공통
		Connection con = getConnection();
		//2. 공통
		CommReDAO commReDAO = CommReDAO.getInstance();
		//3. 공통
		commReDAO.setConnection(con);
		
		// 4. commReDAO 객체의 selectListCount() 메서드 호출하여
		//    전체 댓글수 가져오기
		listCount = commReDAO.selectReCommCount(community_num, re_ref);
		
		// 5(공통). Connection 객체 반환하기
		close(con);
		
		// 6. 전체 게시물 수 리턴
		return listCount;
	}	


}
