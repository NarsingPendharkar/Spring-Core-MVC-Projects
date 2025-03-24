package org.JwtTutorial;


import java.util.Base64;
import java.util.Date;

import javax.crypto.SecretKey;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;

public class JwtUtils {
	private static final String JWT_SECRET = "uECZQF5DQy5oNsdR7xskT2zF9pEDkqF8QFz3rwX1mRM=";
    private static final int JWT_EXPIRATION_MS = 900000;  // 15 minutes

    private SecretKey key() {
        return Keys.hmacShaKeyFor(Base64.getDecoder().decode(JWT_SECRET));
    }

    public String generateTokenFromUsername(String username) {
        return Jwts.builder()
                .subject(username)
                .issuedAt(new Date())
                .expiration(new Date((new Date()).getTime() + JWT_EXPIRATION_MS))
                .signWith(key(), SignatureAlgorithm.HS256)
                .compact();
    }

    public String getUserNameFromJwtToken(String token) {
        return Jwts.parser()
                .verifyWith(key())  
                .build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject();
    }

    public boolean validateJwtToken(String authToken) {
        try {
            System.out.println("Validating JWT Token...");
            Jwts.parser()
                .verifyWith(key())  
                .build()
                .parseSignedClaims(authToken);

            return true;
        } catch (MalformedJwtException e) {
            System.err.println("Invalid JWT token: " + e.getMessage());
        } catch (ExpiredJwtException e) {
            System.err.println("JWT token is expired: " + e.getMessage());
        } catch (UnsupportedJwtException e) {
            System.err.println("JWT token is unsupported: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            System.err.println("JWT claims string is empty: " + e.getMessage());
        } catch (SignatureException e) {
            System.err.println("JWT signature does not match: " + e.getMessage());
        }
        return false;
    }
}
