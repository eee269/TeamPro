package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

public class ProductDetailSelectService {

	public ArrayList<ProductBean> getProductDetailList(String basicCode) throws Exception{
		
		ArrayList<ProductBean> productDetailList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		productDetailList = pd.selectProductDetailList(basicCode);
		
		close(con);
		
		return productDetailList;
	}

	
	

}
