package svc.member;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.member.MemberDAO;


public class DeleteMemberService {

	public boolean deleteMember(String id) {
boolean isDelete = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		int count = memberDAO.deleteMember(id);
		
		if(count > 0) {
			commit(con);
			isDelete = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDelete;
	}

}
