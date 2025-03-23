package org.springdata.Service;

import org.springdata.Entity.Patient;
import org.springdata.Repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PatientService {
		@Autowired
		private PatientRepository patientRepository;
		
		public void save (Patient patient) {
			patientRepository.save(patient);
		}

}
