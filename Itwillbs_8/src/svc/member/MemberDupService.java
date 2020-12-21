package svc.member;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.member.MemberDAO;


public class MemberDupService {
	public boolean dupMember(String id) {
		boolean isDupSuccess = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		isDupSuccess=memberDAO.dupCheck(id);
				
				if(isDupSuccess) {		
					commit(con);
					isDupSuccess=true;
				}else {
					rollback(con);
				}
		
		close(con);
		return isDupSuccess;

	}
	}

