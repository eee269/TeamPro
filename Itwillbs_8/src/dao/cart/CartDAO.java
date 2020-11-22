package dao.cart;

import java.sql.Connection;
import static db.JdbcUtil.*;

public class CartDAO extends Exception {
	// ==================================================
	private CartDAO() {}
	
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
			return instance;
	}
	// ==================================================
	
	Connection con;
	
	public void setConnection(Connection con) {
		
		this.con = con;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
