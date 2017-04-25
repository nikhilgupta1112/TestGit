package com;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import inter.DbConnection;

public class UploadAction extends ActionSupport {
	
	private File userImage;
	private String userImageContentType;
	private String userImageFileName;
	public String execute(){
		String filePath=ServletActionContext.getServletContext().getRealPath("/").concat("userimages");
		System.out.println("Image location:"+filePath);
		File fileToCreate=new File(filePath,userImageFileName);
		try {
			FileUtils.copyFile(userImage,fileToCreate);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection con=DbConnection.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("insert into image(picture) values(?)");
			ps.setString(1, getUserImageFileName());
			int a=ps.executeUpdate();
			if(a>0){
				System.out.println("image inserted successfully");

			}
			else{
				System.out.println("error");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SUCCESS;
	}
	public File getUserImage() {
		return userImage;
	}
	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}
	public String getUserImageContentType() {
		return userImageContentType;
	}
	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}
	public String getUserImageFileName() {
		return userImageFileName;
	}
	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}
	 	

}
