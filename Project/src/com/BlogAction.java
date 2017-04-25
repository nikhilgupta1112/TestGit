package com;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import com.opensymphony.xwork2.ActionSupport;

import inter.DbConnection;

public class BlogAction extends ActionSupport {
	private String blog;
	public String getBlog() {
		return blog;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}
	
	public String execute() throws SQLException{
		Connection con=DbConnection.getConnection();
		//SignUpAction sa=new SignUpAction();
		PreparedStatement ps=con.prepareStatement("insert into post(name,value)values(?,?)");
		String name=SignUpAction.getUserName();
		ps.setString(1, name);
		ps.setString(2, getBlog());
		int a=ps.executeUpdate();
		if(a>0){
			System.out.println("data inserted successfully");
		} 

		return SUCCESS;
	}
	
}
