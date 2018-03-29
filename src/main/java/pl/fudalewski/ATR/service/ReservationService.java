package pl.fudalewski.ATR.service;

import java.util.List;
import java.util.Map;

import pl.fudalewski.ATR.dto.SimpleDestinationDTO;
import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.Reservation;
import pl.fudalewski.ATR.model.StartLocation;

public interface ReservationService {

	public Reservation create(Reservation reservation);
	public void delete(Reservation reservation);
	public Iterable<Reservation> findAll();
	public Reservation findById(Long id);
	
	
	public Map<String, String> CreateLocalizationList();
	public Map<String, String> CreateDestinationList();
	public List<SimpleDestinationDTO> CreateDestinationAndStartlocationList();
	
	public Destination findDestinationByID(Long id);
	public StartLocation findStartLocationByID(Long id);
	
}
