<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Connect</title>

<!-- OWN CSS -->

<link rel="stylesheet" type="text/css" href="/css/style.css">

<script type="text/javascript" src="/js/app.js"></script>



<link

	href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap"

	rel="stylesheet">

</head>

<body>

	<video autoplay muted loop id="ocean">

		<source src="/img/ocean.mp4" type="video/mp4">

	</video>

	<div class="internBackground">

	<a href="/" id="back">Back</a>

		<div class="connectHeader">

			<h2 class="">Welcome</h2>

			<p class="">Calculate Your Water Print</p>

		</div>

		<div class="connect">

			<div class="register">

				<p id="register">REGISTER</p>

				<form:form action="/register" method="POST"

					class="container d-flex justify-content-center"

					modelAttribute="newUser">

					<div>

						<div>

							<form:label path="userName">User Name:</form:label>

							<form:errors path="userName" class="text-danger" />

							<form:input type="text" path="userName" />

						</div>

						<div>

							<form:label path="email">Email:</form:label>

							<form:errors path="email" class="text-danger" />

							<form:input type="text" path="email" />

						</div>

						<div>

							<form:label path="password">Password:</form:label>

							<form:errors path="password" class="text-danger" />

							<form:input type="password" path="password" />

						</div>

						<div>

							<form:label path="confirm">Confirm Password:</form:label>

							<form:errors path="confirm" class="text-danger" />

							<form:input type="password" path="confirm" />

						</div>

						<div>

							<input type="submit" value="Submit" class="submit" />

						</div>

					</div>

				</form:form>

			</div>

			<div class="register">

				<p id="register">LOGIN</p>



				<form:form action="/login" method="POST" modelAttribute="newLogin">

					<div>



						<div>

							<form:label path="email">Email:</form:label>

							<form:errors path="email" class="text-danger" />

							<form:input type="text" path="email" />

						</div>

						<div>

							<form:label path="password">Password:</form:label>

							<form:errors path="password" class="text-danger" />

							<form:input type="password" path="password" />

						</div>



						<div>

							<input type="submit" value="Submit" />

						</div>

					</div>

				</form:form>

			</div>

		</div>

	</div>

</body>

</html>