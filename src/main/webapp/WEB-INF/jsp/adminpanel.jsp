<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lista likalizacji początkowych</title>
</head>
<body>

	<div class="container">

	<div class="container">
		<h2>Panel administratora</h2>
		<h3>Połączenia</h3>
		<p>Tabela przedstawia atualne połączenia</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>id</th>
					<th>połączenie z:</th>
					<th>do:</th>
					<th>Cena dla osób od 1 do 3</th>
					<th>od 4 do 8</th>
					<th>od 9 do 16</th>
					<th>od 17 do 40</th>
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
						<td><a href="poloczenia/${poloczenie.id}/edit">Edytuj </a></td>
						<td><a href="poloczenia/${poloczenie.id}/delete">Usuń</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="poloczenia/add">Dodaj nowe połączenie</a>
	</div>


	<div class="container">
		<h3>Rezerwacje</h3>
		<p>Nadchodzące rezerwacje</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Z:</th>
					<th>do:</th>
					<th>ilość pasażerów</th>
					<th>Cena</th>
					<th>Data</th>
					<th>Godzina</th>
					<th>Imię i nazwisko</th>
					<th>Telefon</th>
					<th>email</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reservation" items="${reservations}"
					varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${reservation.startLocationR}</td>
						<td>${reservation.destinationR}</td>
						<td>${reservation.numberOfPeple}</td>
						<td>${reservation.price}</td>
						<td>${reservation.dateReservation}</td>
						<td>${reservation.timeReservation}</td>
						<td>${reservation.firstName}${reservation.lastName}</td>
						<td>${reservation.phone}</td>
						<td>${reservation.email}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="container">
		<h3>Lokalizacje poczatkowe</h3>
		<p>Ten element zostanie prawdopodobnie przeniesiony do formularza
			dodawania nowego poloczenia</p>
		<div class="row">
			<div class="col-sm-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>nazwa</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lolalizacja" items="${startlocations}"
							varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${lolalizacja.name}</td>
								<td><a href="delete-${lolalizacja.id}">Usuń</a><br />
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-6">
				Dodaj nową lokalizację początkową
				<form:form modelAttribute="startlocation" method="post">
		Nazwa: <form:input path="name" id="name"></form:input>
					<input type="submit" value="Dodaj" />
				</form:form>
			</div>
		</div>
	</div>
</div>
	
	
	
</body>
</html>