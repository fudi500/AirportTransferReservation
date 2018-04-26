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

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<link href="https://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">



<!--  jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />


<script type="text/javascript">
	function populate(form) {
		var listOfObjects = [];
		<c:forEach items="${DLlist}" var="item">
		var singleObj = {}
		singleObj['localizationID'] = "${item.localizationID}"
		singleObj['destinationID'] = "${item.destinationID}";
		singleObj['destinationName'] = "${item.destinationName}";
		listOfObjects.push(singleObj);
		</c:forEach>

		form.select2.innerHTML = "";

		for (var i = 0; i < listOfObjects.length; i++) {
			if (form.select1.value == listOfObjects[i].localizationID) {
				var newOption = document.createElement("option");
				newOption.value = listOfObjects[i].destinationID;
				newOption.innerHTML = listOfObjects[i].destinationName;
				form.select2.options.add(newOption);
			}
		}
	}
</script>

<script>
	$(document).ready(
			function() {
				var date_input = $('input[name="dateReservation"]'); //our date input has the name "date"
				var container = $('.bootstrap-iso form').length > 0 ? $(
						'.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
					format : 'dd/mm/yyyy',
					container : container,
					todayHighlight : true,
					autoclose : true,
				})
			})
</script>


</head>
<body>




	<!-- 	<div align="right">
			<h5>
				<a href="admin">Panel administratora</a>
			</h5>
		</div>
 -->
<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4"
				src="http://www.aeropuertodemalaga-costadelsol.com/images/transfers.gif"
				alt="" width="250" height="80">
			<h2>Rezerwacja transferu lotniskowego</h2>
			<p class="lead">Strona umożliwia rezerwację transferu
				lotniskowego n.p. między lotniskami, z lotniska do kilku miast.
				Sprawdz dostępne opcje i ciesz się profesjonalną usługą przewozu.</p>
		</div>

		 <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Płatność</span>
            
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Transfer</h6>
                <small class="text-muted"></small>
              </div>
              <span class="text-muted"></span>
            </li>
            
      
            <li class="list-group-item d-flex justify-content-between">
              <span>Suma (PLN)</span>
			  <small class="text-muted">cena brutto</small>
              <strong>300.00 zł</strong>
            </li>
          </ul>

       
        </div>

			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Dane zamówienia</h4>

				<form:form name="startlocationform" modelAttribute="reservationForm"
					method="post" class="form-horizontal">
	<div class="control-group" class="mb-3">
						<label class="control-label">Wyjazd z</label>
						<div class="controls">
							<form:select id="select1" name="select1" path="startLocationR"
								onchange="populate(this.form)" class="form-control">
								<form:option value="NONE" label="--- Select ---" />
								<form:options items="${localizationList}" />
							</form:select>
							<form:errors path="startLocationR" />
						</div>
					</div>
					<div class="control-group" class="mb-3">
						<label class="control-label">Przyjazd do</label>
						<div class="controls">
							<form:select id="select2" name="select2" path="destinationR"
								class="form-control">

							</form:select>
							<c:if test="${pageContext.request.method=='POST'}">
								<form:errors path="destinationR" />
							</c:if>
						</div>
					</div>
					
					<hr class="mb-4">

					<div class="row">
						<div class="col-md-6 mb-3">
							<div class="control-group">

								<label class="control-label">Data przejazdu</label>
								<div class="controls">

									<form:input class="form-control" path="dateReservation"
										id="dateReservation" name="dateAndTimeOfService"
										placeholder="DD/MM/YYY" type="text"></form:input>
									<c:if test="${pageContext.request.method=='POST'}">
										<p class="help-block">
											<form:errors path="dateReservation" />
										</p>
									</c:if>

								</div>
							</div>
						</div>

						<div class="col-md-6 mb-3">
							<div class="control-group">

								<label class="control-label">Godzina</label>
								<div class="controls">
									<form:input class="form-control" path="timeReservation"
										id="timeReservation" placeholder="HH:mm"></form:input>
									<c:if test="${pageContext.request.method=='POST'}">
										<p class="help-block">
											<form:errors path="timeReservation" />
										</p>
									</c:if>
								</div>
							</div>
						</div>
					</div>

					<div class="control-group" class="mb-3">
						<label class="control-label">Ilość pasażerów</label>
						<div class="controls">
							<form:input class="form-control" path="numberOfPeple"
								id="numberOfPeple"></form:input>
							<c:if test="${pageContext.request.method=='POST'}">
								<p class="help-block">
									<form:errors path="numberOfPeple" />
								</p>
							</c:if>
						</div>
					</div>

				 <hr class="mb-4">
					<div class="row">
						<div class="col-md-6 mb-3">
							<div class="control-group">
								<label class="control-label">Imię</label>
								<div class="controls">
									<form:input class="form-control" path="firstName"
										id="firstName"></form:input>
									<c:if test="${pageContext.request.method=='POST'}">
										<p class="help-block">
											<form:errors path="firstName" />
										</p>
									</c:if>
								</div>
							</div>
						</div>

						<div class="col-md-6 mb-3">
							<div class="control-group">
								<label class="control-label">Nazwisko</label>
								<div class="controls">
									<form:input class="form-control" path="lastName" id="lastName"></form:input>
									<c:if test="${pageContext.request.method=='POST'}">
										<p class="help-block">
											<form:errors path="lastName" />
										</p>
									</c:if>
								</div>
							</div>
						</div>
					</div>

					<div class="control-group" class="mb-3">
						<label class="control-label">Telefon kontaktowy pasażera</label>
						<div class="controls">
							<form:input class="form-control" path="phone" id="phone"></form:input>
							<c:if test="${pageContext.request.method=='POST'}">
								<p class="help-block">
									<form:errors path="phone" />
								</p>
							</c:if>
						</div>
					</div>

					<div class="control-group" class="mb-3">
						<label class="control-label">Email</label>
						<div class="controls">
							<form:input class="form-control" path="email" id="email"></form:input>
							<c:if test="${pageContext.request.method=='POST'}">
								<p class="help-block">
									<form:errors path="email" />
								</p>
							</c:if>
						</div>
					</div>

					<br />
					<input type="submit" value="Dodaj" class="btn btn-primary btn-lg btn-block" />
				</form:form>

				<hr class="mb-4">
				<!--             <button class="btn btn-primary btn-lg btn-block" type="submit">Rezerwuj transfer</button>
 -->
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2017-2018 Airport Transfer Reservation</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Regulamin</a></li>
			<li class="list-inline-item"><a href="#">Kontakt</a></li>
		</ul>
		</footer>
	</div>














</body>
</html>
