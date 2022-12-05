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

<link rel="stylesheet" href="${ bootStrapCss }" />
</head>
<body>
	<div class="container">
		<h1>
			<sp:message code="app.title"></sp:message>
		</h1>

		<div class="card mt-4">
			<h3 class="card-header h5">Book Search</h3>

			<div class="card-body row">
				<div class="col-auto">
					<label for="category" class="col-form-label">Category</label>
				</div>

				<div class="col-auto">
					<select name="category" id="category" class="form-select">
						<option value="">Book Search</option>
					</select>
				</div>

				<div class="col-auto">
					<label for="keyword" class="col-form-label">Keyword</label>
				</div>

				<div class="col-auto">
					<input type="text" class="form-control" id="keyword"
						placeholder="Enter Keyword" />
				</div>

				<div class="col-auto">
					<button class="btn btn-primary">Search</button>
					<a href="#" class="btn btn-danger">Upload</a> 
					
					<c:url value="/book/edit" var="bookEdit"></c:url>
					<a href="${ bookEdit }" class="btn btn-warning">Add New</a>
				</div>
			</div>
		</div>

		<table class="table table-striped mt-4">
			<thead class="bg-secondary text-white">
				<tr>
					<td>ID</td>
					<td>Title</td>
					<td>Author</td>
					<td>Category</td>
					<td>Description</td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>1</td>
					<td>Head First Java</td>
					<td>John Doe</td>
					<td>Computer Programming</td>
					<td>About Java Programming Book</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Spring Start Here</td>
					<td>John Doe</td>
					<td>Computer Programming</td>
					<td>About Spring Framework</td>
				</tr>
			</tbody>
		</table>
	</div>



	<script src="${ bootStrapJs }"></script>
</body>
</html>