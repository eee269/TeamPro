package svc.product;

import java.sql.Connection;
import java.util.ArrayList;

import dao.product.ProdReviewDAO;

import static db.JdbcUtil.*;
import vo.ProdReviewBean;

public class ProdReviewListService {
	
	// ------------------------getReviewListCount()----------------------
	// 전체 상품 리뷰 수 리턴
	public int getReviewListCount(String basicCode) {
		System.out.println("ProdReviewListService - getReviewListCount()");
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnetion(con);
		
		// 리뷰 수 리턴
		int listCount = prodReviewDAO.selectListCount(basicCode);
		
		close(con);
		
		return listCount;
	}
	// ------------------------getReviewListCount()----------------------
	// ------------------------getReviewList()----------------------
	// 상품 리뷰 가져오기 
	public ArrayList<ProdReviewBean> getReviewList(int page, int limit, String basicCode) {
		System.out.println("ProdReviewListService - getReviewList()");
		ArrayList<ProdReviewBean> reviewList = null;
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnetion(con);
		
		// 상품 리뷰 리턴
		reviewList=prodReviewDAO.selectReviewList(page,limit,basicCode);
				
		close(con);
		
		return reviewList;
	}
	// ------------------------getReviewList()----------------------

}
