package svc.product.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;
import dao.member.MemberDAO;
import dao.product.ProdReviewDAO;
import vo.ProdReviewBean;

public class ProdReviewListService {
	
	// ------------------------getReviewListCount()----------------------
	// 전체 상품 리뷰 수 리턴
	public int getReviewListCount(String basicCode, int pic) {
		System.out.println("ProdReviewListService - getReviewListCount()");
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		
		// 리뷰 수 리턴
		int listCount = prodReviewDAO.selectListCount(basicCode, pic);
		
		close(con);
		
		return listCount;
	}
	// ------------------------getReviewListCount()----------------------
	// ------------------------getReviewList()----------------------
	// 상품 리뷰 가져오기 
	public ArrayList<ProdReviewBean> getReviewList(int page, int limit, String basicCode, int pic, int sort) {
		System.out.println("ProdReviewListService - getReviewList()");
		ArrayList<ProdReviewBean> reviewList = null;
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		
		// 상품 리뷰 리턴
		reviewList=prodReviewDAO.selectReviewList(page,limit,basicCode,pic,sort);
		// 멤버 정보 리턴
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
//		memberDAO.selectMemberList()
		
		close(con);
		
		return reviewList;
	}
	// ------------------------getReviewList()----------------------
	// ------------------------getReviewList()----------------------
	// 페이징 없이 상품 리뷰 가져오기
	public ArrayList<ProdReviewBean> getReviewList(String basicCode) {
		System.out.println("ProdReviewListService - getReviewList()/페이징없이");
		ArrayList<ProdReviewBean> reviewList = null;
		
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);

		reviewList=prodReviewDAO.selectReviewList(basicCode);
		
		close(con);
		
		return reviewList;
	}
	// ------------------------getReviewList()----------------------
	// ------------------------checkReview()----------------------
	public int checkReviewRec(int num, String id, int recommand) {
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		int checkCount = prodReviewDAO.checkReviewRec(num,id,recommand);
		close(con);
		
		return checkCount;
	}
	// ------------------------checkReview()----------------------
	// ------------------------updateReview()----------------------
	public void updateReviewRec(int num, String id, int recommand) {
		// 리뷰 추천 추가
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		int updateCount = prodReviewDAO.updateReviewRec(num,id,recommand);
		if(updateCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
	}
	// ------------------------updateReview()----------------------
	// ------------------------deleteReview()----------------------
	public void deleteReviewRec(int num, String id, int recommand) {
		// 리뷰 추천 삭제
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		int deleteCount = prodReviewDAO.deleteReviewRec(num,id,recommand);
		if(deleteCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
	}
	// ------------------------deleteReview()----------------------
	// ------------------------CountReviewRec()----------------------
	public int CountReviewRec(int num, int recommand) {
		Connection con = getConnection();
		ProdReviewDAO prodReviewDAO = ProdReviewDAO.getInstance();
		prodReviewDAO.setConnection(con);
		int count = prodReviewDAO.CountReviewRec(num, recommand);
		close(con);
		
		return count;
	}
	// ------------------------CountReviewRec()----------------------

}
