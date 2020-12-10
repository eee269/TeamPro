package vo;

import java.sql.Timestamp;

public class ProdQnaBean extends MemberBean{
	private int qna_num; // qna 글 번호
	private String qna_pass; // qna 글 마다 개별 비밀번호
	private String qna_subject; 
	private String qna_content; 
	private int qna_readcount;
	private String qna_file;
	private int qna_re_ref; // qna 답글
	private int qna_re_lev;
	private Timestamp qna_date;
	private String product_basicCode;
	private String member_id; 
	private int qna_re_seq;
	
	public ProdQnaBean() {}

	
	public ProdQnaBean(int qna_num, String qna_pass, String qna_subject, String qna_content, int qna_readcount,
			String qna_file, int qna_re_ref, int qna_re_lev, Timestamp qna_date, String product_basicCode,
			String member_id, int qna_re_seq) {
		super();
		this.qna_num = qna_num;
		this.qna_pass = qna_pass;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_readcount = qna_readcount;
		this.qna_file = qna_file;
		this.qna_re_ref = qna_re_ref;
		this.qna_re_lev = qna_re_lev;
		this.qna_date = qna_date;
		this.product_basicCode = product_basicCode;
		this.member_id = member_id;
		this.qna_re_seq = qna_re_seq;
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

	public int getQna_readcount() {
		return qna_readcount;
	}

	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
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

	public Timestamp getQna_date() {
		return qna_date;
	}

	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}

	public String getProduct_basicCode() {
		return product_basicCode;
	}

	public void setProduct_basicCode(String product_basicCode) {
		this.product_basicCode = product_basicCode;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public int getQna_re_seq() {
		return qna_re_seq;
	}


	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}


	@Override
	public String toString() {
		return "ProdQnaBean [qna_num=" + qna_num + ", qna_pass=" + qna_pass + ", qna_subject=" + qna_subject
				+ ", qna_content=" + qna_content + ", qna_readcount=" + qna_readcount + ", qna_file=" + qna_file
				+ ", qna_re_ref=" + qna_re_ref + ", qna_re_lev=" + qna_re_lev + ", qna_date=" + qna_date
				+ ", product_basicCode=" + product_basicCode + ", member_id=" + member_id +", qna_re_seq="+qna_re_seq +"]";
	}
	
}	
