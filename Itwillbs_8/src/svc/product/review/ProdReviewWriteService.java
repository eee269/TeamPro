package svc.product.review;

import dao.product.ProdReviewDAO;
import vo.ProdReviewBean;

import static db.JdbcUtil.*;

import java.sql.Connection;


public class ProdReviewWriteService {
	
	
	// --------------registReview()------------------
	public boolean registReview(ProdReviewBean prodReviewBean) {
		System.out.println("ProdReviewWriteService");
		// 리뷰 등록
		boolean isReviewSuccess = false;
		
		Connection con = getConnection();
		
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		
		prodReviewDAO.setConnection(con);
		
		int insertCount = prodReviewDAO.insertReview(prodReviewBean);
		
		if(insertCount > 0) {
			// 리뷰 등록 성공
			commit(con);
			isReviewSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isReviewSuccess;
	}
	// --------------registReview()------------------

}
