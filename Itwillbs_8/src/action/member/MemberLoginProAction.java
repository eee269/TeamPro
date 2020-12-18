package action.member;

import java.io.PrintWriter;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import exception.member.LoginException;
import svc.member.MemberLoginProService;
import vo.ActionForward;

import com.github.scribejava.core.model.OAuth2AccessToken;


public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		MemberLoginProService memberLoginProService = new MemberLoginProService();
		
		try {
			boolean isMember = memberLoginProService.isLoginMember(id, pass);
			
			if(isMember) {
				HttpSession session = request.getSession();
				session.setAttribute("member_id", id);
								
				forward = new ActionForward();
				forward.setPath("Main.go"); 
			}
			

			
			/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
			public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
			/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
			String sessionState = getSession(session);
			if(StringUtils.pathEquals(sessionState, state)){
			OAuth20Service oauthService = new ServiceBuilder()
			.apiKey(CLIENT_ID)
			.apiSecret(CLIENT_SECRET)
			.callback(REDIRECT_URI)
			.state(state)
			.build(NaverLoginApi.instance());
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
			}
			return null;
			}
		} catch (LoginException e) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + e.getMessage() + "')"); // 실패 메세지 출력
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}