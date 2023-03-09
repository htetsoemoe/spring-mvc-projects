<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><sp:message code="app.title"></sp:message></title>

<c:url value="/resources/css/bootstrap.min.css" var="bootStrapCss"></c:url>
<c:url value="/resources/js/bootstrap.bundle.min.css" var="bootStrapJs"></c:url>

<c:url value="/resources/css/custom.css" var="customCss"></c:url>

<link rel="stylesheet" href="${ bootStrapCss }" />
<link rel="stylesheet" href="${ customCss }">

</head>
<body>
	<div class="container">
		<h1 class="text-white">
			<c:url value="/home" var="home"></c:url>
			<a href="${ home }" class="text-decoration-none text-light"> <sp:message
					code="app.title"></sp:message>
			</a>

		</h1>

		<div class="row">
			<div class="col-9">
				<div class="card mb-4">
					<h3 class="card-header h5 card-header-color">Book Details</h3>

					<div class="card-body row">
						<div class="col">

							<div class="row mb-4">
								<div class="col">
									<label class="form-label">Category</label> <span
										class="form-control">${ book.category.name }</span>
								</div>

								<div class="col">
									<label class="form-label">Book Title</label> <span
										class="form-control">${ book.title }</span>
								</div>

								<div class="col">
									<label class="form-label">Author</label> <span
										class="form-control">${ book.author }</span>
								</div>
							</div>

							<div class="row mb-4">
								<div class="col-4">
									<label class="form-label">Price</label> <span
										class="form-control">${ book.price }</span>
								</div>

								<div class="col">
									<label class="form-label">Remark</label> <span
										class="form-control">${ book.remark }</span>
								</div>
							</div>

							<div class="row mb-4">
								<div class="col">
									<c:url value="/book/edit" var="editUrl">
										<c:param name="id" value="${ book.id }"></c:param>
									</c:url>
									<a href="${ editUrl }" class="btn btn-primary">Edit Book</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="col">
				<c:url value="/views/imports/search-bar.jsp" var="searchBarImport"></c:url>
				<c:import url="${ searchBarImport }"></c:import>
			</div>
		</div>


	</div>



	<script src="${ bootStrapJs }"></script>
</body>
</html>