package pl.fudalewski.ATR.service;

import java.util.Map;

import pl.fudalewski.ATR.model.StartLocation;

public interface StartLocationService {


	public StartLocation create(StartLocation startLocation);
    public void delete(StartLocation startLocation) ;//throws KotNotFound;
    public Iterable<StartLocation> findAll();
    //public StartLocation update(StartLocation startLocation) ;//throws KotNotFound;
    public StartLocation findById(Long id);
    
    
    public Map<String, String> CreateLocalizationList();
}
