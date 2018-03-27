package pl.fudalewski.ATR.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		}
	}

	@RequestMapping("/delete-{id}")
	public String deleteStartLocation(@PathVariable("id") Long id, Model model) {

		startLocationService.delete(startLocationService.findById(id));
		return "redirect:/admin";
	}

	@RequestMapping(value = "/poloczenia/add", method = RequestMethod.GET)
	public String formularz(@ModelAttribute("destinationForm") DestinationDTO destinationDTO, Model model) {

		//
		Map<String, String> localizationList = CreateLocalizationList();

		model.addAttribute("localizationList", localizationList);
		return "destinationform";
	}

	@RequestMapping(value = "/poloczenia/add", method = RequestMethod.POST)
	public String obsluzFormularz(@ModelAttribute("destinationForm") @Valid DestinationDTO destinationDTO,
			BindingResult result) {

		Destination destination = new Destination();

		return SaveOrEdit(destinationDTO, result, destination);
	}

	@RequestMapping(value = "/poloczenia/{id}/edit", method = RequestMethod.GET)
	public String editDestination(@PathVariable("id") Long id,
			@ModelAttribute("destinationForm") DestinationDTO destinationDTO, Model model) {

		Destination destination = destinationService.findById(id);

		destinationDTO.setDestinationName(destination.getDestinationName());
		destinationDTO.setPrice1to3(destination.getPrice1to3());
		destinationDTO.setPrice4to8(destination.getPrice4to8());
		destinationDTO.setPrice9to16(destination.getPrice9to16());
		destinationDTO.setPrice17to40(destination.getPrice17to40());
		destinationDTO.setId(destination.getId());
		destinationDTO.setLocalizationID(destination.getStartLocation().getId());

		Map<String, String> localizationList = CreateLocalizationList();
		model.addAttribute("localizationList", localizationList);

		return "destinationform";
	}

	@RequestMapping(value = "/poloczenia/{id}/edit", method = RequestMethod.POST)
	public String editDestinationPost(@PathVariable("id") Long id,
			@ModelAttribute("destinationForm") @Valid DestinationDTO destinationDTO, BindingResult result) {

		Destination destination = destinationService.findById(id);
		return SaveOrEdit(destinationDTO, result, destination);

	}
	
	@RequestMapping("/poloczenia/{id}/delete")
	public String deletedestination(@PathVariable("id") Long id) {

		destinationService.delete(destinationService.findById(id));
		
		return "redirect:/admin";
	}

	private String SaveOrEdit(@Valid DestinationDTO destinationDTO, BindingResult result, Destination destination) {

		if (result.hasErrors()) {
			// formularz nie jest uzupełniony prawidłowo
			return "destinationform";
		} else {

			destination.setDestinationName(destinationDTO.getDestinationName());
			destination.setPrice1to3(destinationDTO.getPrice1to3());
			destination.setPrice4to8(destinationDTO.getPrice4to8());
			destination.setPrice9to16(destinationDTO.getPrice9to16());
			destination.setPrice17to40(destinationDTO.getPrice17to40());
			// -------------------------

			StartLocation startLocation;
			if (destination.getStartLocation() == null) {
				startLocation = startLocationService.findById(destinationDTO.getLocalizationID());
			} else {
				startLocation = startLocationService.findById(destinationDTO.getLocalizationID());

			}

			destination.setStartLocation(startLocation);
			destinationService.create(startLocation.getId(), destination);
			return "redirect:/admin";

			//
			// user.setFramework(new ArrayList<String>(Arrays.asList("Spring MVC", "GWT")));
			// user.setSkill(new ArrayList<String>(Arrays.asList("Spring", "Grails",
			// "Groovy")));
			// user.setCountry("SG");
			// user.setNumber(2);
			//
			// model.addAttribute("userForm", user);
			//
			// populateDefaultModel(model);
		}
	}

	private Map<String, String> CreateLocalizationList() {

		Map<String, String> localizationList = new LinkedHashMap<String, String>();

		for (StartLocation startLocation : startLocationService.findAll()) {

			localizationList.put(startLocation.getId().toString(), startLocation.getName());
		}

		return localizationList;
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
