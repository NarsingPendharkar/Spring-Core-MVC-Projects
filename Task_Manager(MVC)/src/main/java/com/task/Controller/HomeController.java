package com.task.Controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@GetMapping("/loginPage")
	public String loginPage(Model model, HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "Login";
	}

	@GetMapping("/registerPage")
	public String registerPage() {
		return "Register";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/loginPage";
	}
	@GetMapping("/error")
    public String handleError() {
        return "redirect:/login"; // Redirect all errors to login page
    }

	
	@GetMapping("/dashboard")
	public String dashboradPage(HttpSession session) {
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		session.setAttribute("loggedUser", auth.getName());
		return "dashboard";
	}
}
