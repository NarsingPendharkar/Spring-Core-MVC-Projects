package com.DependencyInjectionTutorial;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.DependencyInjectionTutorial")
public class PersonJavaBasedConfig {
	@Bean("constructorBasedPerson")
	public Person constructorBasedPerson() {
		Person person1 = new Person("JavaBased", 1, "Configuration Using constructor");
		return person1;
	}

	@Bean("setterBasedPerson")
	public Person setterBasedPerson() {
		Person person2 = new Person();
		person2.setAge(1);
		person2.setName("JavaBased");
		person2.setSurname("Configuration Using Setter Mathod");
		return person2;
	}
}
