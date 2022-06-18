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
	<title>Add Book</title>
</head>
<body>
	<div class="mainWrapper">
		<div class="header">
			<h1>Add a Book to Your Shelf</h1>	
			<a href="/dashboard">Back to the shelves</a>
		</div>
		<form:form class="form" action="/create/book" method="post" modelAttribute="book">
			<div class="formItem">
				<form:label path="title">Title: </form:label>
				<form:input path="title"/>
			</div>
			<form:errors class="errors" path="title"/>
			<div class="formItem">
				<form:label path="author">Author: </form:label>
				<form:input path="author"/>
			</div>
			<form:errors class="errors" path="author"/>
			<div class="formItem">
				<form:label path="thoughts">My thoughts: </form:label>
				<form:input path="thoughts"/>
			</div>
			<form:errors class="errors" path="thoughts"/>
			<div class="btn">
				<button class="btn btn-primary">Add Book</button>
			</div>
		</form:form>
	</div>
</body>
</html>