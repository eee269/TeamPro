package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductCountService {

	public int getProductCountX(String xcode) throws Exception{
		
		int productCount = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productCount = pd.selectProductCountX(xcode);
		
		close(con);
		
		return productCount;
	}
	public int getProductCountN(String ncode) throws Exception{
		
		int productCount = 0;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productCount = pd.selectProductCountN(ncode);
		
		close(con);
		
		return productCount;
	}
	
	

}
