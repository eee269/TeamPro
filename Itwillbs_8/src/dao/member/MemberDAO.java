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

	public int getListCount() {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("setConnection() 오류 "+e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	public ArrayList<MemberBean> selectMemberList(int page, int limit) {
		ArrayList<MemberBean> memberList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit; // 조회를 시작할 레코드(행) 번호 계산
		
		try {
			String sql = "SELECT * FROM member ORDER BY date desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, limit);
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
	
	

}
