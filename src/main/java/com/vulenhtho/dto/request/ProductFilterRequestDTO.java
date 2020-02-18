package com.vulenhtho.dto.request;

import com.vulenhtho.dto.enumeration.ProductStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductFilterRequestDTO {
    private String sort;

    private ProductStatus status;

    private String search;

    private Long categoryId;

    private Boolean hot;

    private Boolean trend;

    private String  discountId;

    private Integer page;

    private Integer size;

}
