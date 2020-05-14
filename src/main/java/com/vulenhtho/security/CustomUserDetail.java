package com.vulenhtho.security;

import com.vulenhtho.dto.CartDTO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
@Setter
public class CustomUserDetail extends User {
    private String fullName;

    private String phone;

    private String address;

    private String token;

    private String type;

    private CartDTO cartDTO;

    public CustomUserDetail(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }


}
