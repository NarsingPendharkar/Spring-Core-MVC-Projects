package org.medcare.model;

import org.medcare.enums.AppointmentStatus;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "appointments")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Long doctorId; // Foreign Key
	private Long patientId; // Foreign Key
	private String gender;
	private int age;
	private String date;
	@Enumerated(EnumType.STRING)
	private AppointmentStatus status; // Scheduled, Completed, Canceled

	// Getters and Setters
}
