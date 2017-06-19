package edu.mum.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService service;
		
	@RequestMapping(value="/products")
	public String selectAll(Model model) {
		model.addAttribute("products", service.getAll() );
		return "productList";
	}	
	
	@RequestMapping(value="/products/update", method=RequestMethod.GET)
	public String setUpdate(Model model,int id) {
		if(id!=0)
			model.addAttribute("product", service.findById(id));
		else
			model.addAttribute("product", new Product());
		model.addAttribute("products", ProductType.values());
		return "productDetail";
	}
	
	@RequestMapping(value="/products/update", method=RequestMethod.POST)
	public String update(Product item) 
	{
		if(item != null)
		{
			//item.setProductType(ProductType.valueOf(product));
			service.save(item);			
		}		
		return "redirect:/products";
	}
	
	@RequestMapping(value="/products/delete", method=RequestMethod.POST)
	public String remove(int id) {
		Product p = service.findById(id);
		service.delete(p);
		return "redirect:/products";
	}
	
}
