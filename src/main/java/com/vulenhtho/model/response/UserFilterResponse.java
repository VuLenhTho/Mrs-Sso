package com.vulenhtho.model.response;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class UserFilterResponse {
    private String sort;
    private String search;
    private String status;
    private String sex;
    public UserFilterResponse(String sort, String search, String status, String sex) {
        this.sort = sort;
        this.search = search;
        this.status = status;
        this.sex = sex;
    }
}
