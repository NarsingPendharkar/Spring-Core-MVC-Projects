package demo.JwtAuthImplementation;

import demo.JwtAuthImplementation.entity.JwtMethods;

public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        JwtMethods jwtMethods=new JwtMethods();
        System.out.println("Generated Token: \n"+jwtMethods.generateToken("narsing"));
    String username=    jwtMethods.extractUser(jwtMethods.generateToken("narsing"));
        System.out.println(username);
        System.out.println(jwtMethods.validateToken(jwtMethods.generateToken("narsing")));
    }
    
    
}
