package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class NcodeSelectService {

	public ArrayList<ProductBean> getNcodeList(String xcode) {
		
		ArrayList<ProductBean> ncodeList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		ncodeList = pd.selectNcodeList(xcode);
		
		close(con);
		
		return ncodeList;
	}
	
	

}
