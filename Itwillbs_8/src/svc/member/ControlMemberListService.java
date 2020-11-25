package svc.member;

import java.sql.Connection;
import java.util.ArrayList;

import dao.member.MemberDAO;

import static db.JdbcUtil.*;

import vo.MemberBean;

public class ControlMemberListService {

	public int getListCount() {
		int count=0;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		count = memberDAO.getListCount();
		
		close(con);
		
		return count;
	}

	public ArrayList<MemberBean> getMemberList(int page, int limit) {
		ArrayList<MemberBean> memberList = null;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		memberList = memberDAO.selectMemberList(page, limit);
		
		close(con);
		
		
		return memberList;
	}

}
