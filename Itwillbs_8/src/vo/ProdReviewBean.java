package vo;

import java.sql.Timestamp;

// 상품 리뷰 정보 저장
public class ProdReviewBean {
	private int num;
	private String content;
	private int starScore;
	private int re_ref;
	private int re_lev;
	private String product_basicCode;
	private String member_id;
	private Timestamp date;
	private String product_img;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStarScore() {
		return starScore;
	}
	public void setStarScore(int starScore) {
		this.starScore = starScore;
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
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_Img) {
		this.product_img = product_Img;
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
	
}
