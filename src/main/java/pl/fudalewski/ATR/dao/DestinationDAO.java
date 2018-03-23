package pl.fudalewski.ATR.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.fudalewski.ATR.model.Destination;

@Repository
public interface DestinationDAO extends CrudRepository<Destination, Long> {

}
