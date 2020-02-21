package com.vulenhtho.dto.response;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class UserFilterResponse {
    private String sort;

    private String search;

    private String sex;

    private String status;

    private String roles;


    public UserFilterResponse(String sort, String search, String sex, String status, String roles) {
        this.sort = sort;
        this.search = search;
        this.sex = sex;
        this.status = status;
        this.roles = roles;
    }
}
