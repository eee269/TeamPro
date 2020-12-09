package svc.product.review;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProdReviewDAO;

import static db.JdbcUtil.*;

import vo.ProdReviewBean;

public class ProductMyreviewListService {

	public ArrayList<ProdReviewBean> getProMyreviewList(String member_id) {
		ArrayList<ProdReviewBean> list = new ArrayList<ProdReviewBean>();
		
		Connection con = getConnection();
		
		ProdReviewDAO pdao = ProdReviewDAO.getInstance();
		pdao.setConnection(con);
		list = pdao.selectMyreviewList(member_id);
		
		close(con);
		
		return list;
	}

}
