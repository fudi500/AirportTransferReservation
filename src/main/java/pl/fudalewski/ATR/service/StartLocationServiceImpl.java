package pl.fudalewski.ATR.service;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.fudalewski.ATR.dao.StartLocationDAO;
import pl.fudalewski.ATR.model.StartLocation;

@Service
public class StartLocationServiceImpl implements StartLocationService {

	@Autowired
	private StartLocationDAO startLocationDAO;

	
	@Transactional
	public StartLocation create(StartLocation startLocation) {
		
		return startLocationDAO.save(startLocation);
	}

	@Transactional
	public void delete(StartLocation startLocation) {
		
		startLocationDAO.delete(startLocation);
	}

	@Transactional
	public Iterable<StartLocation> findAll() {
		
		return startLocationDAO.findAll();
	}

	@Transactional
	public StartLocation findById(Long id) {
		
		return startLocationDAO.findById(id).orElse(null);
	}

	public Map<String, String> CreateLocalizationList() {

		Map<String, String> localizationList = new LinkedHashMap<String, String>();

		for (StartLocation startLocation : findAll()) {

			localizationList.put(startLocation.getId().toString(), startLocation.getName());
		}
		

		return localizationList;
	}

	
}
