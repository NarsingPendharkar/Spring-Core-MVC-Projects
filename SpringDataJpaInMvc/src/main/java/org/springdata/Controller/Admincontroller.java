package org.springdata.Controller;

import org.springdata.Entity.Patient;
import org.springdata.Service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class Admincontroller {
	
	@Autowired
	private PatientService patientService;
	
	@GetMapping("/save")
	public ResponseEntity<?> homePage(@RequestBody Patient patient) {
		try {
			patientService.save(patient);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error in saving");
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(patient);
	}
	
	@GetMapping("/")
	public String home() {
		return "index";
	}

}
