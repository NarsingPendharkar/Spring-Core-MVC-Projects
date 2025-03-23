package org.springdata.Repository;

import org.springdata.Entity.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository  extends JpaRepository<Patient, String>{

}
