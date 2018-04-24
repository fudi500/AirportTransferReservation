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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 
    <div class="container">

          <div class="jumbotron">


				<form:form modelAttribute="destinationForm" method="post"
					class="form-horizontal">

					<fieldset>

						<!-- Form Name -->
						<legend>Dodaj połączenie</legend>
						<%-- 	<c:choose>
					<c:when test="${destinationForm['new']}">
						<h1>Dodaj połączenie</h1>
					</c:when>
					<c:otherwise>
						<h1>Edytuj połączenie</h1>
					</c:otherwise>
				</c:choose>
				<br /> --%>

						<div class="control-group">
							<label class="control-label" for="localizationID">Połączenie
								z</label>
							<div class="controls">
								<form:select placeholder="--- Select ---" path="localizationID"
									class="input-xlarge">
									<form:option value="NONE" label="--- Select ---" />
									<form:options items="${localizationList}" />
								</form:select>
								<form:errors path="localizationID" />
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> Do</label>
							<div class="controls">
								<form:input class="input-xlarge" path="destinationName"
									id="destinationName" placeholder="Balice Airport"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="destinationName" />
									</p>
								</c:if>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> od 1 do 3</label>
							<div class="controls">
								<form:input class="input-xlarge" path="price1to3" id="price1to3"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="price1to3" />
									</p>
								</c:if>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> od 4 do 8:</label>
							<div class="controls">
								<form:input class="input-xlarge" path="price4to8" id="price4to8"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="price4to8" />
									</p>
								</c:if>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> od 9 do 16</label>
							<div class="controls">
								<form:input class="input-xlarge" path="price9to16"
									id="price9to16"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="price9to16" />
									</p>
								</c:if>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label"> od 17 do 40</label>
							<div class="controls">
								<form:input class="input-xlarge" path="price17to40"
									id="price17to40"></form:input>
								<c:if test="${pageContext.request.method=='POST'}">
									<p class="help-block">
										<form:errors path="price17to40" />
									</p>
								</c:if>
							</div>
						</div>
	
						<br /> <input type="submit" value="Wyślij formularz"
							class="btn btn-primary" />
			
			</form:form>


		</div>
	</div>
	
</body>
</html>