<%@page import="com.SignUpAction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="inter.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">
	function ReadCookie() {
		var allcookies = document.cookie;
		//document.write("All cookies:"+allcookies);
		cookiearray = allcookies.split(";");
		for (var i = 0; i < cookiearray.length; i++) {
			name = cookiearray[i].split("=")[0];
			value = cookiearray[i].split("=")[1];
			//document.write("key is:"+name+" and value is: "+value);
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<style type="text/css">
p {
	color: red;
	font-size: 30px;
	font-weight: bold;
	font-family: cursive;
}

.ab {
	color: red;
	font-size: 30px;
	font-weight: bold;
	font-family: cursive;
	margin-top: 50px;
	border-style: solid;
}

.abc {
	color: blue;
	font-size: 30px;
	font-weight: bold;
	font-family: cursive;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		Welcome!
		<s:property value="userName" />
	</h1>
	<s:form action="blogs" name="myForm" method="post" cssClass="abc">
		<s:textfield name="blog" label="Write your blog here" cssClass="ab" />
		<s:submit value="Post" align="right" onclick="ReadCookie()"
			cssClass="ab" />
	</s:form>

	<s:form action="upload" name="myForm" method="post" cssClass="abc"
		enctype="multipart/form-data">
		<s:file name="userImage" label="File" />
		<s:submit value="upload" align="center" />
	</s:form>

	<%
		Connection con = DbConnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select (value) from post");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			out.print("<html><body><p>"+""+rs.getString("value") + "</p></body></html>");
	%>

	<%-- <s:form action="comments" method="post" cssClass="abc">
		<s:textfield name="comment" label="Comment" cssClass="ab" />
		<s:submit value="comment" cssClass="ab" />
	</s:form>
 --%>
	<br />
	<%
		}
	%>
</body>
</html>