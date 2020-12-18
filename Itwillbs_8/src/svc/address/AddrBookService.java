package svc.address;

import java.sql.Connection;
import java.util.ArrayList;

import dao.address.AddrDAO;
import vo.AddrBean;
import static db.JdbcUtil.*;

public class AddrBookService {

	public ArrayList<AddrBean> getAddrBook(String member_id) {
		System.out.println("AddrBookService - getAddrBook()!");
		ArrayList<AddrBean> addrBook = new ArrayList<AddrBean>();
		
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		addrBook = addrDAO.getAddrList(member_id);
		
		close(con);
		
		return addrBook;
	}

	public boolean RegistDestination(AddrBean addr) {
		System.out.println("AddrBookService - RegistDestination()!");
		boolean isRegistSuccess = false;
		
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		int insertCount = addrDAO.insertDestination(addr);
		
		if(insertCount > 0) {
			commit(con);
			isRegistSuccess = true;
		}else {
			rollback(con);
		}
		
		return isRegistSuccess;
	}

	public boolean RemoveDestination(String postcode) {
		System.out.println("AddrBookService - RemoveDestination()!");
		boolean isRemoveSuccess = false;
		
		Connection con = getConnection();
		
		AddrDAO addrDAO = AddrDAO.getInstance();
		
		addrDAO.setConnection(con);
		
		int deleteCount = addrDAO.deleteDestination(postcode);
		
		if(deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;
		}else {
			rollback(con);
		}
		
		return isRemoveSuccess;
	}

}
