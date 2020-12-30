package action.community;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CommReDeleteProService;
import vo.ActionForward;
import vo.CommReBean;
import vo.ProdReviewBean;

public class CommReDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommReDeleteProAction");
		
		ActionForward forward = null;
		
		// 현재 컨텍스트(객체) 정보 가져오기 위해 
		// request 객체의 getServletContext() 메서드를 호출
		ServletContext context = request.getServletContext();
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		int community_num = Integer.parseInt(request.getParameter("community_num"));

		CommReDeleteProService  commDeleteProService  = new CommReDeleteProService ();
		
		boolean isDeleteSuccess = commDeleteProService.removeComment(num,community_num);
		
		CommReBean commReBean = commDeleteProService.getComment(num,community_num);
		
		// 수정 결과에 따른 처리
		// 수정 실패(isDeleteSuccess 가 false)일 경우 자바스크립트를 사용하여
		// "글 삭제 실패!" 출력 후 이전페이지로 이동
		// =>아니면 ActionForward 객체 생성 후 CommDetail.bo로 포워딩
		//   새 요청이 발생하므로 Redirect 방식으로 이동
		//   파라미터로 글번호(board_num)와 페이지번호(page) 전달 필요
		if(!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {		
			//db 데이터 삭제 성공 시 실제 저장된 이미지 삭제			
			String saveFolder = "upload/commReUpload";
			String realFolder = context.getRealPath(saveFolder);			
		
			String img = commReBean.getImg();		
			File f = new File(realFolder + "/" + img);
			if(f.exists()) {f.delete();}
			
//			forward = new ActionForward();
//			forward.setPath("CommDetail.co?num="+community_num);
//			forward.setRedirect(true);
		}
		
		return forward;
	}

}
