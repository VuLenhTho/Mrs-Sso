package com.vulenhtho.model.request;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class UpdateUserRequest {
    private Long id;
    private String userName;
    private String fullName;
    private String createdBy;
    private Date createdDate;
    private String phone;
    private String email;
    private boolean sex;
    private boolean status;
    private Set<RoleRequest> roles = new HashSet<>();
}
