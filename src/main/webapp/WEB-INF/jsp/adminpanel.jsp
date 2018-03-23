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
	
	<br />
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>id</th>
				<th>połączenie z:</th>
				<th>do:</th>
				<th>Cena dla osób od 1 do 3</th>
				<th>od 4 do 8</th>
				<th>od 9 do 16</th>
				<th>od 17 do 50</th>
			</tr>
		</thead>
		<tbody>



			<c:forEach var="poloczenie" items="${destinations}"
				varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${poloczenie.id}</td>
					<td>${poloczenie.localizationName}<br />
					<td>${poloczenie.destinationName}</td>
					<td>${poloczenie.price1to3}</td>
					<td>${poloczenie.price4to8}</td>
					<td>${poloczenie.price9to16}</td>
					<td>${poloczenie.price17to40}</td>

				</tr>
			</c:forEach>


		</tbody>
	</table>
	<br />
	<a href="dodajp">Dodaj połączenie</a>
	//link dodaje na sztywno połączenie Balice -> Krakow, z pominieciem formularza
	 
	<hr />
</body>
</html>