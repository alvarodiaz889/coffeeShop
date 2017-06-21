<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Products</title>
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
		      	<li><a href="#">Profile</a></li>
		      </sec:authorize>
		      
		      <sec:authorize access="hasRole('ADMIN')">
		      	<li><a href="/products/">Products</a></li>
		      	<li><a href="/persons/">Persons</a></li>
		      </sec:authorize>
		      
		      
		      <sec:authorize access="hasAnyRole('ADMIN','USER')">
		      	<li><a href="/orders/">Orders</a></li>
		      	<li><a href="/logout/">Log Out</a></li>
		      </sec:authorize>		      
		      
		      <li><a href="/login/">Log In</a></li>
		    </ul>
		  </div>
		</nav>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Products</h1>
			</div>
		</div>
		
	</section>
	<div class="containerList">	
	
		<table class="table table-striped">
			<thead>
			  <tr>
			     <th>Id</th>
			     <th>Product Name</th>
			     <th>Product Type</th>
			     <th>Price</th>
			     <th>Description</th>			     
			  </tr>
			</thead>
			
			<tbody>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.id}</td>
					<td>${product.productName}</td>
					<td>${product.productType}</td>
					<td>${product.price}</td>
					<td>${product.description}</td>					
					  
					<td>
						<a href="/products/update?id=${product.id}"><button type="submit" class="btn btn-warning">Update</button></a>											
					</td>
					<td>						
						<form action="/products/delete?id=${product.id}" method="post">
							<button type="submit" class="btn btn-danger">Remove</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
			
		<a href="/products/update?id=0"><button type="button" class="btn btn-primary">Add</button></a>
	</div>	
	
</body>
</html>