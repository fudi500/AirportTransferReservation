package pl.fudalewski.ATR.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.fudalewski.ATR.service.StartLocationService;

@Controller
public class StartLocationController {
	
	@Autowired
	StartLocationService startLocationService;
	
	@RequestMapping("/startlocations")
	public String showStartlocations(Model model) {
		
		model.addAttribute("startlocations",startLocationService.findAll());
		
		return "startlocations";
		
	}

}
