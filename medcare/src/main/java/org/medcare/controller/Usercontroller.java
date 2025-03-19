package org.medcare.controller;

import org.medcare.model.User;
import org.medcare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.annotation.Generated;

@Controller
@RequestMapping("/user")
public class Usercontroller {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private UserService service;
	
	
	

}
