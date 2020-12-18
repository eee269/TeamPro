package svc.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;

import dao.product.ProductDAO;
import vo.ProductBean;
import vo.ProductLikeBean;

public class ProductAjaxService {

	public ArrayList<String> getLikeBasicCodeList(String id) throws Exception{
		
		ArrayList<String> likeBasicCodeList = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		likeBasicCodeList = pd.selectLikeBasicCodeList(id);
		
		close(con);
		
		return likeBasicCodeList;
	}
	
	public HashMap<String, String> getCartLike(String id) throws Exception{
		
		HashMap<String, String> cartLike = null;
		
		Connection con = getConnection();
		ProductDAO pd = ProductDAO.getInstance();
		pd.setConnection(con);
		
		cartLike = pd.selectCartLike(id);
		
		close(con);
		
		return cartLike;
	}
	

}
