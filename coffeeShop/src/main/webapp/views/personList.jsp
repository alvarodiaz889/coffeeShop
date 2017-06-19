<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Persons</title>

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
			<label>
				<a href="/persons/"><button type="button" class="btn btn-primary">PERSONS</button></a>
			</label>
			<label>
				<a href="/products/"><button type="button" class="btn btn-primary">PRODUCTS</button></a>
			</label>		
		</div>
		<h1>List of Persons</h1>
	
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