package svc.community;
import static db.JdbcUtil.*;

import java.sql.Connection;

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

}
