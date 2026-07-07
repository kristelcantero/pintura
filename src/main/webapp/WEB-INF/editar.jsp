<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar pintura</title>
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
				<a href="/nuevo" class="nav-link-custom me-4">Agregar pintura</a>
				<a href="/logout" class="btn btn-danger btn-sm">Logout</a>
			</nav>
		</header>

		<div class="row justify-content-center">
			<div class="col-lg-7 col-md-9">
				<div class="form-wrapper">
					<h2 class="page-title text-center">Editar obra</h2>
					
					<form:form action="/actualizar/${pintura.id}" method="POST" modelAttribute="pintura">
						<input type="hidden" name="_method" value="PUT">
						<form:hidden path="id" />

						<div class="row">
							<div class="col-md-8 mb-4">
								<form:label path="titulo">Título de la Obra</form:label>
								<form:input path="titulo" class="form-control" />
								<form:errors path="titulo" class="text-danger d-block mt-1" />
							</div>
							<div class="col-md-4 mb-4">
								<form:label path="anio">Año de Creación</form:label>
								<form:input path="anio" class="form-control" />
								<form:errors path="anio" class="text-danger d-block mt-1" />
							</div>
						</div>

						<div class="mb-4">
							<form:label path="autor">Autor / Pintor</form:label>
							<form:input path="autor" class="form-control" />
							<form:errors path="autor" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="descripcion">Descripción de la Obra</form:label>
							<form:textarea path="descripcion" class="form-control" rows="4" />
							<form:errors path="descripcion" class="text-danger d-block mt-1" />
						</div>

						<div class="mb-4">
							<form:label path="urlImagen">URL de la Imagen</form:label>
							<form:input path="urlImagen" class="form-control" />
							<form:errors path="urlImagen" class="text-danger d-block mt-1" />
						</div>

						<div class="row">
							<div class="col-md-6 mb-4">
								<form:label path="cantidad">Cantidad en Stock</form:label>
								<form:input path="cantidad" class="form-control" />
								<form:errors path="cantidad" class="text-danger d-block mt-1" />
							</div>
							<div class="col-md-6 mb-4">
								<form:label path="precio">Precio (USD)</form:label>
								<form:input path="precio" class="form-control" />
								<form:errors path="precio" class="text-danger d-block mt-1" />
							</div>
						</div>

						<div class="d-flex gap-3 justify-content-end mt-4 pt-3 border-top">
							<a href="/pinturas" class="btn btn-outline-secondary me-auto" style="text-transform: uppercase; font-size: 0.75rem; font-weight: 600; letter-spacing: 0.05em; padding: 0.75rem 1.5rem; border-radius: 4px; border: 1px solid #ccc; color: #555;">Volver</a>
							<input type="submit" class="btn btn-primary" value="Actualizar Obra">
						</div>
					</form:form>

					<form action="/borrar/${pintura.id}" method="POST" class="mt-4 text-end">
						<input type="hidden" name="_method" value="DELETE">
						<input type="submit" value="Eliminar de la Galería" class="btn btn-danger btn-sm">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
