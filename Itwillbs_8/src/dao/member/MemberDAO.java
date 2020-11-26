package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommBean;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberDAO {
	
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}


	public ArrayList<MemberBean> selectMemberList() {
		ArrayList<MemberBean> memberList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM member ORDER BY date desc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			memberList = new ArrayList<MemberBean>();
			
			while(rs.next()) {
				MemberBean memberBean = new MemberBean();
				
				memberBean.setId(rs.getString("id"));
				memberBean.setPass(rs.getString("pass"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setUsername(rs.getString("username"));
				memberBean.setImg(rs.getString("img"));
				memberBean.setPhone(rs.getInt("phone"));
				memberBean.setDate(rs.getDate("date"));
				
				memberList.add(memberBean);
			}
			
		} catch (SQLException e) {
			System.out.println("selectMemberList() 오류 "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return memberList;
	}


	public int deleteMember(String id) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}
	

}
