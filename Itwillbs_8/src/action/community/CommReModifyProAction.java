package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommReModifyProService;
import vo.ActionForward;
import vo.CommReBean;

public class CommReModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 댓글 수정을 요청하는 Action 클래스
		System.out.println("CommReModifyProAction");
		
		ActionForward forward = null;
		
		// 게시물 수정에 필요한 글번호(board_num) 가져오기
		int community_num=Integer.parseInt(request.getParameter("community_num"));
		
		// BoardModifyProService 클래스 인스턴스 생성
		CommReModifyProService commReModifyProService = new CommReModifyProService();

		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		// 패스워드가 일치할 경우(= 적합한 사용자일 경우)
		// BoardBean 객체 생성하여 수정폼으로부터 전달받은 항목을 저장
		// => 글번호, 작성자, 제목, 내용
		CommReBean crb = new CommReBean();
		crb.setUsername(request.getParameter("username"));
		crb.setCommunity_num(Integer.parseInt(request.getParameter("community_num")));
		crb.setNum(Integer.parseInt(request.getParameter("num")));
		crb.setContents(request.getParameter("contents"));
		crb.setDate(date);
			
		// commReModifyProService 클래스의 modifyComment() 메서드를 호출하여
		// 글 수정 작업 요청
		// => 파라미터 : CommReBean, 리턴타입 : boolean(isModifySuccess)
				
		boolean isModifySuccess = commReModifyProService.modifyComment(crb);
				
		// 수정 결과에 따른 처리
		// 수정 실패(isModifySuccess 가 false)일 경우 자바스크립트를 사용하여
		// "댓글 수정 실패!" 출력 후 이전페이지로 이동
		// =>아니면 ActionForward 객체 생성 후 CommDetail.bo로 포워딩
		//   새 요청이 발생하므로 Redirect 방식으로 이동
		//   파라미터로 글번호(community_num)와 페이지번호(page) 전달 필요
		if(!isModifySuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("CommDetail.co?num="+community_num+"&rePage="+request.getParameter("rePage"));
			forward.setRedirect(true);		
		}
			
		return forward;
	}

}
