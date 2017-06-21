<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Products</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../resources/styles.css">

</head>
<body>
	<div class="containerList">
	
		<div>
			<div>
			<label>
				<a href="/persons/"><button type="button" class="btn btn-primary">PERSONS</button></a>
			</label>
			<label>
				<a href="/products/"><button type="button" class="btn btn-primary">PRODUCTS</button></a>
			</label>		
			<label>
				<a href="/orders/"><button type="button" class="btn btn-primary">ORDERS</button></a>
			</label>		
		</div>	
		</div>
		<h1>List of Products</h1>
	
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