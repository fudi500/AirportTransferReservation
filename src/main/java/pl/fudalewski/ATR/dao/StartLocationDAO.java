package pl.fudalewski.ATR.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.fudalewski.ATR.model.StartLocation;

@Repository
public interface StartLocationDAO extends CrudRepository<StartLocation, Long> {

}
