package pl.fudalewski.ATR.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.StartLocation;

public interface DestinationService {

	
	
	public void create(Long startLocationID, Destination destination);
    public void delete(Destination destination) ;//throws KotNotFound;
  
    public List<Destination> findByStartlocation(StartLocation startLocation);
    //public StartLocation update(StartLocation startLocation) ;//throws KotNotFound;
    public Destination findById(Long id);
	public Iterable<Destination> findAll();
	public Map<String, String> CreateDestinationList();
	
	

	
	
}
