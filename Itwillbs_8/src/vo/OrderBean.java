package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderBean {
	private String code;
	private String name;
	private String phone;
	private String address;
	private Timestamp date;
	private String status;
	private String payment;
	private String member_id;
	private int total_price;
	
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getCode() {
		return code;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddress() {
		return address;
	}
	public Timestamp getDate() {
		return date;
	}
	public String getStatus() {
		return status;
	}
	public String getPayment() {
		return payment;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	

}
