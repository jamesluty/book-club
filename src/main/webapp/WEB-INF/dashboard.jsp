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
			<a href="/add/book">+ Add a book to my shelf!</a>
		</div>
		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${allBooks }">
					<tr>
						<td>${book.id }</td>
						<td><a href="/book/${book.id }">${book.title }</a></td>
						<td>${book.author }</td>
						<td>${book.user.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>