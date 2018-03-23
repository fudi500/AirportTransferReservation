package pl.fudalewski.ATR.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.fudalewski.ATR.dto.StartLocationDTO;
import pl.fudalewski.ATR.model.StartLocation;
import pl.fudalewski.ATR.service.StartLocationService;

@Controller
public class AdminPanelController {

	@Autowired
	StartLocationService startLocationService;

	@RequestMapping("/admin")
	public String showStartlocations(Model model,
			@ModelAttribute("startlocation") @Valid StartLocation formLolalizacja, BindingResult result) {

		model.addAttribute("startlocations", startLocationService.findAll());

		if (result.hasErrors()) {
			// formularz nie jest uzupełniony prawidłowo
			return "adminpanel";
		} else {

			startLocationService.create(formLolalizacja);

			return "redirect:/admin";
		} // admin - < link
	}

	@RequestMapping("/delete-{id}")
	public String deleteKot(@PathVariable("id") Long id, Model model) {

		startLocationService.delete(startLocationService.findById(id));
		return "redirect:/admin";

	}
}