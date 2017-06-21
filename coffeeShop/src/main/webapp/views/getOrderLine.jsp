<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Detail</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../resources/styles.css">

</head>
<body>
	<div class="detailsContainer">
	
		<h1>Order Lines </h1>	
		
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