package com.DependencyInjectionTutorial;

public class Person {
	
	private String name;
	private int age;
	private String surname;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	
	
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Person(String name, int age, String surname) {
		super();
		this.name = name;
		this.age = age;
		this.surname = surname;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Person [name=");
		builder.append(name);
		builder.append(", age=");
		builder.append(age);
		builder.append(", surname=");
		builder.append(surname);
		builder.append("]");
		return builder.toString();
	}

	

}
