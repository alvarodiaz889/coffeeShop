package edu.mum.coffee.ws;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@RestController
public class PersonWS {
	
	@Autowired
	PersonService service;
		
	@RequestMapping(value="/personsWS")
	public List<Person> selectAll(Model model) {		
		return service.getAll();
	}	
			
	@RequestMapping(value="/personsWS/update", method=RequestMethod.POST)
	public String update(Person item,@RequestParam("city") String city,
			@RequestParam("country") String country,@RequestParam("state") String state,
			@RequestParam("zipcode") String zipcode,@RequestParam("idAddress") String idAddress) 
	{
		try{
			
			if(item != null)
			{
				int id = 0;
				if(!idAddress.isEmpty())
					id = Integer.valueOf(idAddress);
				Address a = new Address(id,city,country,state,zipcode);
				item.setAddress(a);
				service.savePerson(item);			
			}
			
		}catch(Exception ex)
		{
			return "01";
		}
			
		return "00";
	}
	
	@RequestMapping(value="/personsWS/delete", method=RequestMethod.POST)
	public String remove(@RequestParam("id") String id) {
		
		try{
			Person p = service.findById(Long.valueOf(id));
			service.removePerson(p);
		}
		catch(Exception ex)
		{
			return "01";
		}
		
		return "00";
	}

}
