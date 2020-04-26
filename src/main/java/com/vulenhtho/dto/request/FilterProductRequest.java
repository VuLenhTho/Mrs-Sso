package com.vulenhtho.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class FilterProductRequest {

    private String subCategoryId;

    private String page;

    private String size;

    private String sort;

    private String search;
}
