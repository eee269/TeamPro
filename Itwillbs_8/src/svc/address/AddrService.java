package svc.address;

import java.sql.Connection;
import java.util.ArrayList;

import dao.address.AddrDAO;
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

	public ArrayList<AddrBean> getDefaultAddr(String member_id, String addrType) {
		System.out.println("AddrService - getDefaulAddr()!");
		ArrayList<AddrBean> defaultAddr = null;
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		defaultAddr = addrDAO.getDefaultAddr(member_id, addrType);
		
		close(con);
		
		
		return defaultAddr;
	}

}
