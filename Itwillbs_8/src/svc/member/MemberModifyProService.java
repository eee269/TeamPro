package svc.member;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.member.MemberDAO;
import vo.MemberBean;

public class MemberModifyProService {
public boolean isUpdateMember(String id, String pass, MemberBean member) throws Exception {
		
		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		
		isUpdateSuccess=memberDAO.isUpdateMember(id, pass);
		
		close(con);
		
		return isUpdateSuccess;
	}
	
	public boolean updateMember(MemberBean member) {
boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		int updateCount=memberDAO.updateMember(member);
		if(updateCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		
		// 6(공통). Connection 객체 반환하기
		close(con);
		
		// 7. 결과 리턴
		return isUpdateSuccess;
	}

}

