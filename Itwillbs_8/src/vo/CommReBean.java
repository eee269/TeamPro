package vo;

import java.sql.Timestamp;

public class CommReBean {
	private int num;
	private String contents;
	private String username;
	private Timestamp date;
	private int re_ref;
	private int re_lev;
	private int community_num;
	private String img;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getCommunity_num() {
		return community_num;
	}
	public void setCommunity_num(int community_num) {
		this.community_num = community_num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
