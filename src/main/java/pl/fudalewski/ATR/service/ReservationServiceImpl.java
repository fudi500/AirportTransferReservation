package pl.fudalewski.ATR.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.fudalewski.ATR.dao.ReservationDAO;
import pl.fudalewski.ATR.dto.SimpleDestinationDTO;
import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.Reservation;
import pl.fudalewski.ATR.model.StartLocation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;

	@Autowired
	StartLocationService startLocationService;

	@Autowired
	DestinationService destinationService;

	@Transactional
	public Reservation create(Reservation reservation) {
		return reservationDAO.save(reservation);
	}

	@Transactional
	public void delete(Reservation reservation) {
		reservationDAO.delete(reservation);
	}

	@Transactional
	public Iterable<Reservation> findAll() {
		return reservationDAO.findAll();
	}

	@Transactional
	public Reservation findById(Long id) {
		return reservationDAO.findById(id).orElse(null);
	}

	public Map<String, String> CreateLocalizationList() {
		return startLocationService.CreateLocalizationList();
	}

	public Map<String, String> CreateDestinationList() {

		return destinationService.CreateDestinationList();
	}

	public List<SimpleDestinationDTO> CreateDestinationAndStartlocationList() {

		List<SimpleDestinationDTO> list = new ArrayList<>();

			
			for (Destination destination : destinationService.findAll()) {

				SimpleDestinationDTO simpleDestinationDTO = new SimpleDestinationDTO();
				simpleDestinationDTO.setLocalizationID(destination.getStartLocation().getId().toString());
				simpleDestinationDTO.setDestinationName(destination.getDestinationName());
				simpleDestinationDTO.setDestinationID(destination.getId().toString());
				list.add(simpleDestinationDTO);
			}
			
		

		return list;
	}

	@Override
	public Destination findDestinationByID(Long id) {
		return destinationService.findById(id);
	}

	@Override
	public StartLocation findStartLocationByID(Long id) {
		return startLocationService.findById(id);
	}
}
