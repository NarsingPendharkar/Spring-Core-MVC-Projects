package org.springdata.Entity;

import java.util.concurrent.atomic.AtomicLong;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.SequenceGenerator;

@Entity
public class Patient {
	@Id
	@Column(unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
		private Long patientId;  // custom id
	    private String name;
	    private String disease;
		public Long getPatientId() {
			return patientId;
		}
		public void setPatientId(Long patientId) {
			this.patientId = patientId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDisease() {
			return disease;
		}
		public void setDisease(String disease) {
			this.disease = disease;
		}
		
		public Patient(Long patientId, String name, String disease) {
			super();
			this.patientId = patientId;
			this.name = name;
			this.disease = disease;
		}
		public Patient() {
			super();
			// TODO Auto-generated constructor stub
		}
	    
	 
	    

	

}
