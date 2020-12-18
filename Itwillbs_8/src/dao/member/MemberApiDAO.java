package dao.member;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberBean;

public class MemberApiDAO {

	private MemberApiDAO() {}
	
	private static MemberApiDAO instance = new MemberApiDAO();

	public static MemberApiDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 회원이 있는지 체크
	public boolean userCheck(String id) {
		boolean isMember = false;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select id from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			isMember = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		
		return isMember;
	}

	// 로그인 정보 없을 시 회원가입 시행
	public int insertMember(MemberBean member) {
		int cnt = 0;
		
		PreparedStatement ps = null;
		
		try {
			String sql = "insert into member(id, pass, date, email, img, phone, username) values(?, ?, now(), ?, ?, null, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPass());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getImg());
			ps.setString(5, member.getUsername());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
		
		return cnt;
	}


}
