package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductSelectService {

	public ArrayList<ProductBean> getProductListX(String xcode,int page, int limit) throws Exception{
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectProductListX(xcode,page,limit);
		
		close(con);
		
		return productList;
	}
	
	public ArrayList<ProductBean> getProductListN(String ncode,int page, int limit) throws Exception {
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectProductListN(ncode,page,limit);
		
		close(con);
		
		return productList;
	}
	
	public ArrayList<ProductBean> getMainProductList() throws Exception{
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectMainProductList();
		
		close(con);
		
		return productList;
	}
	
	public ArrayList<ProductBean> getSearchProductList(String search) throws Exception{
		
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productList = pd.selectSearchProductList(search);
		
		close(con);
		
		return productList;
	}
	
	

}
