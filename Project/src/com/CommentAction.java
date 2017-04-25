package com;

import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {
private String comment;

public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

public String execute(){
return SUCCESS;	
}
}
