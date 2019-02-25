<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">Enter Your Details</h2>
<form:form action="submituser" method="post" commandName="SIGNUPUSER">
<table>
<tr>
<td><label>NAME:</label></td>
<td><form:input path="name"/></td><td><form:errors path="name" cssClass="mycolor"/></td>
</tr>
<tr>
<td><label>CITY:</label></td>
<td><form:input path="city"/></td><td><form:errors path="username" cssClass="mycolor"/></td>
</tr>
<tr>
<td><label>USERNAME:</label></td>
<td><form:input path="username"/></td><td><form:errors path="username" cssClass="mycolor"/></td>
</tr>
<tr>
<td><label>PASSWORD:</label></td>
<td><form:password path="password"/></td><td><form:errors path="password" cssClass="mycolor"/></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="REGISTER" value="REGISTER"></td>
</tr>
</table>
</form:form>
<h1>${MSG}</h1>
</body>
<a href="<c:url value="gologin"/>">GOTOLOGIN</a>
</body>
</html>