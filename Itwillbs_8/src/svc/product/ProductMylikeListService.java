package svc.product;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProductDAO;
import vo.ProductBean;

import static db.JdbcUtil.*;

public class ProductMylikeListService {

	public ArrayList<String> getMylikeList(String member_id) {
		ArrayList<String> mylikeList = new ArrayList<String>();
		
		Connection con = getConnection();
		
		ProductDAO pdao = ProductDAO.getInstance();
		pdao.setConnection(con);
		mylikeList = pdao.selectMylikeList(member_id);
		
		close(con);
		
		return mylikeList;
	}

	public ArrayList<ProductBean> getProductList(ArrayList<String> mylikeList) {
		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		
		Connection con = getConnection();
		
		ProductDAO pdao = ProductDAO.getInstance();
		pdao.setConnection(con);
		productList = pdao.selectProductList(mylikeList);
		
		close(con);
		
		return productList;
	}

}
