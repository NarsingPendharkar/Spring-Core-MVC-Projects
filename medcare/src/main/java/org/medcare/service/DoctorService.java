package org.medcare.service;

import org.medcare.model.Doctor;
import org.springframework.http.ResponseEntity;

public interface DoctorService {
	
	//save doctor
	public ResponseEntity<String> saveDoctor(Doctor doctor);
	// delete doctor by id
	public ResponseEntity<String> deleteDoctorByid(int doc_Id);
}
