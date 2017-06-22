<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<script type="text/javascript" src="../resources/scripts.js"></script>


</head>
<body>
	<div class="detailsContainer">
	
		<h1>Order Detail </h1>	
		
						
			<p><label>Order Date:</label></p>
			<p id="txt_Date">
				<%= new java.text.SimpleDateFormat("MM/dd/yyyy").format(new java.util.Date()) %>
			</p>
					
			<p><label>Person:</label></p>		
			<span>
				<label>${user.firstName} </label><label>${user.lastName} </label>	
			</span>
			
			<hr/>
			
			<h2><b>Order Lines</b></h2>	
			
			<p>
				<label>Products:</label>
				<select id="list_Products"  multiple class="form-control selectClass"></select>
			</p>		
			<p>
				<label>Product:</label>
				<select id="ddl_Products" class="form-control selectClass" name="product">
				  <c:forEach var="p" items="${products}">
				  	<option value="${p.id}">${p.productName}</option>
				  </c:forEach>
				  <c:forEach var="p" items="${products}">
				  	<input id="${p.id}_name" value="${p.productName}" type="hidden" />
				  	<input id="${p.id}_price" value="${p.price}" type="hidden" />
				  	<input id="${p.id}_type" value="${p.productType}" type="hidden" />
				  	<input id="${p.id}_description" value="${p.description}" type="hidden" />
				  </c:forEach>
				</select>
				<label>Quantity:</label>
				<input id="txt_Quantity" type="number" min="1" max="20" >
				<label id="error_1" class="redAlert"></label>	
			</p>			
			
			<span>
				 <button id="btn_Add" class="btn btn-primary">Add</button>
				 <button id="btn_Remove" class="btn btn-danger">Remove All</button>
			</span>			
					
			<hr/>
			
			<button id="btn_Save" class="btn btn-success">Create</button>
			<input id="hiddenField" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	</div>
</body>
</html>