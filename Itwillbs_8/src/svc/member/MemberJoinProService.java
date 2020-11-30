package svc.member;

import java.sql.Connection;

import dao.member.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberJoinProService {
	public boolean registMember(MemberBean member) {

		boolean isJoinSuccess=false;
		
		Connection con=getConnection();
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int insertCount=memberDAO.insertMember(member);
		
		if(insertCount>0) {		
			commit(con);
			isJoinSuccess=true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isJoinSuccess;
	}
	
}
