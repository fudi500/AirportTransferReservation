package pl.fudalewski.ATR.service;


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

	@Override
	public Iterable<Destination> findAllwhereStartLocation(StartLocation startLocation) {
		// TODO Auto-generated method stub
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

}
