package org.medcare.serviceImpl;

import org.medcare.model.Doctor;
import org.medcare.repository.DoctorRepository;
import org.medcare.service.DoctorService;
import org.slf4j.helpers.ThreadLocalMapOfStacks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class DoctoServiceImpl implements DoctorService{

	@Autowired
	private DoctorRepository doctorRepository;
	@Override
	public ResponseEntity<String> saveDoctor(Doctor doctor) {
		try {
			doctorRepository.save(doctor);
		} catch (Exception e) {
			return new ResponseEntity("doctor not saved ",HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity("Doctor saved ", HttpStatus.OK);
	}

	@Override
	public ResponseEntity<String> deleteDoctorByid(int doc_Id) {
		// TODO Auto-generated method stub
		return null;
	}

}
