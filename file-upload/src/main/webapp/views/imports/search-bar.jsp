<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>
    
		<div class="card">
			<h3 class="card-header h5 card-header-color">Book Search</h3>

			<form action="#" class="card-body">
				<div class="mb-4">
					<label for="category" class="col-form-label">Category</label>
					<select name="category" id="category" class="form-select">
						<option value="">Book Search</option>
					</select>
				</div>

				<div class="mb-4">
					<label for="keyword" class="col-form-label">Keyword</label>
					<input type="text" class="form-control" id="keyword" placeholder="Enter Keyword" />
				</div>


				<div class="d-grid gap-2">
					<button class="btn btn-primary">Search</button>
					<a href="#" class="btn btn-danger">Upload</a> 
					
					<c:url value="/book/edit" var="bookEdit"></c:url>
					<a href="${ bookEdit }" class="btn btn-success">Add New</a>
				</div>
			</form>
		</div>