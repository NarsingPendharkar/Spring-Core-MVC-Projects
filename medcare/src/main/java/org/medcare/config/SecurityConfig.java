package org.medcare.config;

import org.medcare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	private UserService userService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable())
				.authorizeHttpRequests(auth -> auth
						.requestMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
						.requestMatchers("/user/**").hasAuthority("ROLE_USER")
						.requestMatchers("/doctor/**").hasAuthority("ROLE_DOCTOR")
						.requestMatchers("/home", "/login", "/register").permitAll()
						.anyRequest().authenticated())
				.formLogin(login -> 
				login.loginPage("/login") // Keep it consistent with form action
						  .loginProcessingUrl("/login") // Ensure it's the same as the form action
						  .defaultSuccessUrl("/dashboard", true).permitAll())
				.logout(logout ->
				logout.logoutUrl("/logout") // Make it consistent
						.logoutSuccessUrl("/login").permitAll())
				.exceptionHandling(
						exception -> exception.authenticationEntryPoint((request, response, authException) -> {
							response.sendRedirect("/login"); // Redirect to login page instead of /error
						}));

		return http.build();
	}

	@Bean
	public AuthenticationManager authenticationManager() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userService);
		authProvider.setPasswordEncoder(passwordEncoder());
		return new ProviderManager(authProvider);
	}
}
