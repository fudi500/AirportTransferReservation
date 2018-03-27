package pl.fudalewski.ATR.service;

import pl.fudalewski.ATR.model.Reservation;

public interface ReservationService {

	public Reservation create(Reservation reservation);
	public void delete(Reservation reservation);
	public Iterable<Reservation> findAll();
	public Reservation findById(Long id);
}
