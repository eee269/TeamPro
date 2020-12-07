package svc.community;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;

import static db.JdbcUtil.*;

import vo.CommBean;

public class MybookmarkListService {

	public ArrayList<Integer> getMybookmarkList(String member_id) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		Connection con = getConnection();
		
		CommDAO comm = CommDAO.getInstance();
		comm.setConnection(con);
		list = comm.selectMybookmarkList(member_id);
		
		close(con);
		
		return list;
	}

	public ArrayList<CommBean> getArticleList(ArrayList<Integer> mybookList) {
		ArrayList<CommBean> list = new ArrayList<CommBean>();
		
		Connection con = getConnection();
		
		CommDAO comm = CommDAO.getInstance();
		comm.setConnection(con);
		list = comm.selectArticleList(mybookList);
		
		close(con);
		
		return list;
	}

}
