package svc.community;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;
import dao.member.MemberDAO;

import static db.JdbcUtil.*;

import vo.CommBean;

public class MycommListService {

	public ArrayList<CommBean> getArticleList(String member_id) {
		ArrayList<CommBean> articleList = new ArrayList<CommBean>();
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		articleList = commDAO.selectArticleList(member_id);
		
		close(con);
		
		return articleList;
	}

}
