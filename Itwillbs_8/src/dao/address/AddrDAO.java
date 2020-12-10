package dao.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AddrBean;
import static db.JdbcUtil.*;
public class AddrDAO {
	Connection con;
	
	private AddrDAO() {}
	
	private static AddrDAO instance = new AddrDAO();
	
	public static AddrDAO getInstance() {
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<AddrBean> getAddrList(String member_id) {
		System.out.println("AddrDAO - getAddrList()!");
		ArrayList<AddrBean> addrList = null;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from memberaddress where member_id = ?";
			p = con.prepareStatement(sql);
			p.setString(1, member_id);
			rs = p.executeQuery();
			
			addrList = new ArrayList<AddrBean>();
			
			while(rs.next()) {
				AddrBean addr = new AddrBean();
				
				addr.setNum(rs.getInt(1));
				addr.setLocation(rs.getString(2));
				addr.setAddress(rs.getString(3));
				addr.setMember_id(rs.getString(4));
				
				addrList.add(addr);
			}
			
		} catch (SQLException e) {
			System.out.println("getAddrList() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(p);
		}
		
		return addrList;
	}

	public ArrayList<AddrBean> getDefaultAddr(String member_id, String addrType) {
		System.out.println("getDefaultAddr()!");
		ArrayList<AddrBean> defaultAddr = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from memberaddress where member_id=? and addrtype=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setString(2, addrType);
			rs = ps.executeQuery();
			
			defaultAddr = new ArrayList<AddrBean>();
			
			if(rs.next()) {
				AddrBean addr = new AddrBean();
				addr.setNum(rs.getInt(1));
				addr.setLocation(rs.getString(2));
				addr.setPostcode(rs.getString(3));
				addr.setAddress(rs.getString(4));
				addr.setMember_id(rs.getString(5));
				addr.setAddress(rs.getString(6));
				
				defaultAddr.add(addr);
			}
		} catch (SQLException e) {
			System.out.println("getDefaultAddr() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		return defaultAddr;
	}
	
	
}
