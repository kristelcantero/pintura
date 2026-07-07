<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pinturas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@ include file="common-style.jsp" %>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between align-items-center">
			<a href="/pinturas" class="navbar-brand-custom">PINTURAS</a>
			<nav class="d-flex align-items-center">
				<a href="/mis-compras" class="nav-link-custom me-4">Mis compras</a>
				<a href="/pinturas" class="nav-link-custom active-link me-4">Pinturas</a>
				<a href="/nuevo" class="nav-link-custom me-4">Agregar pintura</a>
				<a href="/logout" class="btn btn-danger btn-sm">Logout</a>
			</nav>
		</header>

		<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-5 gap-3">
			<div>
				<h3 class="m-0 fs-4">Bienvenido de vuelta, ${usuarioEnSesion.nombre}</h3>
				<p class="text-muted m-0 small">Explora y colecciona obras de arte exclusivas.</p>
			</div>
			
			<div style="min-width: 300px; max-width: 100%;">
				<form action="/buscar" method="GET">
					<div class="input-group-custom">
						<input type="text" placeholder="Buscar por título o autor..." name="palabra">
						<button type="submit">Buscar</button>
					</div>
				</form>
			</div>
		</div>

		<main class="row">
			<div class="col-12">
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
					<c:forEach items="${pinturas}" var="pintura">
						<div class="col">
							<div class="card h-100 art-card">
								<div class="art-img-container">
									<a href="/pintura/${pintura.id}">
										<img src="${pintura.urlImagen}" class="art-img" alt="${pintura.titulo}">
									</a>
								</div>
								<div class="art-card-body d-flex flex-column justify-content-between">
									<div>
										<h5 class="art-title">
											<a href="/pintura/${pintura.id}">${pintura.titulo}</a>
										</h5>
										<div class="art-meta">Autor: <strong>${pintura.autor}</strong></div>
										<div class="art-meta">Año: ${pintura.anio}</div>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<span class="art-price">$ <fmt:formatNumber value="${pintura.precio}" pattern="#,##0.00"/></span>
										<c:if test="${pintura.creador.id == usuarioEnSesion.id}">
											<a href="/editar/${pintura.id}" class="text-muted" title="Editar obra">
												<i class="fa-solid fa-pen-to-square"></i>
											</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<c:if test="${empty pinturas}">
					<div class="text-center py-5">
						<p class="text-muted fs-5">No hay pinturas disponibles en la colección en este momento.</p>
					</div>
				</c:if>
			</div>
		</main>
	</div>
</body>
</html>
