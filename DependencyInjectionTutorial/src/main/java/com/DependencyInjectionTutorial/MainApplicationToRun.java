package com.DependencyInjectionTutorial;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApplicationToRun 
{
	public static void main(String[] args) {
        // 1️ Create IOC container using XML-based configuration
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

        // Retrieve beans from XML configuration (setter-based and constructor-based)
        Person p = (Person) context.getBean("setterbased");
        System.err.println("XML Configuration (Setter-based Bean): " + p);

        Person p2 = (Person) context.getBean("constructorbased");
        System.err.println("XML Configuration (Constructor-based Bean): " + p2);

        // 2️ Annotation-based configuration
        ApplicationContext annotationContext = new AnnotationConfigApplicationContext(PersonAnnotationBasedConfig.class);
        
        // Retrieve bean from @Component-based configuration
        PersonAnnotationBasedConfig annotatedBean = (PersonAnnotationBasedConfig) annotationContext.getBean("personbean");
        System.out.println("Annotation-based Configuration: " + annotatedBean);

        // 3️⃣ Java-based configuration
        ApplicationContext javaContext = new AnnotationConfigApplicationContext(PersonJavaBasedConfig.class);
        
        // Retrieve beans from Java-based configuration
        Person javaPerson1 = (Person) javaContext.getBean("constructorBasedPerson");
        System.out.println("Java-based Configuration (Constructor-based Bean): " + javaPerson1);

        Person javaPerson2 = (Person) javaContext.getBean("setterBasedPerson");
        System.out.println("Java-based Configuration (Setter-based Bean): " + javaPerson2);
    }
}
