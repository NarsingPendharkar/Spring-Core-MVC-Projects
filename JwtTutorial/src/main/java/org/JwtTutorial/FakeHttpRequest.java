package org.JwtTutorial;



import java.util.HashMap;
import java.util.Map;

public class FakeHttpRequest {
    private final Map<String, String> headers = new HashMap<>();

    public void addHeader(String key, String value) {
        headers.put(key, value);
    }

    public String getHeader(String key) {
        return headers.get(key);
    }
}
