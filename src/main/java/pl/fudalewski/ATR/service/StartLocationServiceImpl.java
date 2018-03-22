package pl.fudalewski.ATR.service;

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


	
}
