package svc.member;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ControlProductListService {

	public int getListCount() {
		int count=0;
		
		Connection con = getConnection();
		
		ProductDAO productDAO = ProductDAO.getInstance();		
		productDAO.setConnection(con);
		
		count = productDAO.getListCount();
		
		close(con);
		
		return count;
	}

	public ArrayList<ProductBean> getProductList(int page, int limit) {
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();

		ProductDAO productDAO = ProductDAO.getInstance();		
		productDAO.setConnection(con);
		
		
		productList = productDAO.selectProductList(page, limit);
		
		close(con);
		
		
		return productList;
	}

}
