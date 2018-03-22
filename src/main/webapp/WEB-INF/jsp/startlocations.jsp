<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lista likalizacji początkowych</title>
</head>
<body>




	<a href="dodaj">Dodaj lokalizację początkowa</a>
	<br />
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>lokalizacja</th>
			</tr>
		</thead>
		<tbody>
		


		<c:forEach var="lolalizacja" items="${startlocations}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td><a href = "kot-${lolalizacja.id}"  >${lolalizacja.name}</a></td>
				
			</tr>
		</c:forEach>
		
		
		</tbody>
	</table>
	<br />
	<hr />
	
</body>
</html>