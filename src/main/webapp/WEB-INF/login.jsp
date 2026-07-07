<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pinturas - Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@ include file="common-style.jsp" %>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between align-items-center">
			<a href="/" class="navbar-brand-custom">PINTURAS</a>
			<nav>
				<a href="/login" class="nav-link-custom active-link me-4">Login</a>
				<a href="/registro" class="nav-link-custom">Registro</a>
			</nav>
		</header>

		<div class="row justify-content-center">
			<div class="col-lg-4 col-md-6">
				<div class="form-wrapper">
					<h2 class="page-title text-center">Login</h2>
					<form:form action="/iniciarSesion" method="POST" modelAttribute="loginUsuario">
						<div class="mb-4">
							<form:label path="emailLogin">Correo electrónico</form:label>
							<form:input path="emailLogin" class="form-control" placeholder="ejemplo@correo.com" />
							<form:errors path="emailLogin" class="text-danger d-block mt-1" />
						</div>
						<div class="mb-4">
							<form:label path="passwordLogin">Contraseña</form:label>
							<form:password path="passwordLogin" class="form-control" placeholder="••••••••" />
							<form:errors path="passwordLogin" class="text-danger d-block mt-1" />
						</div>
						<div class="d-grid mt-4">
							<input type="submit" class="btn btn-primary btn-block" value="Login">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
