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
	<title>Show Book</title>
</head>
<body>
	<div class="mainWrapper">
		<div class="header">
			<h1>${book.title }</h1>
			<a href="/dashboard">Back to the shelves</a>
		</div>
		<div class="showSubHeader">
			<c:choose>
				<c:when test="${loggedIn }">
					<h3>You read ${book.title } by ${book.author }</h3>
					<h3>Here are your thoughts:</h3>
				</c:when>
				<c:otherwise>
					<h3>${book.user.name } read ${book.title } by ${book.author }</h3>
					<h3>Here are ${book.user.name }'s thoughts:</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="thoughtsDiv">
			<hr/>
			<p>${book.thoughts }</p>
			<hr/>
			<div class="editBtns">
				<a class="btn btn-primary" href="/edit/book/${book.id }">Edit</a>
				<form action="/delete/${book.id }" method="post">
				    <input type="hidden" name="_method" value="delete">
				    <input class="btn btn-danger" type="submit" value="Delete">
				</form>
			</div>
		</div>
	</div>
</body>
</html>