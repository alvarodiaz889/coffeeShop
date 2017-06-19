package edu.mum.coffee.ws;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

@RestController
public class ProductWS {

	@Autowired
	ProductService service;
		
	@RequestMapping(value="/productsWS")
	public List<Product> selectAll(Model model) {
		return service.getAll();		
	}	
		
	@RequestMapping(value="/productsWS/update", method=RequestMethod.POST)
	public String update(Product item) 
	{
		try{
			if(item != null)
			{
				service.save(item);			
			}
		}catch(Exception ex)
		{
			return "01";
		}				
		return "00";
	}
	
	@RequestMapping(value="/productsWS/delete", method=RequestMethod.POST)
	public String remove(@RequestParam("id") String id) {
		try{
			Product p = service.findById(Integer.valueOf(id));
			service.delete(p);
		}catch(Exception ex)
		{
			return "01";
		}
		
		return "00";
	}
	
}
