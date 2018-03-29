package pl.fudalewski.ATR.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.fudalewski.ATR.model.Destination;
import pl.fudalewski.ATR.model.StartLocation;

@Repository
public interface DestinationDAO extends CrudRepository<Destination, Long> {

	void findByStartlocation(StartLocation startLocation);

}
