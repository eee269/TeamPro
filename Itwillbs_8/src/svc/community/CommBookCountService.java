package svc.community;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;

public class CommBookCountService {
	
	// 북마크 갯수 체크
	public int CountBook(int num) {
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		int count = commDAO.CountBook(num);
		close(con);
		
		return count;
	}

	public ArrayList<Integer> hasBook(String member_id) {
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		ArrayList<Integer> bookList = commDAO.hasBook(member_id);
		close(con);
		
		return bookList;
	}

}
