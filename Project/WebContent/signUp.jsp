<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">
	function validate() {
		if (document.myForm.userName.value == "") {
			alert("please provide UserName");
			document.myForm.userName.focus();
			return false;
		}
		if (document.myForm.password.value == "") {
			alert("please provide Password");
			document.myForm.password.focus();
			return false;
		}
		return (true);
	}

	function WriteCookie() {
		var Cookievalue = escape(document.myForm.userName.value) + ";";
		document.cookie = "name=" + Cookievalue;
		//document.write("seetting cookies:"+"name="+Cookievalue);

	}
</script>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Login Page</h1>
	<img src="images/login.jpg" align="right" width="400px" height="400px">
	<s:form action="signUp" method="post" name="myForm"
		onsubmit="return(validate());" cssClass="abc">
		<table bgcolor="pink" align="center">
			<tr>
				<td><s:textfield name="userName" label="UserName" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><s:password name="password" label="Password" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><s:submit value="Login" onclick="WriteCookie();"
						cssClass="ab" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>