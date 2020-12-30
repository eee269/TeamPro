package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommReReWriteProService;
import svc.community.CommReWriteProService;
import vo.ActionForward;
import vo.CommReBean;

public class CommReReWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommReReWriteProAction");
		
		ActionForward forward = null;
		
		// 현재 컨텍스트(객체) 정보 가져오기 위해 
		// request 객체의 getServletContext() 메서드를 호출
		ServletContext context = request.getServletContext();
		
		Timestamp date=new Timestamp(System.currentTimeMillis());
		int community_num=Integer.parseInt(request.getParameter("community_num"));
		
		CommReBean crb = new CommReBean();
		crb.setUsername(request.getParameter("username"));
		crb.setCommunity_num(community_num);
		crb.setContents(request.getParameter("contents"));
		crb.setRe_ref(Integer.parseInt(request.getParameter("num")));
		crb.setRe_lev(1);
		crb.setDate(date);

//		// 서비스 클래스를 통해 실제 글 등록 작업 수행을 위한 요청
		CommReReWriteProService commReReWriteProService = new CommReReWriteProService();
		boolean isWriteSuccess = commReReWriteProService.registReComment(crb);
				
		// 대댓글쓰기 작업 수행 후 리턴받은 결과값을 사용하여
		// 대댓글쓰기 성공/실패 여부를 판단
		// => 만약, 실패했을 경우 자바스크립트를 사용하여 이전페이지로 이동
		// => 만약, 성공했을 경우 ActionForward 객체를 생성하여
		//    포워딩 경로(CommDetail.bo)와 포워딩 방식(새 요청이므로 Redirect) 지정
		
		if(!isWriteSuccess) {
			// 글쓰기 작업 실패 시 자바스크립트를 통해
			// 실패 메세지 출력 후 이전 페이지로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
//			forward = new ActionForward();
//			forward.setPath("CommDetail.co?num="+community_num);
//			forward.setRedirect(true);
		}

		return forward;
	}

}
