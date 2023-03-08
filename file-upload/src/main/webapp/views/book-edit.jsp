<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
					<h3 class="card-header h5 card-header-color">Edit Book</h3>

					<div class="card-body row">
						<div class="col">
							<form:form action="/book" modelAttribute="book" cssClass="form-control">
							
								<form:hidden path="id"/>
								
								<div class="row mb-4">
									<div class="col">
										<label class="form-label">Category</label>
										<form:select path="category" cssClass="form-select">
											<option value="">Select Category</option>
											<form:options items="${ categories }" itemValue="id" itemLabel="name"/>
										</form:select>
									</div>
									
									<div class="col">
										<label class="form-label">Book Title</label>
										<form:input path="title" cssClass="form-control" placeholder="Enter Book Title"/>
									</div>
									
									<div class="col">
										<label class="form-label">Author</label>
										<form:input path="author" cssClass="form-control" placeholder="Enter Author Name"/>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col-4">
										<label class="form-label">Price</label>
										<form:input path="price" type="number" cssClass="form-control"/>
									</div>
									
									<div class="col">
										<label class="form-label">Remark</label>
										<form:input path="remark" cssClass="form-control" placeholder="Enter Remark"/>
									</div>
								</div>
								
								<div class="row mb-4">
									<div class="col">
										<button class="btn btn-primary">Save Book</button>
									</div>
								</div>
							
							</form:form>
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