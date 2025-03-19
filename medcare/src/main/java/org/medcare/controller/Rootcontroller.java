package org.medcare.controller;

import org.medcare.model.User;
import org.medcare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Rootcontroller {
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private UserService service;
	
	@GetMapping ("/home")
    public String homePage() {
        return "dashboard";
    }
	
	@GetMapping ("/dashboard")
    public ModelAndView dashboardPage(ModelAndView model) {
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		 model.setViewName("dashboard");
		 model.addObject("username", auth.getName());
		 model.addObject("role", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
        return model;
    }
	
	@GetMapping("/admin/saveuser")
	private String saveUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		service.saveUser(user);
		return "login";
	}
	
	@GetMapping("/login")
    public String showLoginPage() {
        return "login"; // This maps to login.jsp
    }
	@GetMapping("/logout")
    public String logoutPage() {
        return "redirect:login";
    }
	
	@GetMapping("/register")
    public String registerPage() {
        return "register";
    }
	
	@GetMapping("admin/manage-doctors")
	   public String manageDoctors() {
        return "register";
    }
}
