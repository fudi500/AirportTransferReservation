package pl.fudalewski.ATR.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Reservation {
		
	
		@Id
		@GeneratedValue
		private Long id;

		@NotEmpty
		private String startLocationR;
		
		@NotEmpty
		private String destinationR;
		
		@NotNull
		private int numberOfPeple;
		
		private double price;
		
		
		@DateTimeFormat(pattern = "dd/MM/yyyy")
		private Date dateAndTimeOfService;
		
		
		@NotEmpty
		private String firstName;
		
		@NotEmpty
		private String lastName;
		
		@NotEmpty
		private String phone;
		
		@NotEmpty
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
