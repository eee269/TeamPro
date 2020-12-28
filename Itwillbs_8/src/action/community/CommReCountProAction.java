package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommReListService;
import svc.community.CommReReCountService;
import svc.community.CommReReListService;
import vo.ActionForward;
import vo.CommReBean;
import vo.PageInfo;
import vo.ProdReviewBean;

public class CommReCountProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CommReReCountProAction");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = null;

		int community_num = Integer.parseInt(request.getParameter("num"));
		
		CommReListService commReListService = new CommReListService();

		// CommReListService 클래스의 getCommentList() 메서드를 호출하여
		// 전체 게시물 목록 리턴받아 ArrayList 객체에 저장

		int reCount = commReListService.getCommAllCount(community_num);

		System.out.println("총댓글수 카운트!"+reCount);
		
		out.print(reCount);
		out.close();

		return null;
	}

}
