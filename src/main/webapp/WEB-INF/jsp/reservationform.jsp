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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

</head>
<body>

	<div class="container">


	<div align="right">
		<h5><a href="admin">Panel administratora</a></h5>
	</div>
	


	
	
	
	<form:form name="startlocationform" modelAttribute="reservationForm"
		method="post" class="form-horizontal">

		<legend>Zarezerwój transfer</legend>
		
		
		
		
		
					<div class="control-group">
							<label class="control-label">Wyjazd z</label>
							<div class="controls">
								<form:select id="select1" name="select1" path="startLocationR"
			onchange="populate(this.form)"	class="input-xlarge">
									<form:option value="NONE" label="--- Select ---" />
									<form:options items="${localizationList}" />
								</form:select>
								<form:errors path="startLocationR" />
							</div>
						</div>
		
		
		
	
		
		
					<div class="control-group">
							<label class="control-label" >Przyjazd do</label>
							<div class="controls">
								<form:select id="select2" name="select2" path="destinationR"
									class="input-xlarge">
			
								</form:select>
								<c:if test="${pageContext.request.method=='POST'}">
									<form:errors path="destinationR" />
								</c:if>
							</div>
					</div>
		
					<br /> 
							
					<div class="control-group">
							<label class="control-label">Ilość pasażerów</label>
							<div class="controls">
								<form:input class="input-xlarge" path="numberOfPeple" id="numberOfPeple"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="numberOfPeple" />
									</p>
								</c:if>
							</div>
					</div>
		
		
	
	
				<div class="control-group">
							<label class="control-label">Data przejazdu</label>
							<div class="controls">
								<%-- 
								<form:input class="input-xlarge" path="dateAndTimeOfService" id="dateAndTimeOfService"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="dateAndTimeOfService" />
									</p>
								</c:if> 
								--%>
							</div>
					</div>
		
				<br /> 
	

		
					<div class="control-group">
							<label class="control-label">Imię</label>
							<div class="controls">
								<form:input class="input-xlarge" path="firstName" id="firstName"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="firstName" />
									</p>
								</c:if>
							</div>
					</div>
					
					<div class="control-group">
							<label class="control-label">Nazwisko</label>
							<div class="controls">
								<form:input class="input-xlarge" path="lastName" id="lastName"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="lastName" />
									</p>
								</c:if>
							</div>
					</div>
					
					<div class="control-group">
							<label class="control-label">Telefon kontaktowy pasażera</label>
							<div class="controls">
								<form:input class="input-xlarge" path="phone" id="phone"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="phone" />
									</p>
								</c:if>
							</div>
					</div>
					
					<div class="control-group">
							<label class="control-label">Email</label>
							<div class="controls">
								<form:input class="input-xlarge" path="email" id="email"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="email" />
									</p>
								</c:if>
							</div>
					</div>

		
				<br /> 
		<input type="submit" value="Dodaj" class="btn btn-primary"  />
	</form:form>
	
</div>

	<%-- <form:form name="reservationForm" modelAttribute="reservationForm"
		method="post">

		Połączenie z: 
		<form:select path="startLocationR" onchange="populate(this.form)">
			<form:option value="NONE" label="--- Select ---" />
			<form:options items="${localizationList}" />
		</form:select>
		</br>
		<form:errors path="startLocationR" />
		<input type="submit" value="Dodaj" />
	</form:form>

 --%>
</body>
</html>



