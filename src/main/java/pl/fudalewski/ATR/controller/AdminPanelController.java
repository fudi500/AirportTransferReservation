package pl.fudalewski.ATR.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.fudalewski.ATR.dao.DestinationDAO;
import pl.fudalewski.ATR.dto.DestinationDTO;
import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.StartLocation;
import pl.fudalewski.ATR.service.DestinationService;
import pl.fudalewski.ATR.service.StartLocationService;

@Controller
public class AdminPanelController {

	@Autowired
	StartLocationService startLocationService;

	@Autowired
	DestinationService destinationService;

	@RequestMapping("/admin")
	public String showStartlocations(Model model, @ModelAttribute("startlocation") @Valid StartLocation formLolalizacja,
			BindingResult result) {

		model.addAttribute("startlocations", startLocationService.findAll());
		model.addAttribute("destinations", findAlldestinationDTO());

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

	@RequestMapping("/dodajp")
	public String dodajPoloczenie() {

		StartLocation startLocation = new StartLocation();
		startLocation.setName("Balice");

		startLocationService.create(startLocation);

		Destination destination = new Destination();
		destination.setDestinationName("Krakow");
		destination.setPrice17to40(20.5);

		destinationService.create(startLocation.getId(), destination);

		return "redirect:/admin";

	}

	@RequestMapping("/poloczenia")
	public String showPoloczenia(Model model) {

		model.addAttribute("destinations", findAlldestinationDTO());

		return "poloczenia";
	}

	public List<DestinationDTO> findAlldestinationDTO() {

		List<DestinationDTO> destinationsDTO = new ArrayList<>();
		for (Destination destination : destinationService.findAll()) {

			DestinationDTO destinationDTO = new DestinationDTO();
			destinationDTO.setDestinationName(destination.getDestinationName());
			destinationDTO.setId(destination.getId());
			destinationDTO.setPrice1to3(destination.getPrice1to3());
			destinationDTO.setPrice4to8(destination.getPrice4to8());
			destinationDTO.setPrice9to16(destination.getPrice9to16());
			destinationDTO.setPrice17to40(destination.getPrice17to40());
			destinationDTO.setLocalizationName(
					startLocationService.findById(destination.getStartLocation().getId()).getName());

			destinationsDTO.add(destinationDTO);

		}
		return destinationsDTO;
	}

}
