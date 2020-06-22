package com.vulenhtho.dto.response;

import com.vulenhtho.dto.UserDTO;
import lombok.Data;

@Data
public class ChangeUserAndResult {
    private UserDTO userDTO;

    private String result;
}
