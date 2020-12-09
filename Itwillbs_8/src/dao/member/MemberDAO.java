package dao.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import exception.member.LoginException;
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
				memberBean.setPhone(rs.getString("phone"));
				memberBean.setDate(rs.getTimestamp("date"));
//				memberBean.setDate(new Timestamp(System.currentTimeMillis()));
				
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


	public int deleteMember(String id, String pass) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}
	
//----------------회원가입--------------------------------
	public int insertMember(MemberBean member) {
		System.out.println("멤버디에이오");
		int insertCount=0;
		
		PreparedStatement pstmt=null;
		
		try {
//			String sql="insert into member(id,pass,email,username,img,datd,phone) values(?,?,?,?,?,?,?)";
			String sql="INSERT INTO member VALUES (?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getUsername());
			pstmt.setString(5, member.getImg());
			pstmt.setTimestamp(6, member.getDate());
			pstmt.setString(7, member.getPhone());
			
			insertCount=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertMember() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
		
		
		return insertCount;		
	}

//---------------------------로그인-------------------------------
	public boolean selectLoginMember(String id, String pass) throws LoginException {
		boolean isMember=false;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println("디에이오"+id);
		try {
			
			String sql = "SELECT pass FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
		
				if(pass.equals(rs.getString("pass"))) { 
					isMember = true;

				} else {

					throw new LoginException("패스워드 틀림");
				}
				
			} else { 

				throw new LoginException("아이디 없음");
			}
			
		} catch (SQLException e) {
			System.out.println("selectLoginMember 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isMember;
		
	}

	//---------------------------회원 정보 가져오기-------------------------------
	public MemberBean selectMember(String member_id) {
		MemberBean member = new MemberBean();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setId(member_id);
				member.setPass(rs.getString("pass"));
				member.setEmail(rs.getString("email"));
				member.setUsername(rs.getString("username"));
				member.setImg(rs.getString("img"));
				member.setDate(rs.getTimestamp("date"));
				member.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}

// 회원의 닉네임 가져오기
	public String getUsername(String member_id) {
		String username = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select username from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				username = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return username;
	}
	
	
	
}