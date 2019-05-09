package com.swt.dto;

import java.util.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private int bir_yy;
	private int bir_mm;
	private int bir_dd;
	private String phone;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date regdate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String pw, String name, int bir_yy, int bir_mm, int bir_dd, String phone, String email,
			String zipcode, String addr1, String addr2, Date regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.bir_yy = bir_yy;
		this.bir_mm = bir_mm;
		this.bir_dd = bir_dd;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBir_yy() {
		return bir_yy;
	}

	public void setBir_yy(int bir_yy) {
		this.bir_yy = bir_yy;
	}

	public int getBir_mm() {
		return bir_mm;
	}

	public void setBir_mm(int bir_mm) {
		this.bir_mm = bir_mm;
	}

	public int getBir_dd() {
		return bir_dd;
	}

	public void setBir_dd(int bir_dd) {
		this.bir_dd = bir_dd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", bir_yy=" + bir_yy + ", bir_mm=" + bir_mm
				+ ", bir_dd=" + bir_dd + ", phone=" + phone + ", email=" + email + ", zipcode=" + zipcode + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", regdate=" + regdate + "]";
	}
	
}
