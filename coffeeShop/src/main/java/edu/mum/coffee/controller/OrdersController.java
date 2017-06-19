package edu.mum.coffee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Orderline;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;

@Controller
public class OrdersController {

	@Autowired
	OrderService service;
	@Autowired
	PersonService personService;
		
	@RequestMapping(value="/orders")
	public String selectAll(Model model) {
		model.addAttribute("orders", service.findAll());
		return "orderList";
	}	
	
	@RequestMapping(value="/orders/update", method=RequestMethod.GET)
	public String setUpdate(HttpServletRequest request, Model model,int id) {
		if(id!=0)
			model.addAttribute("order", service.findById(id));
		else
			model.addAttribute("order", new Order());	
		//must be the user in session
		model.addAttribute("user", personService.findById(3L));	
		return "orderDetail";
	}
	
	@RequestMapping(value="/orders/update", method=RequestMethod.POST)
	public String update(Order item) 
	{
		if(item != null)
		{
			service.save(item);			
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
		return "orderlineList";
	}
	
	
	
}
