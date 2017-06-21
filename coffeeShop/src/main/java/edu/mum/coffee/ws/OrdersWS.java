package edu.mum.coffee.ws;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Orderline;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;
import edu.mum.coffee.utilities.Utility;

@RestController
public class OrdersWS {

	@Autowired
	OrderService service;
	@Autowired
	PersonService personService;
	@Autowired
	ProductService productService;
		
	@RequestMapping(value="/ordersWS")
	public List<Order> selectAll(Model model) {
		return service.findAll();		
	}	
			
	@RequestMapping(value="/ordersWS/save", method=RequestMethod.GET)
	public String save(@RequestParam("myData") String  myData) 
	{
		if(myData != null)
		{
			Gson json =new Gson();
			Order order = null;
			try{
				order = json.fromJson(myData, Order.class);
			}catch(Exception ex)
			{
				System.out.println(ex.getMessage());
				return "01";
			}
			order.setPerson(personService.findById(3L));
			order.setOrderDate(Utility.getDate());			
			for(Orderline ol:order.getOrderLines())
				ol.setOrder(order);
			
			service.save(order);			
		}		
		return "00";
	}
	
	@RequestMapping(value="/ordersWS/delete", method=RequestMethod.POST)
	public String remove(int id) {
		
		try{
			Order p = service.findById(id);
			service.delete(p);
		}
		catch(Exception ex)
		{
			return "01";
		}
		
		return "00";
	}
		
}
