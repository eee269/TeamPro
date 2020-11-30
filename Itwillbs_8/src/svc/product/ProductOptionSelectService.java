package svc.product;


import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductOptionBean;

public class ProductOptionSelectService {

	public ArrayList<ProductOptionBean> getColorList(String basicCode){
		
		ArrayList<ProductOptionBean> optList = null;
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		optList = pd.selectColorList(basicCode);
		
		close(con);
		
		return optList;
		
	}
	public ArrayList<ProductOptionBean> getSizeList(String basicCode){
		
		ArrayList<ProductOptionBean> sizeList = null;
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		sizeList = pd.selectSizeList(basicCode);
		
		close(con);
		
		return sizeList;
		
	}
}
