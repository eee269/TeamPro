package svc.member;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.member.MemberApiDAO;
import vo.MemberBean;

public class MemberApiLoginService {

	public boolean isMember(String id) {
		boolean isMember = false;
		
		Connection con = getConnection();
		
		MemberApiDAO dao = MemberApiDAO.getInstance();
		dao.setConnection(con);
		isMember = dao.userCheck(id);
		
		return isMember;
	}

	public boolean insertMember(MemberBean member) {
		boolean isSuccess = false;
		
		Connection con = getConnection();
		

		MemberApiDAO dao = MemberApiDAO.getInstance();
		dao.setConnection(con);
		int cnt = dao.insertMember(member);
		
		if(cnt > 0) {
			isSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		
		return isSuccess;
	}
	
}
