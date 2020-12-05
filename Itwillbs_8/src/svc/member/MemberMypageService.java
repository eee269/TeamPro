package svc.member;

import java.sql.Connection;
import java.util.ArrayList;

import dao.community.CommDAO;
import dao.member.MemberDAO;
import dao.order.OrderDAO;
import vo.CommBean;
import vo.DetailOrderBean;
import vo.MemberBean;
import vo.OrderBean;

import static db.JdbcUtil.*;

public class MemberMypageService {

	public MemberBean getMember(String member_id) {
		MemberBean member = new MemberBean();
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		member = memberDAO.selectMember(member_id);
		
		return member;
	}
	
	public ArrayList<DetailOrderBean> getDetailorderList(String mainorder_code) {
		ArrayList<DetailOrderBean> detailorderList = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		
		detailorderList = new ArrayList<DetailOrderBean>();
		detailorderList = orderDAO.getDetailorderList(mainorder_code);
				
		close(con);
			
		return detailorderList;
	}

	public ArrayList<OrderBean> getMainorderList(String member_id) {
		ArrayList<OrderBean> mainorderList = null;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		orderDAO.setConnection(con);
		mainorderList = new ArrayList<OrderBean>();
		mainorderList = orderDAO.selectOrderList(member_id);
		
		close(con);
		
		return mainorderList;
	}

	public ArrayList<CommBean> getArticleList(String username) {
		ArrayList<CommBean> articleList = new ArrayList<CommBean>();
		
		Connection con = getConnection();
		
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		articleList = commDAO.selectArticleList(username);
		
		close(con);
		
		return articleList;
	}
	
	

}
