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
<c:url value="/resources/js/bootstrap.bundle.min.css" var="bootStrapJs"></c:url>

<c:url value="/resources/css/custom.css" var="customCss"></c:url>

<link rel="stylesheet" href="${ bootStrapCss }" />
<link rel="stylesheet" href="${ customCss }">

</head>
<body>
	<div class="container">
		<h1 class="mb-4 text-white">
			<sp:message code="app.title"></sp:message>
		</h1>

		<div class="row">
			<div class="col-9">
				<div class="card">
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
								<tr>
									<td>1</td>
									<td>Head First Java</td>
									<td>John Doe</td>
									<td>Computer Programming</td>
									<td>$25.99</td>
									<td>About Java Programming Book</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Spring Start Here</td>
									<td>John Doe</td>
									<td>Computer Programming</td>
									<td>$20.99</td>
									<td>About Spring Framework</td>
								</tr>
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