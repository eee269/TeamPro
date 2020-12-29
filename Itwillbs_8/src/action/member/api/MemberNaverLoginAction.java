package action.member.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import action.Action;
import svc.member.MemberApiLoginService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberNaverLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String img = request.getParameter("img");
		// 네이버 로그인 하는 사람의 비밀번호는 이렇게 통일할게요!
		String pass = "Naver1234!";
		
		if(img.equals("undefined")) {
			img = null;
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		MemberApiLoginService service = new MemberApiLoginService();
		boolean isMember = service.isMember(id);
		
		if(isMember) {
			session.setAttribute("member_id", id);	
		} else {
			MemberBean member = new MemberBean();
			member.setId(id);
			member.setPass(pass);
			member.setImg(img);
			member.setEmail(email);
			member.setUsername(username);
			
			boolean isSuccess = service.insertMember(member);
			if(isSuccess) {
				session.setAttribute("member_id", id);
				
				out.println("<script>");
				out.println("alert('비밀번호를 설정해주세요')");
				out.println("</script>");
				
				forward.setPath("MemberPassForm.mo");
			} else {
				out.println("<script>");
				out.println("alert('로그인할 수 없습니다. 관리자에게 문의하세요.')");
				out.println("</script>");
				
				forward.setPath("Main.go");
			}
		}
	
		forward.setRedirect(true);
		return forward;
	}

}
