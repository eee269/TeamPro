package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ControlProductListService {

	public ArrayList<ProductBean> getProductList() {
		ArrayList<ProductBean> productList = null;
		
		Connection con = getConnection();

		ProductDAO productDAO = ProductDAO.getInstance();		
		productDAO.setConnection(con);
		productList = productDAO.selectProductList();
		
		close(con);
		
		
		return productList;
	}

	public ArrayList<ProductOptionBean> getOptionList(String basicCode) {
		ArrayList<ProductOptionBean> optionList = null;
		
		Connection con = getConnection();

		ProductDAO productDAO = ProductDAO.getInstance();		
		productDAO.setConnection(con);
		optionList = productDAO.selectOptionList(basicCode);
		
		close(con);
		
		
		return optionList;
	}

	

}
