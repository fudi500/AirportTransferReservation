package pl.fudalewski.ATR.service;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.fudalewski.ATR.dao.DestinationDAO;
import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.StartLocation;

@Service
public class DestinationServiceImpl implements DestinationService {

	@Autowired
	public StartLocationService startlocationService;
	
	@Autowired
	public DestinationDAO destinationDAO;
	
	@Transactional
	public void create(Long startLocationID, Destination destination) {
		
		StartLocation startLocation= startlocationService.findById(startLocationID);
		destination.setStartLocation(startLocation);
		startLocation.getDestinations().add(destination);
		
	}

	
	public void delete(Destination destination) {
		destinationDAO.delete(destination);
	}

	public List<Destination> findByStartlocation(StartLocation startLocation){
		destinationDAO.findByStartlocation(startLocation);
		
		return null;
	}

	@Override
	public Destination findById(Long id) {
		return destinationDAO.findById(id).orElse(null);
	}


	@Override
	public Iterable<Destination> findAll() {
		return destinationDAO.findAll();
	}


	@Override
	public Map<String, String> CreateDestinationList() {

		Map<String, String> destinationList = new LinkedHashMap<String, String>();

		for (Destination destination : findAll()) {

			destinationList.put(destination.getId().toString(), destination.getDestinationName());
		}

		return destinationList;
	}




}
