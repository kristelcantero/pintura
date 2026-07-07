<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar pintura</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@ include file="common-style.jsp" %>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between align-items-center">
			<a href="/pinturas" class="navbar-brand-custom">PINTURAS</a>
			<nav class="d-flex align-items-center">
				<a href="/mis-compras" class="nav-link-custom me-4">Mis compras</a>
				<a href="/pinturas" class="nav-link-custom me-4">Pinturas</a>
				<a href="/nuevo" class="nav-link-custom active-link me-4">Agregar pintura</a>
				<a href="/logout" class="btn btn-danger btn-sm">Logout</a>
			</nav>
		</header>

		<div class="row justify-content-center">
			<div class="col-lg-7 col-md-9">
				<div class="form-wrapper">
					<h2 class="page-title text-center">Agregar nueva obra</h2>
					<form:form action="/crear" method="POST" modelAttribute="nuevaPintura">
						<div class="row">
							<div class="col-md-8 mb-4">
								<form:label path="titulo">Título de la Obra</form:label>
								<form:input path="titulo" class="form-control" placeholder="Ej. La persistencia de la memoria" />
								<form:errors path="titulo" class="text-danger d-block mt-1" />
							</div>
							<div class="col-md-4 mb-4">
								<form:label path="anio">Año de Creación</form:label>
								<form:input path="anio" class="form-control" placeholder="Ej. 1931" />
								<form:errors path="anio" class="text-danger d-block mt-1" />
							</div>
						</div>

						<div class="mb-4">
							<form:label path="autor">Autor / Pintor</form:label>
							<form:input path="autor" class="form-control" placeholder="Ej. Salvador Dalí" />
							<form:errors path="autor" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="descripcion">Descripción de la Obra</form:label>
							<form:textarea path="descripcion" class="form-control" rows="4" placeholder="Describe los detalles, el estilo o el trasfondo de la pintura..." />
							<form:errors path="descripcion" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="urlImagen">URL de la Imagen</form:label>
							<form:input path="urlImagen" class="form-control" placeholder="https://ejemplo.com/imagen.jpg" />
							<form:errors path="urlImagen" class="text-danger d-block mt-1" />
						</div>

						<div class="row">
							<div class="col-md-6 mb-4">
								<form:label path="cantidad">Cantidad en Stock</form:label>
								<form:input path="cantidad" class="form-control" placeholder="Ej. 1" />
								<form:errors path="cantidad" class="text-danger d-block mt-1" />
							</div>
							<div class="col-md-6 mb-4">
								<form:label path="precio">Precio (USD)</form:label>
								<form:input path="precio" class="form-control" placeholder="Ej. 12500.00" />
								<form:errors path="precio" class="text-danger d-block mt-1" />
							</div>
						</div>

						<div class="d-grid mt-4">
							<input type="submit" class="btn btn-primary" value="Registrar Obra">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
