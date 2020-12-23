package action.member;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.member.MemberModifyProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/upload/memberUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10;		
		
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		MemberBean member=new MemberBean();
		String id = multi.getParameter("id");
		String pass = multi.getParameter("pass");	
		String img= multi.getFilesystemName("img");
		if(img==null) {
			img=multi.getParameter("oldimg");
		}
		
		MemberModifyProService memberUpdateProService = new MemberModifyProService();
		boolean isUpdateUser = memberUpdateProService.isUpdateMember(id, pass, member);
		
		if(!isUpdateUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 확인해주세요')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			member.setId(id);
			member.setPass(pass);
			member.setEmail(multi.getParameter("email"));
			member.setUsername(multi.getParameter("username"));
			member.setImg(img);
			member.setPhone(multi.getParameter("phone"));
			
			boolean isUpdateSuccess=memberUpdateProService.updateMember(member);
			
			if(!isUpdateSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Main.go"); 
			}
		}		

		
		return forward;
	}

}
