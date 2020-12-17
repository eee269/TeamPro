package action.member;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import action.Action;
import vo.ActionForward;

public class MemberNaverLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse res) throws Exception {
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		String token = (String) session.getAttribute("access_token");
		
		String header = "Bearer " + token;
		
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			
			if(responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response= new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
			
			JSONParser parser = new JSONParser();
			
			JSONObject result = (JSONObject) parser.parse(response.toString());
			
			((JSONObject)result.get("response")).get("email");
			
			String email = (String) ((JSONObject) result.get("response")).get("email");
			String name = (String) ((JSONObject) result.get("response")).get("name");
			String id = (String) ((JSONObject) result.get("response")).get("id");
			
			System.out.println("name: " + name);
			System.out.println("id: " + id);
			System.out.println("email: " + email);
			
			session.setAttribute("member_id", id);
			
			System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return forward;
	}

}
