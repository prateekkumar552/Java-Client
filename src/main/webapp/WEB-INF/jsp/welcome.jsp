<%@ page isELIgnored="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<form:form action="showall" method="post" commandName="STU">
<h2>${MSG}</h2>

 <h3>Student List</h3>
<input type="submit" value="show student">
<c:if test="${!empty AL}">
	<table class="tg">
	<tr>
		<th width="80">Roll No</th>
		<th width="120">Student Name</th>
		<th width="120">Student City</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${AL}" var="student">
		<tr>
			<td>${student.rollno}</td>
			<td>${student.name}</td>
			<td>${student.city}</td>
			<td><a href="<c:url value='/edit/${student.rollno}' />" >Edit</a></td>
			<td><a href="<c:url value='/delete/${student.rollno}'/>" >Delete</a></td>
			
		</tr>
	</c:forEach>
	</table>
</c:if>
</form:form>
<%-- <h1 align="center">Student Information</h1>
 <ul><c:forEach var="cou" items="${AL}">
<li><h2>${cou}</h2>
</c:forEach></ul>
<h1>${MSG}</h1>
<form:form action="showall" method="post" commandName="STU">
<input type="submit" value="show users">
<ol><c:forEach var="cou" items="${AL}">
<li><h3>${cou}</h3><form:form action="delete" method="post" commandName="STUD">
<input type="submit" value="delete">
</form:form>
<form:form action="update" method="post" commandName="STUDENT">
<input type="submit" value="edit">
</form:form>
</c:forEach></ol>
</form:form>
<br>

<a href="<c:url value="newuser"/>">ADD NEW USER</a><br>
<a href="<c:url value="gologout"/>">LOGOUT</a> --%>
</body>
</html>