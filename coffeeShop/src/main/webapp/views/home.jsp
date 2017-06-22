<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HOME</title>
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
		         
		      
		      <li><a href="/login/">Log In</a></li>
		    </ul>
		  </div>
		</nav>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Welcome to Cafe Shop !!</h1>
			</div>
		</div>
		
	</section>
	
	<h3 class="header3">Our Products</h3>
	<div class="containerList">
			
		<table class="table table-striped myTable1">
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
					 
				</tr>
			</c:forEach>
			</tbody>
			
		</table>

	</div>	
</body>
</html>