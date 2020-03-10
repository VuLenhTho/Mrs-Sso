package com.vulenhtho.service;

import com.vulenhtho.security.CustomUserDetail;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class SecurityService {

    public String getUserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof CustomUserDetail) {
                return ((CustomUserDetail) authentication.getPrincipal()).getFullName();
            }
        }
        return null;
    }

    public HttpHeaders getHeaders() {
        if (getToken() != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", getToken());
            return headers;
        }
        return null;
    }

    public String getToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof CustomUserDetail) {
                return "Bearer " + ((CustomUserDetail) authentication.getPrincipal()).getToken();
            }
        }
        return null;
    }

    public String getShortToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof CustomUserDetail) {
                return ((CustomUserDetail) authentication.getPrincipal()).getToken();
            }
        }
        return null;
    }

}
