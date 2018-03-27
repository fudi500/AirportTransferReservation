package pl.fudalewski.ATR.model;

import java.util.HashSet;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotEmpty;

@Entity
public class StartLocation {
	
	@Id
	@GeneratedValue
	private Long id;
	
	@NotEmpty
	private String name;


	@OneToMany(mappedBy="startlocation", cascade= CascadeType.ALL, fetch = FetchType.LAZY)
	private Set <Destination> destinations = new HashSet<>();

	

	public Set<Destination> getDestinations() {
		return destinations;
	}

	public void setDestinations(Set<Destination> destinations) {
		this.destinations = destinations;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
}
