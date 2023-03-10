<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>
    
		<div class="card">
			<h3 class="card-header h5 card-header-color">Book Search</h3>

			<!-- when user click 'Search' button which made  GET Request to following link -->
			
			<c:url value="/book" var="searchUrl"></c:url>
			<form action="${ searchUrl }" class="card-body">
				<div class="mb-4">
					<label for="category" class="col-form-label">Category</label>
					
					<select name="category" id="category" class="form-select">
						<option value="">Select Category</option>
						
						<c:forEach var="c" items="${ categories }">
							<c:choose>
								<c:when test="${ c.id eq param.category }">
									<option value="${ c.id }" selected="selected">${ c.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${ c.id }">${ c.name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
					</select>
				</div>

				<div class="mb-4">
					<label for="keyword" class="col-form-label">Keyword</label>
					<input type="text" name="keyword" value="${ param.keyword }" class="form-control" id="keyword" placeholder="Enter Keyword" />
				</div>

				<div class="d-grid gap-2">				
					<!-- This is button look like 'Submit' which made GET Request to '/book' with search keyword -->
					<button class="btn btn-primary">Search</button>
					
					<a href="#" id="btnUpload" class="btn btn-danger">Upload</a> 
					
					<c:url value="/book/edit" var="bookEdit"></c:url>
					<a href="${ bookEdit }" class="btn btn-success">Add New</a>
				</div>
			</form>
			
			<!-- This is file input -->
			<c:url value="/upload" var="upload"></c:url>
			<form action="${ upload }" method="post" enctype="multipart/form-data" id="uploadForm" class="d-none">
				<input type="file" id="uploadInput" name="uploadFile"/>
			</form>
			
			<c:url value="/resources/js/upload.js" var="uploadJs"></c:url>
			<script src="${ uploadJs }" type="text/javascript"></script>
		</div>