package vo;

import java.sql.Timestamp;

public class DetailOrderBean {
	private int num;
	private String name;
	private String main_img;
	private int price;
	private int cnt;
	private Timestamp date;
	private String color;
	private String size;
	private String mainorder_code;
	private String opt_productCode;
//	private int ref;
	private int seq;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
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
	public String getMainorder_code() {
		return mainorder_code;
	}
	public void setMainorder_code(String mainorder_code) {
		this.mainorder_code = mainorder_code;
	}
	public String getOpt_productCode() {
		return opt_productCode;
	}
	public void setOpt_productCode(String opt_productCode) {
		this.opt_productCode = opt_productCode;
	}
//	public int getRef() {
//		return ref;
//	}
	public int getSeq() {
		return seq;
	}
//	public void setRef(int ref) {
//		this.ref = ref;
//	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	

}
