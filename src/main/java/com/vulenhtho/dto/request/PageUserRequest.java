package com.vulenhtho.dto.request;


import com.vulenhtho.dto.UserDTO;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class PageUserRequest implements Serializable {

    private List<UserDTO> userDTOS;

    private Integer totalPages;

    private Integer currentPage;

    public PageUserRequest() {
    }

    public PageUserRequest(List<UserDTO> userDTOS, Integer totalPages, Integer currentPage) {
        this.userDTOS = userDTOS;
        this.totalPages = totalPages;
        this.currentPage = currentPage;
    }
}
