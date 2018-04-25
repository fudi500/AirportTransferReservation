<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dziękujemu za dokonanie rezerwacji</title>

<!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<!-- Begin page content -->
	<main role="main" class="container">
	<h2 class="mt-5">Szczegóły rezerwacji</h2>

	<br />
	
	<div class="col-5">

		<table class="table">
			<tbody>
				<tr>
					<th scope="row">z</th>
					<td>${reservation.startLocationR}</td>

				</tr>
				<tr>
					<th scope="row">do</th>
					<td>${reservation.destinationR}</td>
				</tr>
				<tr>
					<th scope="row">ilość pasażrów</th>
					<td>${reservation.numberOfPeple}</td>
				</tr>
				<tr>
					<th scope="row">Data</th>
					<td>${reservation.dateReservation}</td>
				</tr>
				<tr>
					<th scope="row">godzina</th>
					<td>${reservation.timeReservation}</td>
				</tr>
				<tr>
					<th scope="row">imie i nazwisko</th>
					<td>${reservation.firstName}  ${reservation.lastName}</td>
				</tr>
					<tr>
					<th scope="row">telefon kontaktowy pasażera</th>
					<td>${reservation.phone}</td>
				</tr>
				<tr>
					<th scope="row">email</th>
					<td>${reservation.email}</td>
				</tr>
				

			</tbody>
		</table>

	</div>
	</main>



</body>
</html>



