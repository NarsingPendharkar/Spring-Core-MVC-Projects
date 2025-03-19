package com.task.Exceptions;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	// Exception handler method to catch InvalidUserException
		@ExceptionHandler(InvalidUserException.class)
		public String handleInvalidUserException(InvalidUserException ex, Model model) {
		    model.addAttribute("message", ex.getMessage());
		    return "Login";
		}
		
		public String usernamealready(UsernamealreadyException uex,Model model) {
			 model.addAttribute("message", uex.getMessage());
			 return "Register";
		}

}
