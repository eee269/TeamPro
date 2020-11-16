package product.vo;

public class ActionForward {
	private String path; // 포워딩 할 View 페이지 URL 저장
	private boolean redirect; // 포워딩 방식 저장
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	
	
}
