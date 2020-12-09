package vo;

import java.sql.Timestamp;

public class ProdQnaBean extends MemberBean{
	private int qna_num; // qna 글 번호
	private String qna_pass; // qna 글 마다 개별 비밀번호
	private String qna_subject; 
	private String qna_content; 
	private String qna_file;
	private int qna_re_ref; // qna 답글
	private int qna_re_lev;
	private String qna_member_id; 
	private String qna_product_basicCode;
	private Timestamp qna_date;
	
	public ProdQnaBean() {}

	public ProdQnaBean(int qna_num, String qna_pass, String qna_subject, String qna_content, String qna_file,
			int qna_re_ref, int qna_re_lev, String qna_member_id, String qna_product_basicCode, Timestamp qna_date) {
		super();
		this.qna_num = qna_num;
		this.qna_pass = qna_pass;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_re_ref = qna_re_ref;
		this.qna_re_lev = qna_re_lev;
		this.qna_member_id = qna_member_id;
		this.qna_product_basicCode = qna_product_basicCode;
		this.qna_date = qna_date;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_pass() {
		return qna_pass;
	}

	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_file() {
		return qna_file;
	}

	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}

	public int getQna_re_ref() {
		return qna_re_ref;
	}

	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}

	public int getQna_re_lev() {
		return qna_re_lev;
	}

	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}

	public String getQna_member_id() {
		return qna_member_id;
	}

	public void setQna_member_id(String qna_member_id) {
		this.qna_member_id = qna_member_id;
	}

	public String getQna_product_basicCode() {
		return qna_product_basicCode;
	}

	public void setQna_product_basicCode(String qna_product_basicCode) {
		this.qna_product_basicCode = qna_product_basicCode;
	}

	public Timestamp getQna_date() {
		return qna_date;
	}

	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}

	@Override
	public String toString() {
		return "ProdQnaBean [qna_num=" + qna_num + ", qna_pass=" + qna_pass + ", qna_subject=" + qna_subject
				+ ", qna_content=" + qna_content + ", qna_file=" + qna_file + ", qna_re_ref=" + qna_re_ref
				+ ", qna_re_lev=" + qna_re_lev + ", qna_member_id=" + qna_member_id + ", qna_product_basicCode="
				+ qna_product_basicCode + ", qna_date=" + qna_date + "]";
	}
	
}
