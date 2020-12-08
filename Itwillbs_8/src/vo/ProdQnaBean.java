package vo;

import java.sql.Timestamp;

public class ProdQnaBean {
	private int num; // qna 글 번호
	private String pass; // qna 글 마다 개별 비밀번호
	private String subject; 
	private String content; 
	private String file;
	private int re_ref; // qna 답글
	private int re_lev;
	private String member_id; 
	private String product_basicCode;
	private Timestamp date;
	
	
	public ProdQnaBean(int num, String pass, String subject, String content, String file, int re_ref, int re_lev,
			String member_id, String product_basicCode, Timestamp date) {
		super();
		this.num = num;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
		this.file = file;
		this.re_ref = re_ref;
		this.re_lev = re_lev;
		this.member_id = member_id;
		this.product_basicCode = product_basicCode;
		this.date = date;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProduct_basicCode() {
		return product_basicCode;
	}
	public void setProduct_basicCode(String product_basicCode) {
		this.product_basicCode = product_basicCode;
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

	@Override
	public String toString() {
		return "ProdQnaBean [num=" + num + ", pass=" + pass + ", subject=" + subject + ", content=" + content
				+ ", file=" + file + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", member_id=" + member_id
				+ ", product_basicCode=" + product_basicCode + ", date=" + date + "]";
	}
	
	
}
