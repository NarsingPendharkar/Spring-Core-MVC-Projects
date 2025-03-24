package org.JwtTutorial;


public class App {
    public static void main(String[] args) {
        JwtUtils jwtUtils = new JwtUtils();

        // Generate JWT Token
        String token = jwtUtils.generateTokenFromUsername("nirav");
        System.out.println("Generated Token: " + token);

        // Simulating an HTTP request with Authorization header
        FakeHttpRequest request = new FakeHttpRequest();
        request.addHeader("Authorization", "Bearer " + token);

        // Extract token from header
        String extractedToken = getJwtFromHeader(request);
        System.out.println("Extracted Token: " + extractedToken);

        // Validate Token
        if (jwtUtils.validateJwtToken(extractedToken)) {
            String username = jwtUtils.getUserNameFromJwtToken(extractedToken);
            System.out.println("Token Valid! User: " + username);
        } else {
            System.out.println("Invalid Token!");
        }
    }

    private static String getJwtFromHeader(FakeHttpRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7); // Remove "Bearer " prefix
        }
        return null;
    }
}
