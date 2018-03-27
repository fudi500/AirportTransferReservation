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



	<c:choose>
		<c:when test="${userForm['new']}">
			<h1>Dodaj połączenie</h1>
		</c:when>
		<c:otherwise>
			<h1>Edytuj połączenie</h1>
		</c:otherwise>
	</c:choose>
	<br />

	<form:form modelAttribute="destinationForm" method="post">

		Połączenie z: 
		<form:select path="localizationID" >
			<%-- <form:option value="NONE" label="--- Select ---" /> --%>
			<form:options items="${localizationList}" />
		</form:select>
		<form:errors path="localizationID"/>
		
		<br /> 
		
		
		Do: 
		<form:input path="destinationName" id="destinationName"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="destinationName" />
		</c:if>
		<br /> 
		
		
		
		 
		Cena dla ilości osób: <br /> 
		od 1 do 3: 
		<form:input path="price1to3" id="price1to3"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="price1to3" />
		</c:if>
		<br />
		od 4 do 8: 
		<form:input path="price4to8" id="price4to8"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="price4to8" />
		</c:if>
		<br />
		
		od 9 do 16: 
		<form:input path="price9to16" id="price9to16"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="price9to16" />
		</c:if>
		<br />
		
		od 17 do 40:
		<form:input path="price17to40" id="price17to40"></form:input>
		<c:if test="${pageContext.request.method=='POST'}">
			<form:errors path="price17to40" />
		</c:if>
		<br />
		

		<input type="submit" value="Wyślij formularz" />
	</form:form>




</body>
</html>