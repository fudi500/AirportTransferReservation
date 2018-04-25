package pl.fudalewski.ATR.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
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
		@Range(min=1, max=100)
		private int numberOfPeple;
		
		private double price;
		
		
		@Future
		@DateTimeFormat(pattern = "dd/MM/yyyy")
		@Temporal(TemporalType.DATE)
		private Date dateReservation;
		
		@DateTimeFormat(pattern = "HH:mm")
		@Temporal(TemporalType.TIME)
		private Date timeReservation;
		
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
		public Date getDateReservation() {
			return dateReservation;
		}
		public void setDateReservation(Date dateReservation) {
			this.dateReservation = dateReservation;
		}
		public Date getTimeReservation() {
			return timeReservation;
		}
		public void setTimeReservation(Date timeReservation) {
			this.timeReservation = timeReservation;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
	
	
		
		
	}
