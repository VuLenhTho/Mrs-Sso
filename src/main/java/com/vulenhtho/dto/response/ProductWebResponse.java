package com.vulenhtho.dto.response;

import com.vulenhtho.dto.*;
import com.vulenhtho.dto.enumeration.ProductStatus;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class ProductWebResponse {

    private Long id;

    private String name;

    private Long price;

    private String vnPrice;

    private Long originalPrice;

    private String vnOriginalPrice;

    private String shortDescription;

    private String status;

    private String photoList;

    private Boolean hot;

    private Boolean trend;

    private SubCategoryDTO subCategoryDTO;

    private Set<ProductColorSizeDTO> productColorSizeDTOS = new HashSet<>();

    private Set<ColorDTO> colorDTOS = new HashSet<>();

    private Set<DiscountDTO> discountDTOS = new HashSet<>();

    private Set<SizeDTO> sizeDTOS = new HashSet<>();

}
