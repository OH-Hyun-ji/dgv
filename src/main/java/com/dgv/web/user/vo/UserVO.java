package com.dgv.web.user.vo;



public class UserVO {
	private int user_num; // 회원고유번호
	private String user_id; // 회원아이디
	private String user_pw; // 회원비밀번호
	private String user_name; // 회원이름
	private String user_phone; // 회원전화번호
	private String user_email; // 회원이메일
	private String user_birth; // 회원 생년월일
	private String user_term; // 약관동의여부
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_term() {
		return user_term;
	}
	public void setUser_term(String user_term) {
		this.user_term = user_term;
	}
	@Override
	public String toString() {
		return "UserVO [user_num=" + user_num + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_birth=" + user_birth
				+ ", user_term=" + user_term + "]";
	}
	
	
	
	
	
}
