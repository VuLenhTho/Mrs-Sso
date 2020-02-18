package com.vulenhtho.util;

import org.springframework.security.core.context.SecurityContextHolder;

public final class SecurityUtil {
    public static String getUserName() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
}
