package edu.mum.coffee.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.google.gson.Gson;
import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Orderline;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;
import edu.mum.coffee.utilities.Utility;

@Controller
public class OrdersController {

	@Autowired
	OrderService service;
	@Autowired
	PersonService personService;
	@Autowired
	ProductService productService;
		
	@RequestMapping(value="/orders")
	public String selectAll(Model model) {
		model.addAttribute("orders", service.findAll());
		return "orderList";
	}	
	
	@RequestMapping(value="/orders/create", method=RequestMethod.GET)
	public String create(HttpServletRequest request, Model model) {
		model.addAttribute("products", productService.getAll());	
		//must be the user in session
		model.addAttribute("user", personService.findById(3L));	
		return "orderDetail";
	}
		
	@RequestMapping(value="/orders/save", method=RequestMethod.GET)
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
				return "redirect:/orders";
			}
			order.setPerson(personService.findById(3L));
			order.setOrderDate(Utility.getDate());			
			for(Orderline ol:order.getOrderLines())
				ol.setOrder(order);
			
			service.save(order);			
		}		
		return "redirect:/orders";
	}
	
	@RequestMapping(value="/orders/delete", method=RequestMethod.POST)
	public String remove(int id) {
		Order p = service.findById(id);
		service.delete(p);
		return "redirect:/orders";
	}
	
	@RequestMapping(value="/orders/getOrderLines")
	public String getOrderLines(Model model,int id) {
		List<Orderline> orderLines = null;
		Order order = null;
		try{
			order = service.findById(id);
			if(order.getOrderLines() != null)
			{
				orderLines = order.getOrderLines();
				model.addAttribute("orderLines", orderLines);				
			}
			
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		return "getOrderLine";
	}
	
	
	
}
