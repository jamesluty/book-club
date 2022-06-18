<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Dashboard</title>
</head>
<body>
	<div class="mainWrapper">
		<div class="header">
			<h1>Welcome, ${user.name }</h1>
			<a class="btn btn-primary" href="/logout">Logout</a>
		</div>
		<div class="subHeader">
			<h3>Books from everyone's shelves:</h3>
			<a href="/dashboard">Back to the shelves</a>
		</div>
		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${available }">
					<tr>
						<td>${book.id }</td>
						<td><a href="/book/${book.id }">${book.title }</a></td>
						<td>${book.author }</td>
						<td>${book.user.name }</td>
						<td class="actionBtns">
							<c:choose>
								<c:when test="${user.id != book.user.id }">
									<a class="btn btn-success" href="/borrow/${book.id }">Borrow</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-primary" href="/edit/book/${book.id }">Edit</a>
									<form action="/delete/${book.id }" method="post">
									    <input type="hidden" name="_method" value="delete">
									    <input class="btn btn-danger" type="submit" value="Delete">
									</form>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table table-borded table-striped">
			<thead class="table-dark">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${borrowed }">
					<tr>
						<td>${book.id }</td>
						<td><a href="/book/${book.id }">${book.title }</a></td>
						<td>${book.author }</td>
						<td>${book.user.name }</td>
						<td class="actionBtns">
							<a class="btn btn-success" href="/return/${book.id }">Return</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>