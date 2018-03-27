package pl.fudalewski.ATR.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Reservation {
		
	
		@Id
		@GeneratedValue
		private Long id;

		private String startLocationR;
		private String destinationR;
		private int numberOfPeple;
		private Date dateAndTimeOfService;
		
		private String firstName;
		private String lastName;
		private String phone;
		private String email;
		
		
		public String getStartLocationR() {
			return startLocationR;
		}
		public void setStartLocationR(String startLocationR) {
			this.startLocationR = startLocationR;
		}
		public String getDestinationR() {
			return destinationR;
		}
		public void setDestinationR(String destinationR) {
			this.destinationR = destinationR;
		}
		public int getNumberOfPeple() {
			return numberOfPeple;
		}
		public void setNumberOfPeple(int numberOfPeple) {
			this.numberOfPeple = numberOfPeple;
		}
		public Date getDateAndTimeOfService() {
			return dateAndTimeOfService;
		}
		public void setDateAndTimeOfService(Date dateAndTimeOfService) {
			this.dateAndTimeOfService = dateAndTimeOfService;
		}
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
	
	
		
		
	}
