package edu.mum.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.HelperClass;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.User;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;
	@Autowired
	PersonService servicePerson;
		
			
	@RequestMapping(value="/users/create")
	public String create() 
	{
		return "signUp";
	}
	
	@RequestMapping(value="/users/create", method=RequestMethod.POST)
	public String create(@RequestParam("email") String email,
						 @RequestParam("password") String password,
						 @RequestParam("user") String user) 
	{
						
			//Creates the user
		User objUser = new User();
		objUser.setEmail(email);
		objUser.setEnable(true);
		objUser.setRol("USER");
		objUser.setPassword(password);
		objUser.setUser(user);		
		service.saveUser(objUser);		
		//Creates the person
		Person p = new Person();
		p.setEmail(email);	
		p.setEnable(true);
		servicePerson.savePerson(p);
			
		return "redirect:/login";
	}
	
	@RequestMapping(value="/users/update", method=RequestMethod.POST)
	public String update(Person item,@RequestParam("city") String city,
			@RequestParam("country") String country,@RequestParam("state") String state,
			@RequestParam("zipcode") String zipcode,@RequestParam("idAddress") String idAddress,
			@RequestParam("user") String user,@RequestParam("password") String password) 
	{
		if(item != null)
		{				
			int id = 0;
			if(!idAddress.isEmpty())
				id = Integer.valueOf(idAddress);
			Address a = new Address(id,city,country,state,zipcode);
			item.setAddress(a);
			servicePerson.savePerson(item);

			// User
			User u = new User();
			u.setEmail(item.getEmail());
			u.setUser(user);
			u.setPassword(password);
			service.saveUser(u);
		}		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/users/update2", method=RequestMethod.POST)
	public String update2(HelperClass item) 
	{
		if(item != null)
		{				
			service.saveUser(item.getUser());
			servicePerson.savePerson(item.getPerson());
		}		
		return "redirect:/home";
	}
	
	
}
