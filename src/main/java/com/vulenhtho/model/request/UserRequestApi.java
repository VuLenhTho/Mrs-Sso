package com.vulenhtho.model.request;

import com.vulenhtho.dto.RoleDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserRequestApi {
    private String userName;

    private String password;

    private Set<RoleDTO> roles = new HashSet<>();

}
