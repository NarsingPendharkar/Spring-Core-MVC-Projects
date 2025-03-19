package com.task.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())  // Disable CSRF for testing, enable in production
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/Task_Manager/admin/**").hasAuthority("ROLE_ADMIN")
                .requestMatchers("/Task_Manager/user/**").hasAuthority("ROLE_USER")
                .requestMatchers("/Task_Manager/tasks/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
                .requestMatchers("/Task_Manager/loginPage", "/Task_Manager/registerPage").permitAll()
                .anyRequest().authenticated()
            )
            .formLogin(login -> login
                .loginPage("/Task_Manager/loginPage")  // This should be your actual login page
                .loginProcessingUrl("/Task_Manager/login") // The form action should point here
                .defaultSuccessUrl("/Task_Manager/dashboard", true)
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/Task_Manager/logout")
                .logoutSuccessUrl("/Task_Manager/loginPage")
                .permitAll()
            );

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return new ProviderManager(authProvider);
    }
}
