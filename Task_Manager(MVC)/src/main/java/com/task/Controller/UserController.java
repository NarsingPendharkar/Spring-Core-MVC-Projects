package com.task.Controller;

import java.sql.SQLException;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.task.Exceptions.InvalidUserException;
import com.task.Exceptions.UsernamealreadyException;
import com.task.Model.User;
import com.task.Service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("loggedUser")
@RequestMapping("/user")

public class UserController {
 private static final BCryptPasswordEncoder passEncoder=new BCryptPasswordEncoder();
	private static final Logger logger = LoggerFactory.getLogger("UserController.java");
	@Autowired
	private UserService userService;

	@PostMapping("saveUser")
	public String saveUser(@Validated @ModelAttribute User user, BindingResult result, Model model)
			throws InvalidUserException, SQLException, UsernamealreadyException {
		if (result.hasErrors()) {
			model.addAttribute("message", "Invalid user details. Please check the form");
			return "Register";
		}
		try {
			String codePass=passEncoder.encode(user.getPassword());
			user.setPassword(codePass);
			userService.saveUser(user);
			model.addAttribute("message", "User Registration successful");
			return "redirect:/loginPage";
		} catch (Exception e) {
			logger.error("Error saving user", e);
			model.addAttribute("message", "An error occurred. Please try again.");
			return "Register";
		}

	}

	@PostMapping("authenticateUser")
	public String authenticateUser(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) {
		try {
			User user = userService.userByname(username).get();
			System.out.println(user.toString());
			if (user != null && username.equals(user.getUsername()) && passEncoder.matches(password,  user.getPassword())) {
				session.setAttribute("loggedUser", user);
				return "Dashboard";
			}
		} catch (Exception e) {
			logger.error("Authentication failed", e);
		}
		redirectAttributes.addFlashAttribute("message", "Invalid credentials");
		return "redirect:loginPage";
	}

	@GetMapping("/checkUsername")
	public ResponseEntity<String> checkUsername(@RequestParam("username") String username) {
		User exists = userService.userByname(username).get();
		if (exists!=null) {
			return ResponseEntity.ok("exists"); // Returning a text response
		} else {
			return ResponseEntity.ok("not-exists");
		}
	}
	
	

	
}
