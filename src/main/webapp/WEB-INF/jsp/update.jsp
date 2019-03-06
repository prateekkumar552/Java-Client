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
<body>
<%-- <c:url var="addAction" value="/submituser"></c:url>
<form:form action="${addAction}" commandName="student">
<table>
	<c:if test="${!empty student.name}">
	<tr>
		<td>
			<form:label path="rollno">
				<spring:message text="ROLLNO"/>
			</form:label>
		</td>
		<td>
			<form:input path="rollno" readonly="true" size="8"  disabled="true" />
			<form:hidden path="rollno" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="city">
				<spring:message text="City"/>
			</form:label>
		</td>
		<td>
			<form:input path="city" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty student.name}">
				<input type="submit"
					value="<spring:message text="Edit Student"/>" />
			</c:if>
			<c:if test="${empty student.name}">
				<input type="submit"
					value="<spring:message text="Add Student"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Student List</h3>
<c:if test="${!empty AL}">
	<table class="tg">
	<tr>
		<th width="80">Student Rollno</th>
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
			<td><a href="<c:url value='/delete/${student.rollno}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if> --%>

<h1>Edit Student</h1>  
       <form:form method="POST" action="/MyClientDemo/editsave" commandName="Student">    
        <table >    
        <tr>  
        <td>RollNo : </td>    
         <td><form:input  path="${student.rollno}" /></td>  
         </tr>   
         <tr>    
          <td>Name : </td>   
          <td><form:input path="${student.name}"  /></td>  
         </tr>    
         <tr>    
          <td>City :</td>    
          <td><form:input path="${student.city}" /></td>  
         </tr>   
          
           
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Edit Save" /></td>    
         </tr>    
        </table>    
       </form:form>    
</body>
</html>