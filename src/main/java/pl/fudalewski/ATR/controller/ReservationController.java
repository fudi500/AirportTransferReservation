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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.fudalewski.ATR.dto.DestinationDTO;
import pl.fudalewski.ATR.dto.SimpleDestinationDTO;
import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.Reservation;
import pl.fudalewski.ATR.model.StartLocation;
import pl.fudalewski.ATR.service.ReservationService;
import pl.fudalewski.ATR.service.StartLocationService;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String formularz(@ModelAttribute("reservationForm") Reservation reservation, Model model) {

		model.addAttribute("localizationList", reservationService.CreateLocalizationList());

		model.addAttribute("DLlist", reservationService.CreateDestinationAndStartlocationList());
		// model.addAttribute("DLlist", simpleDestinationDTOs);

		return "reservationform";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String obslurzFormularz(@ModelAttribute("reservationForm") @Valid Reservation reservationForm,
			BindingResult result, Model model) {

		model.addAttribute("localizationList", reservationService.CreateLocalizationList());

		model.addAttribute("DLlist", reservationService.CreateDestinationAndStartlocationList());

		if (result.hasErrors()) {
			// formularz nie jest uzupełniony prawidłowo
			return "reservationform";
		} else {
			// zamiana id startlocation na nazwę
		/*	reservationForm.setStartLocationR(reservationService
					.findStartLocationByID(Long.parseLong(reservationForm.getStartLocationR())).getName());

			// zamiana id destination na nazwę
			reservationForm.setDestinationR(reservationService
					.findDestinationByID(Long.parseLong(reservationForm.getDestinationR())).getDestinationName());
*/
			reservationService.create(reservationForm);
			model.addAttribute("reservation", reservationForm);
			return "success";

		}

	}

}
