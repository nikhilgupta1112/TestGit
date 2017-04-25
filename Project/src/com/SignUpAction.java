package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import inter.DbConnection;


public class SignUpAction extends ActionSupport {
	private static String userName;
	private String password;
	
	public String execute() throws SQLException{
		Connection con=DbConnection.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
		ps.setString(1, getUserName());
		ps.setString(2, getPassword());
		ResultSet r=ps.executeQuery();
		if(r.next()){
			return SUCCESS;
		}
		else{
			return "error";
		}
	}

	public static String getUserName() {
		return userName;
	}

	public  void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public SignUpAction(){
	}


}
