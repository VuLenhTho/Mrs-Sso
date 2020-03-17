package com.vulenhtho.dto.response;

import com.vulenhtho.dto.enumeration.ProductStatus;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductWebWindowViewResponseDTO {
    private Long id;

    private String name;

    private Long price;

    private String vnPrice;

    private ProductStatus status;

    private String thumbnail;

    private Boolean hot;

    private Boolean trend;

    private Boolean isDiscount;

}
