package vo;

import java.sql.Timestamp;

public class Cart {

	private int num;
	private int cnt;
	private String product_name;
	private int price;
	private String color;
	private String size;
	private String member_id;
	private String product_basicCode;
	private String opt_productCode;
	
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_basicCode() {
		return product_basicCode;
	}

	public void setProduct_basicCode(String product_basicCode) {
		this.product_basicCode = product_basicCode;
	}

	public String getOpt_productCode() {
		return opt_productCode;
	}

	public void setOpt_productCode(String opt_productCode) {
		this.opt_productCode = opt_productCode;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	

}
