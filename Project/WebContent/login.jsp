<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">
	function validate() {

		if (document.myForm.Name.value == "") {
			alert("Please provide your name");
			document.myForm.Name.focus();
			return false;
		}

		if (document.myForm.userName.value == "") {
			alert("please provide your username");
			document.myForm.userName.focus();
			return false;
		}
		if (document.myForm.password.value == "") {
			alert("please provide your password");
			document.myForm.password.focus();
			return false;
		}
		if (document.myForm.emailId.value == "") {
			alert("please provide your emailId");
			document.myForm.emailId.focus();
			return false;
		}
		if (document.myForm.gender.value == "-1") {
			alert("please provide your gender");
			document.myForm.gender.focus();
			return false;
		}

		return (true);

	}

	function emailvalidate() {
		var emailId = document.myForm.emailId.value;
		var atpos = emailId.indexOf("@");
		if (atpos < 1) {
			alert("please enter correct Email-Id");
			document.myForm.emailId.focus();
			return false;
		}
		return (true);
	}
</script>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Create an account</h1>
	<h2>password cannot be smaller than 5 words</h2>
	<img src="images/account.jpg" align="right" width="400px"
		height="400px">
	<s:form action="login" method="post" name="myForm"
		onsubmit="return(validate());" cssClass="abc">
		<table bgcolor="pink" align="center">
			<tr>
				<td><s:textfield name="Name" label="Name" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><s:textfield name="userName" label="UserName" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><s:password name="password" label="Password" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><s:select label="Gender" headerKey="-1" cssClass="ab"
						name="gender" headerValue="Select your gender"
						list="#{'1':'Male','2':'Female','3':'Other' }" /></td>
			</tr>
			<tr>
				<td><s:textfield name="emailId" label="Email-Id" cssClass="ab" /></td>
			</tr>
			<tr>
				<td><button type="button"
						onclick="document.getElementById('demo').innerHTML=emailvalidate()"
						class="ab">RegisterEmail</button></td>
			</tr>

			<tr>
				<td><s:submit align="right" cssClass="ab" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>
