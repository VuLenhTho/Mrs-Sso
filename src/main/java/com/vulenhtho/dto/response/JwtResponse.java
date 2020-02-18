package com.vulenhtho.dto.response;

import com.vulenhtho.dto.UserDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtResponse {
    private String token;

    private String type;

    private UserDTO userDTO;
}
