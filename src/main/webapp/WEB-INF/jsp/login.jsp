<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- <style>
.mycolor{color: red;}
</style> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#mybtn").click(function(){
		alert("hi");
		$("#unerr").text("");
		$("#pwderr").text("");
		var username=$("#unameId").value();
		var password=$("#pwdId").value();
		var flag=false;
		if(username==""){
			$("#unerr").text("Please enter the username");
			flag true;

			}
		if(password==""){
			$("#pwderr").text("Please enter the password");
			flag true;
			}
		if(flag=true){
			return false;
			}
		$("form").submit();
		});
});

</script>
<body>
<h2 align="center">Login Page</h2>
<h3>${MSG}</h3>
<form:form action="loginformdata" method="post" commandName="mylogin" name="myform">
<table>
<tr>
<td><label>USERNAME:</label></td>
<td><form:input path="username" id="unameId"/></td>	<td><form:errors path="username" cssClass="mycolor"/></td>
<td><label id="unerr" style="color: red"></label></td>
</tr>
<tr>
<td><label>PASSWORD:</label></td>
<td><form:password path="password" id="pwdId"/></td><td><form:errors path="password" cssClass="mycolor"/></td>
<td><label id="pwderr" style="color: red"></label></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" id="mybtn" value="LOGIN"></td>
</tr>
</table>
</form:form>
<a href="<c:url value="newuser"/>">SIGNUP</a>

</body>
</html>