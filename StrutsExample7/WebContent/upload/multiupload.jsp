<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Struts 2 file upload example</h1>
<s:form method="post" enctype="multipart/form-data" action="multiUploadFile">
<s:file label="File one" name="uploads" />
<s:file label="File two" name="uploads" />
<s:file label="File three" name="uploads" />
<s:submit />
</s:form>
</body>
</html>