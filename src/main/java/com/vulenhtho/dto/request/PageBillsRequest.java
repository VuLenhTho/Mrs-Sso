package com.vulenhtho.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PageBillsRequest {
    private List<ShortInfoBillDTO> billDTOS;

    private Integer totalPages;

    private Integer currentPage;
}
