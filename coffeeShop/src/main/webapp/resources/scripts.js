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
				text  		: (name + ' (' + quantity + ')')
			})
							
			$("#list_Products").append(element);
			$("#txt_Quantity").val("");
			
		});
		
		$("#btn_Save").click(function()
		{			
			var data = [];
			var counter = 0;
			var jsonString = "";
			
			$("#list_Products").children().each(function()
			{
				var product = $(this).val().split(',');
				var objOrderLine;
				var objOrder;
				var csrfName = $("#hiddenField").attr("name");
				var csrfValue = $("#hiddenField").attr("value");
				
				var objProduct = {
						id			: product[0],
						productName	: product[1],
						price		: product[2],
						type		: product[3],
						description	: product[4]
					};
					
				orderLine = {
						id		:		0,
						product	:	objProduct,
						quantity:	product[5]
				}
						
				data[counter] = orderLine;
				counter++;
			});
			
						
			objOrder = {
				"id"			: 	"0",
				"orderLines"	:	data
			};
			
			jsonString = JSON.stringify(objOrder);
			
			if(counter > 0)
			{
				$.ajax("/ordersWS/save",{
					"type"			: "GET",
					"data"			: {
						"myData"	: 	jsonString
					}
				}).done(function(){setTimeout(getOrderList, 1500);})
				  .fail();	
			}
			
		});		
		
		$("#btn_Remove").click(function()
		{
			$("#list_Products").children().remove();			
		});
		
		function getOrderList()
		{			
			window.location = "/orders";
		}
		
	});
	