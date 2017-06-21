<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Lines</title>
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
				<h1>Order Lines</h1>
			</div>
		</div>
		
	</section>
	<div class="detailsContainer">
	
		<table class="table table-striped">
			<thead>
			  <tr>
			     <th>Id</th>
			     <th>Product</th>
			     <th>Quantity</th>			     			     
			  </tr>
			</thead>
			
			<tbody>
			<c:forEach var="orderLine" items="${orderLines}">
				<tr>
					<td>${orderLine.id}</td>
					<td>${orderLine.product.productName}</td>
					<td>${orderLine.quantity}</td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		
		<a href="/orders"><button type="button" class="btn btn-primary">Return</button></a>
		
	</div>
</body>
</html>