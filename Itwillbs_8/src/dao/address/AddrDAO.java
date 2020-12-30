package dao.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
				addr.setPostcode(rs.getString(3));
				addr.setAddress(rs.getString(4));
				addr.setDetailAddress(rs.getString(5));
				addr.setMember_id(rs.getString(6));
				addr.setType(rs.getString(7));
				
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

	public JSONArray getDefaultAddr(String member_id, String addrType) {
		System.out.println("getDefaultAddr()!");
		JSONArray defaultAddr = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from memberaddress where member_id=? and addrtype=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setString(2, addrType);
			rs = ps.executeQuery();
			
			defaultAddr = new JSONArray();
			
			if(rs.next()) {
				JSONObject addr = new JSONObject();
				
				addr.put("num", rs.getInt(1));
				addr.put("location", rs.getString(2));
				addr.put("postcode", rs.getString(3));
				addr.put("address", rs.getString(4));
				addr.put("detailAddress", rs.getString(5));
				addr.put("member_id", rs.getString(6));
				addr.put("addrType",rs.getString(7));
				
//				addr.setNum(rs.getInt(1));
//				addr.setLocation(rs.getString(2));
//				addr.setPostcode(rs.getString(3));
//				addr.setAddress(rs.getString(4));
//				addr.setMember_id(rs.getString(5));
//				addr.setAddress(rs.getString(6));
				
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

	public JSONArray getRecentAddr(String member_id) {
		System.out.println("getRecentAddr()");
		JSONArray recentAddr = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		recentAddr = new JSONArray();

		try {
			String sql = "select postcode,address from mainorder where member_id = ? and date in (select MAX(date) from mainorder where member_id = ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setString(2, member_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				JSONObject addr = new JSONObject();
				
				addr.put("postcode", rs.getString(1));
				int index = rs.getString(2).indexOf("_");
				addr.put("address", rs.getString(2).substring(0,index));
				addr.put("detailAddress",rs.getString(2).substring(index+1));
				
				recentAddr.add(addr);
			}
		} catch (SQLException e) {
			System.out.println("getRecentAddr() 오류! - " +e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		
		return recentAddr;
	}

	public int insertDefaultAddr(String member_id, String postcode, String address, String detailAddress) {
		System.out.println("AddrDAO - insertDefaultAddr()");
		int insertCount = 0;
		
		PreparedStatement p = null;
		ResultSet rs = null;
		try {
			String sql = "select count(addrType),member_id from memberaddress where member_id=? and addrType=?";
			p = con.prepareStatement(sql);
			p.setString(1, member_id);
			p.setString(2, "defaultAddr");
			rs = p.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1)>0) {
					sql = "update memberaddress set addrType = '', location='' where member_id = ? and addrType=?";
					p = con.prepareStatement(sql);
					p.setString(1, member_id);
					p.setString(2, "defaultAddr");
					p.executeUpdate();
				}
			}
			
			sql = "insert into memberaddress values(?,?,?,?,?,?,?)";
			p = con.prepareStatement(sql);
			p.setInt(1, 0);
			p.setString(2, "기본배송지");
			p.setString(3, postcode);
			p.setString(4, address);
			p.setNString(5, detailAddress);
			p.setString(6, member_id);
			p.setNString(7, "defaultAddr");
			
			insertCount = p.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertDefaultAddr() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(p);
		}
		
		return insertCount;
	}

	public int insertDestination(AddrBean addr) {
		System.out.println("insertDestination()!");
		int insertCount = 0;
		
		PreparedStatement p = null;
		
		try {
			String sql = "insert into memberaddress values(?,?,?,?,?,?,?)";
			p = con.prepareStatement(sql);
			p.setInt(1, addr.getNum());
			p.setString(2, addr.getLocation());
			p.setString(3, addr.getPostcode());
			p.setString(4, addr.getAddress());
			p.setString(5, addr.getDetailAddress());
			p.setString(6, addr.getMember_id());
			p.setString(7, addr.getType());
			
			insertCount = p.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertDestination() 오류! - "+e.getMessage());
			e.printStackTrace();
		}finally {
			close(p);
		}
		return insertCount;
	}

	public int deleteDestination(String postcode) {
		System.out.println("deleteDestination()!");
		int deleteCount = 0;
		
		PreparedStatement p = null;
		
		try {
			String sql = "delete from memberaddress where postcode = ?";
			p = con.prepareStatement(sql);
			p.setString(1,postcode);
			
			deleteCount = p.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteDestination() 오류! - "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(p);
		}
		return deleteCount;
	}
	
	
}
