package svc.product.qna;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProdQnaDAO;

import static db.JdbcUtil.*;

import vo.ProdQnaBean;

public class ProductMyqnaListService {

	public ArrayList<ProdQnaBean> getMyqnaList(String member_id) {
		ArrayList<ProdQnaBean> list = new ArrayList<ProdQnaBean>();
		
		Connection con = getConnection();
		
		ProdQnaDAO prodQnaDAO = ProdQnaDAO.getInstance();
		prodQnaDAO.setConnection(con);
		list = prodQnaDAO.selectMyqnaList(member_id);
		
		close(con);
		
		return list;
	}

}
