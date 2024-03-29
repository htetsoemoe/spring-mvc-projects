<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><sp:message code="app.title"></sp:message></title>

<c:url value="/resources/css/bootstrap.min.css" var="bootStrapCss"></c:url>
<c:url value="/resources/js/bootstrap.bundle.min.js" var="bootStrapJs"></c:url>

<c:url value="/resources/css/custom.css" var="customCss"></c:url>

<link rel="stylesheet" href="${ bootStrapCss }" />
<link rel="stylesheet" href="${ customCss }">

</head>
<body>
	<div class="container">
		<h1 class="mb-4 text-white">
			<c:url value="/home" var="home"></c:url>
			<a href="${ home }" class="text-decoration-none text-light"> <sp:message
					code="app.title"></sp:message>
			</a>
		</h1>

		<c:url value="/views/imports/upload-result.jsp"
			var="uploadResultImport"></c:url>
		<c:import url="${ uploadResultImport }"></c:import>

		<div class="row">
			<div class="col-9">
				<div class="card mb-4">
					<h3 class="card-header h5 card-header-color">Book List</h3>

					<div class="card-body">
						<table class="table table-striped mt-4">
							<thead class="table-header-color">
								<tr>
									<td>ID</td>
									<td>Title</td>
									<td>Author</td>
									<td>Category</td>
									<td>Price</td>
									<td>Remark</td>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="book" items="${ list }">
									<tr>
										<td>${ book.id }</td>
										<td><c:url value="/book/details" var="detailsLink">
												<c:param name="id" value="${ book.id }"></c:param>
											</c:url> <a href="${ detailsLink }">${ book.title }</a></td>
										<td>${ book.author }</td>
										<td>${ book.category.name }</td>
										<td>${ book.price }</td>
										<td>${ book.remark }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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