<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Uploaded File</h2>
	UserImage:
	<s:property value="userImage" />
	<br /> ContentType:
	<s:property value="userImageContentType" />
	<br /> FileName:
	<s:property value="userImageFileName" />
	<br /> UploadImage:
	<img src="userimages/<s:property value="userImageFileName"/>"
		width="500" height="500" />

</body>
</html>