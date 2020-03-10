package com.vulenhtho.dto;

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
public class UserDTO {
    private Long id;

    private String userName;

    private String password;

    private String fullName;

    private Boolean sex;

    private String email;

    private String phone;

    private String avatarUrl;

    private Long coins;

    private Boolean activated;

    private Boolean locked;

    private String activationKey;

    private String resetDate;

    private String resetKey;

    private String createdBy;

    private String createdDate;

    private String lastModifiedBy;

    private String lastModifiedDate;

    private Set<RoleDTO> roles = new HashSet<>();

    public UserDTO(Long id, String userName, String password, String fullName, Boolean sex, String email, String phone
            , String avatarUrl, Long coins, Boolean locked, Set<RoleDTO> roles) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.sex = sex;
        this.email = email;
        this.phone = phone;
        this.avatarUrl = avatarUrl;
        this.coins = coins;
        this.locked = locked;
        this.roles = roles;
    }
}
