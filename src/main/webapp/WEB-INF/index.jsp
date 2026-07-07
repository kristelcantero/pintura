<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pinturas - Registro</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@ include file="common-style.jsp" %>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between align-items-center">
			<a href="/" class="navbar-brand-custom">PINTURAS</a>
			<nav>
				<a href="/login" class="nav-link-custom me-4">Login</a>
				<a href="/registro" class="nav-link-custom active-link">Registro</a>
			</nav>
		</header>

		<div class="row justify-content-center">
			<div class="col-lg-5 col-md-8">
				<div class="form-wrapper">
					<h2 class="page-title text-center">Registro</h2>
					<form:form action="/registro" method="POST" modelAttribute="nuevoUsuario">
						<div class="mb-4">
							<form:label path="nombre">Nombre</form:label>
							<form:input path="nombre" class="form-control" placeholder="Tu nombre" />
							<form:errors path="nombre" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="apellido">Apellido</form:label>
							<form:input path="apellido" class="form-control" placeholder="Tu apellido" />
							<form:errors path="apellido" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="email">Correo electrónico</form:label>
							<form:input path="email" class="form-control" placeholder="ejemplo@correo.com" />
							<form:errors path="email" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="password">Contraseña</form:label>
							<form:password path="password" class="form-control" placeholder="••••••••" />
							<form:errors path="password" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="confirmacion">Confirmar contraseña</form:label>
							<form:password path="confirmacion" class="form-control" placeholder="••••••••" />
							<form:errors path="confirmacion" class="text-danger d-block mt-1" />
						</div>

						<div class="d-grid mt-4">
							<input type="submit" class="btn btn-primary btn-block" value="Registrarse">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
