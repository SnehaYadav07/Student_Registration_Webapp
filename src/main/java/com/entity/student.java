package com.entity;

public class student {

	private int id;
	private String name;
	private String email;
	private String age;
	private int userid;
	
	public student(String name, String email, String age, int userid) {
		super();
		this.name = name;
		this.email = email;
		this.age = age;
		this.userid = userid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public student() {
		super();
	}
	
	
}
