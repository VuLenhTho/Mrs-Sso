package com.vulenhtho.dto.response;

import com.vulenhtho.dto.*;
import com.vulenhtho.dto.enumeration.ProductStatus;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class ProductWebResponseDTO {
    private Long id;

    private String name;

    private Long price;

    private String shortDescription;

    private ProductStatus status;

    private String thumbnail;

    private String photoList;

    private Boolean hot;

    private Boolean trend;

    private CategoryDTO categoryDTO;

    private Set<ProductColorSizeDTO> productColorSizeDTOS = new HashSet<>();

    private Set<ColorDTO> colorDTOS = new HashSet<>();

    private Set<DiscountDTO> discountDTOS = new HashSet<>();

    private Set<SizeDTO> sizeDTOS = new HashSet<>();

}
