package pl.fudalewski.ATR.service;


import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.StartLocation;

public interface DestinationService {

	public void create(Long startLocationID, Destination destination);
    public void delete(StartLocation startLocation, Destination destination) ;//throws KotNotFound;
    public Iterable<Destination> findAllwhereStartLocation(StartLocation startLocation);
    //public StartLocation update(StartLocation startLocation) ;//throws KotNotFound;
    public Destination findById(Long id);
	public Iterable<Destination> findAll();
	
	
}
