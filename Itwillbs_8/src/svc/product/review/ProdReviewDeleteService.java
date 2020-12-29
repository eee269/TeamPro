package svc.product.review;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.product.ProdReviewDAO;
import vo.ProdReviewBean;
public class ProdReviewDeleteService {

	public boolean removeArticle(int num) {
		boolean isDeleteSuccess = false;
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		
		int deleteCount = prodReviewDAO.deleteReview(num);

		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isDeleteSuccess;
	}

	public ProdReviewBean getReview(int num) {
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		
		ProdReviewBean prodReviewBean = prodReviewDAO.getReview(num);
		
		close(con);
		return prodReviewBean;
	}
	
}
