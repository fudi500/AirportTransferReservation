package pl.fudalewski.ATR.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.fudalewski.ATR.dao.ReservationDAO;
import pl.fudalewski.ATR.model.Reservation;
import pl.fudalewski.ATR.model.StartLocation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;
	
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

	
	
}
