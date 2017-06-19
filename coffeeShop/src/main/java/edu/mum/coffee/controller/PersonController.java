package edu.mum.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	PersonService service;
		
	@RequestMapping(value="/persons")
	public String selectAll(Model model) {
		model.addAttribute("persons", service.getAll());
		return "personList";
	}	
	
	@RequestMapping(value="/persons/update", method=RequestMethod.GET)
	public String setUpdate(Model model,int id) {
		if(id!=0)
			model.addAttribute("person", service.findById((long)id));
		else
			model.addAttribute("person", new Person());
		return "personDetail";
	}
	
	@RequestMapping(value="/persons/update", method=RequestMethod.POST)
	public String update(Person item,@RequestParam("city") String city,
			@RequestParam("country") String country,@RequestParam("state") String state,
			@RequestParam("zipcode") String zipcode,@RequestParam("idAddress") String idAddress) 
	{
		if(item != null)
		{
			int id = 0;
			if(!idAddress.isEmpty())
				id = Integer.valueOf(idAddress);
			Address a = new Address(id,city,country,state,zipcode);
			item.setAddress(a);
			service.savePerson(item);			
		}		
		return "redirect:/persons";
	}
	
	@RequestMapping(value="/persons/delete", method=RequestMethod.POST)
	public String remove(int id) {
		Person p = service.findById((long)id);
		service.removePerson(p);
		return "redirect:/persons";
	}
	
}
