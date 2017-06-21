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

<script type="text/javascript">

	$(function(){
		
		$("#btn_Add").click(function()
		{				
			$("#error_1").text("");
			var id = $("#ddl_Products").val();
			var name = $("#" + id + "_name").val();
			var price = $("#" + id + "_price").val();
			var type = $("#" + id + "_type").val();
			var description = $("#" + id + "_description").val();
			var quantity = $("#txt_Quantity").val();
			var valueProperty = id + ',' + name + ',' + price + ',' + type + ',' + description + ',' + quantity;
			
			if(quantity == '')
			{
				$("#error_1").text("Select the quantity");
				return;
			}
			
			var element = $("<option>",{
				value 		: valueProperty,
				text  		: name
			})
							
			$("#list_Products").append(element);
			$("#txt_Quantity").val("");
			
		});
		
		$("#btn_Save").click(function()
		{			
			var data[];
			$("#list_Products").children().each(function()
			{
				var product[] = $(this.val()).split(',');
				
				var obj = {
					id			: product[0],
					productName	: product[1],
					price		: product[2],
					type		: product[3],
					description	: product[4],
				};
				data += ;		
			});
			
			if(data.length > 0)
			{
				$.ajax("/orders/create",{
					"type":"POST",
					"data": { 
						"property": postId
						
					}
				}).done(function(a,b,c){saveLikeSuccess(a,b,c,postId);})
				  .fail(showError);	
			}
			
		});
		
		$("#btn_Remove").click(function()
		{
			$("#list_Products").children().remove();			
		});
		
	});
	
</script>


</head>
<body>
	<div class="detailsContainer">
	
		<h1>Order Detail </h1>	
		
						
			<p>Order Date:</p>
			<p>
				<%= new java.text.SimpleDateFormat("MM/dd/yyyy").format(new java.util.Date()) %>
			</p>
					
			<p>Person:</p>		
			<p>
				<label>${user.firstName} </label><label>${user.lastName} </label>	
			</p>
			
			<hr/>
			
			<h5>Order Lines </h5>	
			
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