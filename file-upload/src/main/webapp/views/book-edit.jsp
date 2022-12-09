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
		<h1 class="text-white">
			<sp:message code="app.title"></sp:message>
		</h1>

		<div class="card mt-4">
			<h3 class="card-header h5 card-header-color">Edit Book</h3>

			<div class="card-body row">
				<div class="col-auto">
					<label for="category" class="col-form-label">Edit</label>
				</div>
			</div>
		</div>


	</div>



	<script src="${ bootStrapJs }"></script>
</body>
</html>