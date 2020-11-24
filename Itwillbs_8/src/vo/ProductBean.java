package vo;

import java.util.Date;

public class ProductBean {
	//상품정보 저장 객체용 bean
	private String basicCode;//기본코드
	private String name;// 상품 이름
	private String xcode;//대분류
	private String ncode;//소분류
//	private String type;//상품 구분용
	private String main_img;//메인이미지
	private String sub_img;//상품설명이미지
	private int stock;//상품재고량
	private int price;//상품가격
	private int likey;//상품 좋아요수 
	private Date date;//상품 넣을날짜
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getBasicCode() {
		return basicCode;
	}
	public void setBasicCode(String basicCode) {
		this.basicCode = basicCode;
	}
	public String getXcode() {
		return xcode;
	}
	public void setXcode(String xcode) {
		this.xcode = xcode;
	}
	public String getNcode() {
		return ncode;
	}
	public void setNcode(String ncode) {
		this.ncode = ncode;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub_img() {
		return sub_img;
	}
	public void setSub_img(String sub_img) {
		this.sub_img = sub_img;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getLikey() {
		return likey;
	}
	public void setLikey(int likey) {
		this.likey = likey;
	}
//	public String getType() {
//		return type;
//	}
//	public void setType(String type) {
//		this.type = type;
//	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
