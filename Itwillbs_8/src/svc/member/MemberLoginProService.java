package svc.member;

import java.sql.Connection;


import dao.member.MemberDAO;
import exception.member.LoginException;

import static db.JdbcUtil.*;

public class MemberLoginProService {
	
	public boolean isLoginMember(String id, String pass) throws LoginException {
		boolean isMember = false;
		System.out.println("서비스"+id);
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		isMember = memberDAO.selectLoginMember(id, pass);
		
		close(con);
		
		return isMember;
	}

}
