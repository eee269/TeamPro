package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class BestSelectService {

	public ArrayList<ProductBean> getBestList(String xcode) throws Exception {
		
		ArrayList<ProductBean> bestList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		bestList = pd.selectBestList(xcode);
		
		close(con);
		
		return bestList;
	}
	public ArrayList<ProductBean> getNewList() throws Exception {
		
		ArrayList<ProductBean> bestList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		bestList = pd.selectNewList();
		
		close(con);
		
		return bestList;
	}
	
	

}
