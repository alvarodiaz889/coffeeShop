<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Persons</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/styles.css">

</head>
<body>

	<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">Coffee Shop</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="#">Home</a></li>		      
		      
		      <sec:authorize access="hasRole('USER')">
		      	<li><a href="/users/profile">Profile</a></li>
		      </sec:authorize>
		      
		      <sec:authorize access="hasRole('ADMIN')">
		      	<li><a href="/products/">Products</a></li>
		      	<li><a href="/persons/">Persons</a></li>
		      </sec:authorize>
		      
		      
		      <sec:authorize access="hasAnyRole('ADMIN','USER')">
		      	<li><a href="/orders/">Orders</a></li>
		      	<li><a href="/logout/">Log Out</a></li>
		      </sec:authorize>		      
		      
		    </ul>
		  </div>
		</nav>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Persons</h1>
			</div>
		</div>
		
	</section>
	<div class="containerList">

		<table class="table table-striped">
			<thead>
			  <tr>
			     <th>Id</th>
			     <th>First Name</th>
			     <th>Last Name</th>
			     <th>Email</th>
			     <th>Phone</th>
			     <th>Address</th>
			     <th>Is Enabled</th>
			  </tr>
			</thead>
			
			<tbody>
			<c:forEach var="person" items="${persons}">
				<tr>
					<td>${person.id}</td>
					<td>${person.firstName}</td>
					<td>${person.lastName}</td>
					<td>${person.email}</td>
					<td>${person.phone}</td>
					<td>${person.address.city}</td>
					<td>${person.enable}</td>
					  
					<td>
						<a href="/persons/update?id=${person.id}"><button type="submit" class="btn btn-warning">Update</button></a>											
					</td>
					<td>						
						<form action="/persons/delete?id=${person.id}" method="post">
							<button type="submit" class="btn btn-danger">Remove</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
			
		<a href="/persons/update?id=0"><button type="button" class="btn btn-primary">Add</button></a>
	</div>	
	
</body>
</html>