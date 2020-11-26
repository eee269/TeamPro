package svc.member;

import java.sql.Connection;
import java.util.ArrayList;

import dao.member.MemberDAO;

import static db.JdbcUtil.*;

import vo.MemberBean;

public class ControlMemberListService {

	public ArrayList<MemberBean> getMemberList() {
		ArrayList<MemberBean> memberList = null;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		memberList = memberDAO.selectMemberList();
		
		close(con);
		
		
		return memberList;
	}

}
