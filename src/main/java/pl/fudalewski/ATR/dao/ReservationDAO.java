package pl.fudalewski.ATR.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.fudalewski.ATR.model.Reservation;


@Repository
public interface ReservationDAO extends CrudRepository<Reservation, Long> {

}
