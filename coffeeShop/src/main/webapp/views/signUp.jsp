<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person Detail</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/styles.css">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please sign in</h3>
					</div>
					<div class="panel-body">
						<form action="/users/create" method="post" class="form-horizontal">
							
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="id" value="0"/>
				
							<div class="input-group input-sm">
								<label class="input-group-addon" for="email"><i class="fa fa-user"></i>
								</label>
								<input type="email" class="form-control" id="email" name="email" placeholder="Enter Email" required>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="user"><i class="fa fa-user"></i>
								</label>
								<input type="text" class="form-control" id="user" name="user" placeholder="Enter Username" required>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="password"><i class="fa fa-user"></i>
								</label>
								<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="passwordConfirm"><i class="fa fa-user"></i>
								</label>
								<input type="password" class="form-control" id="passwordConfirm" placeholder="Confirm Password" required>
							</div>
							<div class="form-actions">
								<input type="submit" class="btn btn-block btn-primary btn-default" value="Sign Up">
							</div>
							
						</form>		
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>