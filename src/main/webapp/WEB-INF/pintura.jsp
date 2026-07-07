<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pintura.titulo}</title>
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

		<div class="row g-5">
			<c:if test="${not empty error}">
    	<div class="alert alert-danger mt-3">${error}</div>
			</c:if>
			<c:if test="${not empty exito}">
    	<div class="alert alert-success mt-3">${exito}</div>
			</c:if>
			<!-- Columna Imagen de la Obra -->
			<div class="col-lg-6">
				<div class="art-img-container shadow-sm border" style="border-radius: 8px;">
					<img src="${pintura.urlImagen}" class="img-fluid w-100" style="object-fit: contain; max-height: 550px;" alt="${pintura.titulo}">
				</div>
			</div>

			<!-- Columna Ficha Técnica e Información -->
			<div class="col-lg-6">
				<div class="ps-lg-3">
					<h1 class="display-serif fs-2 mb-2">${pintura.titulo}</h1>
					<p class="text-muted fs-5 mb-4">Por <strong>${pintura.autor}</strong> (${pintura.anio})</p>
					
					<hr class="my-4" style="border-color: var(--border-color);">

					<div class="mb-4">
						<h5 class="fs-6 uppercase text-muted mb-2" style="font-size: 0.8rem; letter-spacing: 0.08em; font-family: var(--font-sans);">Descripción de la Obra</h5>
						<p class="fs-6 text-secondary" style="line-height: 1.8;">${pintura.descripcion}</p>
					</div>

					<div class="row align-items-center mb-4 py-3 px-2" style="background-color: #f7f6f2; border-radius: 6px;">
						<div class="col-6">
							<span class="d-block text-muted small" style="font-size: 0.75rem; letter-spacing: 0.05em; text-transform: uppercase;">Precio</span>
							<span class="fs-3 fw-bold text-dark">$ <fmt:formatNumber value="${pintura.precio}" pattern="#,##0.00"/></span>
						</div>
						<div class="col-6 text-end">
							<span class="d-block text-muted small mb-1" style="font-size: 0.75rem; letter-spacing: 0.05em; text-transform: uppercase;">Disponibilidad</span>
							<c:choose>
								<c:when test="${pintura.cantidad > 0}">
									<span class="badge-custom">${pintura.cantidad} en inventario</span>
								</c:when>
								<c:otherwise>
									<span class="badge text-bg-danger text-uppercase px-3 py-2 fs-7" style="font-size: 0.7rem; letter-spacing: 0.05em;">Agotado</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="d-grid gap-2 mb-5">
						<c:choose>
							<c:when test="${pintura.cantidad > 0}">
								<a href="/comprar/${pintura.id}" class="btn btn-primary btn-lg">Adquirir Obra</a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-secondary btn-lg" disabled>No Disponible</button>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- Sección Coleccionistas -->
					<div class="border-top pt-4">
						<h5 class="fs-6 mb-3" style="font-family: var(--font-sans); letter-spacing: 0.04em; text-transform: uppercase;"><i class="fa-solid fa-bookmark me-2 text-muted"></i>Coleccionistas de esta obra</h5>
						<ul class="list-unstyled">
							<c:forEach items="${pintura.compradores}" var="comprador">
								<li class="py-2 border-bottom border-light d-flex align-items-center">
									<div class="rounded-circle bg-dark text-white d-flex align-items-center justify-content-center me-3" style="width: 32px; height: 32px; font-size: 0.8rem; font-weight: 600;">
										${comprador.nombre.substring(0,1).toUpperCase()}${comprador.apellido.substring(0,1).toUpperCase()}
									</div>
									<span class="text-secondary">${comprador.nombre} ${comprador.apellido}</span>
								</li>
							</c:forEach>
							<c:if test="${empty pintura.compradores}">
								<li class="text-muted py-2 small"><i class="fa-regular fa-circle-question me-2"></i>Sé el primero en adquirir esta pieza exclusiva.</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
