package svc.community;

import java.util.ArrayList;

import java.sql.Connection;

import dao.community.CommReDAO;
import vo.CommReBean;

import static db.JdbcUtil.*;



public class CommReReListService {

	public int getReCommCount(int community_num) throws Exception {
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
		listCount = commReDAO.selectCommCount(community_num);
		
		// 5(공통). Connection 객체 반환하기
		close(con);
		
		// 6. 전체 게시물 수 리턴
		return listCount;
	}	
	
	public ArrayList<CommReBean> getReCommentList(int community_num,int comment_num) {
//		System.out.println("CommReListService - getCommentList()");
		System.out.println("getReCommentList");
		ArrayList<CommReBean> reCommentList = null;
		
		//1. 공통
		Connection con = getConnection();
		//2. 공통
		CommReDAO commReDAO = CommReDAO.getInstance();
		//3. 공통
		commReDAO.setConnection(con);
				
		//4. commReDAO 객체의 selectcommentList() 메서드를 호출하여
		//   게시물 목록 조회 결과를 ArrayList 객체로 리턴받기	
		reCommentList = commReDAO.selectReCommentList(community_num,comment_num);
				
		//5. 공통
		close(con);
		
		return reCommentList;
	}



}
