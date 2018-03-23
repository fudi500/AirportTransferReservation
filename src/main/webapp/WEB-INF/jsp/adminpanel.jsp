<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lista likalizacji początkowych</title>
</head>
<body>




	
	<br />
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>lokalizacje początkowe</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		


		<c:forEach var="lolalizacja" items="${startlocations}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${lolalizacja.name}</td>
				<td><a href="delete-${lolalizacja.id}">Usuń</a><br />
				
			</tr>
		</c:forEach>
		
		
		</tbody>
	</table>
	<br />
	<hr />
	
	Dodaj nową lokalizację początkową
	<form:form modelAttribute="startlocation" method="post">
		Nazwa: <form:input path="name" id="name"></form:input>
		<input type="submit" value="Dodaj" />
	</form:form>
	
	
	<hr />
</body>
</html>