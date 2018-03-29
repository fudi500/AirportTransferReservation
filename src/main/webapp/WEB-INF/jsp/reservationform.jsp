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


	<h3>
		<a href="admin">Panel administratora</a>
	</h3>


	<h2>Zarezerwój transfer</h2>
	
	<form:form name="startlocationform" modelAttribute="reservationForm"
		method="post">

		Wyjazd z: 
		
		<form:select id="select1" name="select1" path="startLocationR"
			onchange="populate(this.form)">
			<form:option value="NONE" label="--- Select ---" />
			<form:options items="${localizationList}" />
		</form:select>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="startLocationR" />
		</c:if>
		
		<form:errors path="startLocationR" />
		
		</br>
		Przyjazd do:
		<form:select id="select2" name="select2" path="destinationR">

		</form:select>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="destinationR" />
		</c:if>
		
		<br />
		</br>
		Ilość pasażerów:
		<form:input path="numberOfPeple" id="numberOfPeple"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="numberOfPeple" />
		</c:if>
		
		 <br />
		Data przejazdu:
		<%--
		<form:input path="dateAndTimeOfService" id="dateAndTimeOfService"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="dateAndTimeOfService" />
		</c:if> --%>
		
		<br />
		<br />
		Imię:
		<form:input path="firstName" id="firstName"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="firstName" />
		</c:if>
		
		<br />
		Nazwisko:
		<form:input path="lastName" id="lastName"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="lastName" />
		</c:if>
		
		<br />
		Telefon Kontaktowy pasażera:
		<form:input path="phone" id="phone"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="phone" />
		</c:if>
		
		<br />
		Email:
		<form:input path="email" id="email"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="email" />
		</c:if>
			
		

		<br />
		<br />
		<input type="submit" value="Dodaj" />
	</form:form>

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



