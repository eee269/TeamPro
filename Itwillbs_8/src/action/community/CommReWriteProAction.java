package action.community;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.community.CommReWriteProService;
import vo.ActionForward;
import vo.CommReBean;

public class CommReWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommReWriteProAction");
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		// 현재 컨텍스트(객체) 정보 가져오기 위해 
		// request 객체의 getServletContext() 메서드를 호출
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/upload/commReUpload";
		
		String realFolder = context.getRealPath(saveFolder);
		
		int fileSize = 1024 * 1024 * 10; // 10mb		

		MultipartRequest multi= new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		Timestamp date=new Timestamp(System.currentTimeMillis());		
		int community_num=Integer.parseInt(multi.getParameter("community_num"));
		

		
		CommReBean crb = new CommReBean();
		crb.setUsername(multi.getParameter("username"));
		crb.setCommunity_num(community_num);
		crb.setContents(multi.getParameter("reply_contents"));	
		crb.setDate(date);
//		crb.setImg(multi.getOriginalFileName("reply_file"));
		crb.setImg(multi.getFilesystemName("reply_file"));


//		// 서비스 클래스를 통해 실제 글 등록 작업 수행을 위한 요청
		CommReWriteProService commReWriteProService = new CommReWriteProService();
		boolean isWriteSuccess = commReWriteProService.registComment(crb);

				
		// 댓글쓰기 작업 수행 후 리턴받은 결과값을 사용하여
		// 댓글쓰기 성공/실패 여부를 판단
		// => 만약, 실패했을 경우 자바스크립트를 사용하여 이전페이지로 이동
		// => 만약, 성공했을 경우 ActionForward 객체를 생성하여
		//    포워딩 경로(CommDetail.co)와 포워딩 방식(새 요청이므로 Redirect) 지정
		
		if(!isWriteSuccess) {
			// 글쓰기 작업 실패 시 자바스크립트를 통해
			// 실패 메세지 출력 후 이전 페이지로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 등록 실패!')");
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
