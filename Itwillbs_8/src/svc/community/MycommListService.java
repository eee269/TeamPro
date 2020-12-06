package svc.community;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;
import dao.member.MemberDAO;

import static db.JdbcUtil.*;

import vo.CommBean;

public class MycommListService {

	public String getUsername(String member_id) {
		String username = null;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		username = memberDAO.getUsername(member_id);
		
		close(con);
		
		return username;
	}

	public ArrayList<CommBean> getArticleList(String username) {
		ArrayList<CommBean> articleList = new ArrayList<CommBean>();
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		articleList = commDAO.selectArticleList(username);
		
		close(con);
		
		return articleList;
	}

}
