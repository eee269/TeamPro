package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductSelectService {

	public ArrayList<ProductBean> getProductListX(String xcode) {
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectProductListX(xcode);
		
		close(con);
		
		return productList;
	}
	
	public ArrayList<ProductBean> getProductListN(String ncode) {
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectProductListN(ncode);
		
		close(con);
		
		return productList;
	}
	
	

}
