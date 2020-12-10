package vo;

public class AddrBean {
	private int num;
	private String location;
	private String postcode;
	private String address;
	private String member_id;
	private String type;
	
	public int getNum() {
		return num;
	}
	public String getLocation() {
		return location;
	}
	public String getPostcode() {
		return postcode;
	}
	public String getAddress() {
		return address;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
