<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Your Water Consumption</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
</head>
<body>
	<video autoplay muted loop id="ocean">
		<source src="/img/ocean.mp4" type="video/mp4">
	</video>
	<div class="internBackground">
<div class="welcome">
			<div class="headerConsu">
				<a href="/" id="back">BACK</a>
			</div>
			<div class="logout">
			<p>
				WELCOME
				<c:out value="${fn:toUpperCase(user.userName)}" />
			</p>
			<a href="/logout" id="logout">LOGOUT</a>
			</div>
		</div>
		<h1 class="titleDash">ADD YOUR DAILY WATER CONSUMPTION</h1>
		<div class="newConsume">
			<form:form action="/dashboard" method="POST"
				modelAttribute="consumption">
				<form:hidden path="consumer" value="${userId }" />

				<div>
					<p><form:errors path="shower" class="text-danger" /></p>
					<p><form:errors path="bath" class="text-danger" /></p>
					<p><form:errors path="toilet" class="text-danger" /></p>
					<p><form:errors path="handWash" class="text-danger" /></p>
					<p><form:errors path="brushTeeth" class="text-danger" /></p>
					<p><form:errors path="washingMachine" class="text-danger" /></p>
					<p><form:errors path="dishwasher" class="text-danger" /></p>
					<p><form:errors path="dishesByHand" class="text-danger" /></p>
				</div>

				<div class="form row">
					<img src="/img/shower.png" class="icon" />
					<form:label path="shower" class="col-sm-2 col-form-label">Showers:</form:label>
					<form:input type="number" path="shower" class="form-control" />
				</div>
				<div class="form row">
					<img src="/img/bathtub.png" class="icon" />
					<form:label path="bath" class="col-sm-2 col-form-label">Baths:</form:label>
					<form:input type="number" path="bath" class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/toilet.png" class="icon" />
					<form:label path="toilet" class="col-sm-2 col-form-label">Flushes toilets:</form:label>
					<form:input type="number" path="toilet" class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/handWash.png" class="icon" />
					<form:label path="handWash" class="col-sm-2 col-form-label">Washed hands:</form:label>
					<form:input type="number" path="handWash" class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/toothBrush.png" class="icon" />
					<form:label path="brushTeeth" class="col-sm-2 col-form-label">Teeth brushed:</form:label>
					<form:input type="number" path="brushTeeth" class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/washingMachine.png" class="icon" />
					<form:label path="washingMachine" class="col-sm-2 col-form-label">Washing Machine:</form:label>
					<form:input type="number" path="washingMachine"
						class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/dishwasher.png" class="icon" />
					<form:label path="dishwasher" class="col-sm-2 col-form-label">Dishwasher:</form:label>
					<form:input type="number" path="dishwasher" class="form-control" />
				</div>
				<div class="form-group row">
					<img src="/img/washByHand.png" class="icon" />
					<form:label path="dishesByHand" class="col-sm-2 col-form-label">Hand-washed dishes:</form:label>
					<form:input type="number" path="dishesByHand" class="form-control" />
				</div>
				<div>
					<button type="submit" value="Submit" class="btn btn-dark">Submit</button>
				</div>
			</form:form>
		</div>
		</div>
		<div>
			<h2 class="titleDash">YOUR WATER CONSUMPTIONS:</h2>
			<div style="overflow: scroll; height: 400px;">
			
			<c:forEach var="eachConsumption" items="${consumptions }">
<!-- 			<div class="slideshow-container"> -->
				<div class="dayConsumption">
					<h5>Date: <fmt:formatDate value="${eachConsumption.createdAt }" 
						pattern="dd MMMM yyyy"></fmt:formatDate> </h5>
					<div class="consumptionData">
						<div class="dataColumnOne">
							<c:set var="shower" value="${76 * eachConsumption.shower}" />
							<p>Showers: <c:out value="${shower}" /> L</p>
							
							<c:set var="bath" value="${114 * eachConsumption.bath}" />
							<p>Baths: <c:out value="${bath}" /> L</p>
							
							<c:set var="toilet" value="${6 * eachConsumption.toilet}" />
							<p>Flushed toilet: <c:out value="${toilet}" /> L</p>
							
							<c:set var="handWash" value="${15 * eachConsumption.handWash}" />
							<p>Washed hands: <c:out value="${handWash}" /> L</p>
						</div>
						<div class="dataColumn">
							<c:set var="brushTeeth" value="${15 * eachConsumption.brushTeeth}" />
							<p>Teeth brushed: <c:out value="${brushTeeth}" /> L</p>
							
							<c:set var="washingMachine" value="${72 * eachConsumption.washingMachine}" />
							<p>Washing machine: <c:out value="${washingMachine}" /> L</p>
							
							<c:set var="dishwasher" value="${45 * eachConsumption.dishwasher}" />
							<p>Dishwasher: <c:out value="${dishwasher}" /> L</p>
							
							<c:set var="dishesByHand" value="${76 * eachConsumption.dishesByHand}" />
							<p>Hand-washed dishes: <c:out value="${dishesByHand}" /> L</p>
						</div>
					</div>
				
				<c:set var="total" value="${shower + bath + toilet + handWash + brushTeeth + washingMachine + dishwasher + dishesByHand}" />
				<div>
					<h4 id="total">Daily total: <c:out value="${total}" /> L </h4>
					<form action="/consumption/${eachConsumption.id}" method="post">
						<input type="hidden" name="_method" value="delete"> 
						<input type="submit" class="deletebtn"> 
					</form>
				</div>
				
<!-- 					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div> -->
			</div>
<!-- 			<div style="text-align:center">
			  <span class="dot" onclick="currentSlide(1)"></span>
			  <span class="dot" onclick="currentSlide(2)"></span>
			  <span class="dot" onclick="currentSlide(3)"></span>
			</div> -->
			</c:forEach></div>
		</div>

<div class="internBackground">
		<h2 class="titleGraph">YOUR WATER CONSUMPTION OVER THE LAST YEAR</h2>
		<div class="chart">
			<canvas id="myChart"></canvas>
		</div>
		
		<h2 class="titleGraph">AVERAGE DAILY  WATER CONSUMPTION PER HABITANT</h2>
		<div class="chart">
			<canvas id="myChart4"></canvas>
		</div>

		<div>
			<p id="totalWater">${totalWaterList}</p>
			<c:forEach var="eachTot" items="${totalWaterList}">
				<p>${eacTot}</p>
			</c:forEach>
		</div>

	<script type="text/javascript" src="/js/main.js"></script>
	<script type="text/javascript">
		userScript.myChart();
	</script>
	
	<script type="text/javascript" src="/js/graph4.js"></script>
	<script type="text/javascript">
		userScript4.myChart4();
	</script>
</div>
</body>
</html>