package svc.address;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;

import dao.address.AddrDAO;
import okhttp3.Request;
import vo.AddrBean;

import static db.JdbcUtil.*;

public class AddrService {

	public ArrayList<AddrBean> getAddrList(String member_id) {
		System.out.println("AddrService - getAddrList()!");
		ArrayList<AddrBean> addrList = null;
		
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		addrList = addrDAO.getAddrList(member_id);
		
		close(con);
		
		return addrList;
	}

	public ArrayList<JSONArray> getDefaultAddr(String member_id, String addrType) {
		System.out.println("AddrService - getDefaulAddr()!");
		ArrayList<JSONArray> defaultAddr = null;
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		defaultAddr = addrDAO.getDefaultAddr(member_id, addrType);
		
		close(con);
		
		return defaultAddr;
	}

	public ArrayList<JSONArray> getRecentAddr(String member_id) {
		System.out.println("AddrService - getRecentAddr()");
		ArrayList<JSONArray> recentAddr = null;
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		recentAddr = addrDAO.getRecentAddr(member_id);
		
		close(con);
		
		return recentAddr;
	}

	public boolean RegistDefaultAddr(String member_id, String postcode, String address) {
		System.out.println("AddrService - RegistDefaultAddr()");
		boolean isRegistSuccess = false;
		
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		int insertCount = addrDAO.insertDefaultAddr(member_id, postcode, address);
		
		if(insertCount > 0) {
			commit(con);
			isRegistSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isRegistSuccess;
	}

}
