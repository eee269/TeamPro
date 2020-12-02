package svc.member;

import java.sql.Connection;

import dao.member.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberMypageService {

	public MemberBean getMember(String member_id) {
		MemberBean member = new MemberBean();
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		member = memberDAO.selectMember(member_id);
		
		return member;
	}

}
