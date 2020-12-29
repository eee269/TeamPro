package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommReListService;
import vo.ActionForward;
import vo.CommReBean;
import vo.PageInfo;

public class CommReListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CommReListAction~");
		
		ActionForward forward = null;
		

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	
		int community_num=Integer.parseInt(request.getParameter("community_num"));
		int	page = Integer.parseInt(request.getParameter("page"));
		int limit = 5;
		int arraymode = Integer.parseInt(request.getParameter("arraymode"));
		
		CommReListService commReListService = new CommReListService();	
		
		ArrayList<CommReBean> commentList = new ArrayList<CommReBean>();

			
		String json="";
		// 리뷰 원글 갯수 카운트
		int listCount = commReListService.getCommCount(community_num);
		System.out.println("listCount??"+listCount);	
//		// i값(포토 유무)에 따른 리뷰 목록 호출
//		commentList = commReListService.getCommentList(community_num, page, arraymode);
//	
		commentList = commReListService.getCommentList(community_num, page, limit, arraymode);
		// Json
		json = "{\"coReplyList\":["; 
		for (int j = 0; j < commentList.size(); j++) {
			
			String username = commentList.get(j).getUsername();
			String mem_id = commentList.get(j).getId();
			String content = commentList.get(j).getContents();
			int num = commentList.get(j).getNum();
			community_num = commentList.get(j).getCommunity_num();
			Timestamp date = commentList.get(j).getDate();
			int re_lev = commentList.get(j).getRe_lev();
			int re_ref = commentList.get(j).getRe_ref();
			String img = commentList.get(j).getImg();
			String del = commentList.get(j).getDel();
			
			if(img == null) {
				img = ""; // javascipt 에서 null 로 인식 시키기 위해 초기화
			}
			
				
			json += "[{\"del\":\""+del+"\"},";
			json += "{\"mem_id\":\"" + mem_id + "\"},";
			json += "{\"username\":\"" + username + "\"},";
			json += "{\"date\":\"" + date + "\"},";
			json += "{\"content\":\"" + content + "\"},";
			json += "{\"img\":\"" + img + "\"},";
			json += "{\"num\":\"" + num + "\"},";
			json += "{\"community_num\":\"" + community_num + "\"},";		
			json += "{\"re_lev\":\"" + re_lev + "\"},";
			json += "{\"re_ref\":\""+re_ref+"\"}]";
			
			if (j != commentList.size() - 1) {
				json += ",";
			}
		}
		json += "],\"listCount\":\""+listCount+"\"}";
//		json += "]}";

		out.print(json);
		
		System.out.println(json);
		
		return null;		


	}

}
