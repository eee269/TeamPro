package svc.community;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;

import static db.JdbcUtil.*;

import vo.CommBean;

public class MybookmarkListService {

	public ArrayList<CommBean> getMybookArticleList(String member_id) {
		System.out.println("MybookmarkListService");
		ArrayList<CommBean> list = new ArrayList<CommBean>();
		
		Connection con = getConnection();
		
		CommDAO comm = CommDAO.getInstance();
		comm.setConnection(con);
		list = comm.selectMybookArticleList(member_id);
		
		close(con);
		
		return list;
	}

}
