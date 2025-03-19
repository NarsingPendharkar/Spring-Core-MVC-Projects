package com.DependencyInjectionTutorial;

import org.springframework.stereotype.Component;

@Component("personbean")
public class PersonAnnotationBasedConfig {
	private String name;
	private int age;
	private String surname;

	PersonAnnotationBasedConfig() {
		this.age = 2;
		this.name = "Annotation based";
		this.surname = "Configuration";
	}

	public PersonAnnotationBasedConfig(String name, int age, String surname) {
		super();
		this.name = name;
		this.age = age;
		this.surname = surname;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", surname=" + surname + "]";
	}
}
