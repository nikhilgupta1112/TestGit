package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import inter.DbConnection;

public class LoginAction extends ActionSupport {

	private String name;
	private String userName;
	private String password;
	private String gender;
	private String emailId;

	public void validate(){
		Connection con=DbConnection.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from user where username=?");
			ps.setString(1, getUserName());
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				addFieldError("userName", "UserName is already taken");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(password.length()<6){
			addFieldError("password", "Password cannot be smaller than 5");
		}
	}

	public String execute(){
		Connection con=DbConnection.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?)");
			ps.setString(1, getName());
			ps.setString(2, getUserName());
			ps.setString(3, getPassword());
			ps.setString(4, getGender());
			ps.setString(5, getEmailId());
			int a = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}



}
