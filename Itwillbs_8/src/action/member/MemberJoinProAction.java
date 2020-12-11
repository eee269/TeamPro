package action.member;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.member.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;

		
		ServletContext context = request.getServletContext();
		String saveFolder = "member/memberUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
//		MemberBean member=new MemberBean(
//				multi.getParameter("id"), 
//				multi.getParameter("pass"), 
//				multi.getParameter("email"), 
//				multi.getParameter("username"), 
//				multi.getParameter("img"),
//				new Timestamp(System.currentTimeMillis()), 
//				Integer.parseInt(multi.getParameter("phone"))
//				);
		
		MemberBean member=new MemberBean();
		member.setId(multi.getParameter("id"));
		member.setPass(multi.getParameter("pass"));
		member.setEmail(multi.getParameter("email"));
		member.setUsername(multi.getParameter("username"));
		member.setImg(multi.getOriginalFileName("img"));
		member.setDate(new Timestamp(System.currentTimeMillis()));
		member.setPhone((multi.getParameter("phone")));
		
		System.out.println("멤버조인프로엑션");
		MemberJoinProService memberJoinProService=new MemberJoinProService();		
		boolean isJoinSuccess=memberJoinProService.registMember(member);
		
		if(!isJoinSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("MemberJoincom.mo"); 
		}
		
		return forward;
	}

}
