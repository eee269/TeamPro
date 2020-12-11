package svc.community;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import dao.community.CommDAO;
import dao.community.CommReDAO;

import static db.JdbcUtil.*;

import vo.CommBean;
import vo.CommReBean;

public class MycommReplyListService {

	public ArrayList<CommReBean> getMyreplyList(String member_id) {
		ArrayList<CommReBean> list = new ArrayList<CommReBean>();
		
		Connection con = getConnection();
		
		CommReDAO redao = CommReDAO.getInstance();
		redao.setConnection(con);
		list = redao.selectMyreplyList(member_id);
		
		close(con);
		
		return list;
	}

	public HashMap<Integer, CommBean> getArticleHash(ArrayList<CommReBean> myreplyList) {
		HashMap<Integer, CommBean> hash = new HashMap<Integer, CommBean>();
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		hash = commDAO.selectArticleHash(myreplyList);
		
		close(con);
		
		
		return hash;
	}

}
