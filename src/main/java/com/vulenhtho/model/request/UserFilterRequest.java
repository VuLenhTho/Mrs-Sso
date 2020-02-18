package com.vulenhtho.model.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UserFilterRequest {
    List<UserRequest> users;
    private Integer totalPages;
    private Integer currentPage;
}
