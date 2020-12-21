package action.community;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.community.CommWriteProService;
import vo.ActionForward;
import vo.CommBean;

public class CommWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommWriteProAction!");
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		// 전달받은 파라미터(글쓴이, 비밀번호, 글제목, 내용, 작성일) 가져오기
		ServletContext context = request.getServletContext();
		
		// 프로젝트 상에서 설정한 가상 업로드 폴더 경로 지정
		String saveFolder = "/upload/commUpload";
		
		// 가상 폴더에 대응하는 실제 폴더 위치를 가져오기 위해
		// ServletContext 객체의 getRealPath() 메서드를 호출
		String realFolder = context.getRealPath(saveFolder);
		
		// 업로드 할 최대 파일 크기 지정(Byte 단위)
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
		
		// 전달할 데이터를 CommBean 객체에 저장
		CommBean commBean = new CommBean();
		commBean.setMember_id(member_id);
		commBean.setSubject(multi.getParameter("subject"));
		commBean.setContent(multi.getParameter("content"));
		commBean.setImg(multi.getOriginalFileName("img"));
		// -------------------------------------------------------------------------------------
		// 서비스 클래스를 통해 실제 글 등록 작업 수행을 위한 요청
		CommWriteProService commWriteProService = new CommWriteProService();
		boolean isWriteSuccess = commWriteProService.registArticle(commBean);
		
		
		
		// 글쓰기 작업 수행 후 리턴받은 결과값을 사용하여 
		// 글쓰기 성공/실패 여부를 판단
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('글 등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); 
			out.println("</script>"); // 자바스크립트 끝 태그
		}else {
			forward = new ActionForward();
			//    (주의! 경로명 앞에 슬래시(/) 기호 붙이지 말 것!)
			forward.setPath("CommList.co");
			// 3. 포워딩 방식(Redirect 방식) 지정
			forward.setRedirect(true);
			
		}
		return forward;
	}

}
