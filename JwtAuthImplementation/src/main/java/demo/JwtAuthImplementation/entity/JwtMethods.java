package demo.JwtAuthImplementation.entity;

import java.security.Key;
import java.util.Date;

import javax.crypto.SecretKey;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

public class JwtMethods {
	
	private static final String JWT_SECRET = "uECZQF5DQy5oNsdR7xskT2zF9pEDkqF8QFz3rwX1mRM=";
    private static final int JWT_EXPIRATION_MS = 300000;  // 15 minutes
    

    

	// generate secret key
    private  SecretKey key() {
        return Keys.hmacShaKeyFor(Decoders.BASE64.decode(JWT_SECRET));
    }
	// generate token 
    
    public String generateToken(String username) {
    	Date now = new Date();
        Date expiryDate = new Date(now.getTime() + JWT_EXPIRATION_MS);
    	String token=Jwts.builder()
    			.subject(username)
    			.issuer("MRNarsing")
    			.claim("role", "ADMIN")
    			.expiration(expiryDate)
    			.issuedAt(now)
    			.signWith(key())
    			.compact();
		return token;
    	
    }
	// extract username from token
    
    public String extractUser(String token) {
    	String username=Jwts.parser()
    			.verifyWith((SecretKey)key())
    			.build()
    			.parseSignedClaims(token)
    			.getPayload()
    			.getSubject();
		return username;
    	
    }
	// validate user
    public String validateToken(String authToken) {
        try {
            // Parse the token and validate it
            Jws<Claims> claimsJws = Jwts.parser()
                    .verifyWith((SecretKey) key())
                    .build()
                    .parseSignedClaims(authToken);

            // Extract claims
            Claims claims = claimsJws.getPayload();
            String username = claims.getSubject(); // Standard claim "sub" (subject)
            
            return username;

        } catch (Exception e) {
            // Handle invalid or expired token
            System.err.println("Invalid or expired token: " + e.getMessage());
            return null; // Return null or throw a custom exception
        }
    }


    
 // Secret key for signing the token
    

 
  
}
