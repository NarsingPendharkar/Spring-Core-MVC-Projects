package com.springtutorial;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        
        ApplicationContext context=new ClassPathXmlApplicationContext("bean.xml");
        Student st=(Student) context.getBean("stdbean");
        
        
        st.display();
    }
   
   
    
}
