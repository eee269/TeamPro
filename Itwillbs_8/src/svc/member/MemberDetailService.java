package svc.member;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.member.MemberDAO;
import vo.MemberBean;

public class MemberDetailService {
	public MemberBean getMember(String id) throws Exception{
		System.out.println("멤버디테일서비스");
		
		Connection con=getConnection();
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		MemberBean member=memberDAO.jselectMember(id);
		System.out.println("디테일서비스 멤버"+id);
		if(member != null) {		
			System.out.println("멤버디테일서비스 셀렉트");
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return  member;
		
		
	}
}
