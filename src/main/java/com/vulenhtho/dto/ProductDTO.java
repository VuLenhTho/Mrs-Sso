package com.vulenhtho.dto;

import com.vulenhtho.dto.enumeration.ProductStatus;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
public class ProductDTO {
    private Long id;

    private String name;

    private Long importPrice;

    private Long price;

    private Long originalPrice;

    private String shortDescription;

    private ProductStatus status;

    private String thumbnail;

    private String photoList;

    private Boolean hot;

    private Boolean trend;

    private String createdBy;

    private String createdDate;

    private String lastModifiedBy;

    private String lastModifiedDate;

    private CategoryDTO categoryDTO;

    private SubCategoryDTO subCategoryDTO;

    private List<ProductColorSizeDTO> productColorSizeDTOS = new ArrayList<>();

    private Set<ColorDTO> colorDTOS = new HashSet<>();

    private List<DiscountDTO> discountDTOS = new ArrayList<>();

    private Set<SizeDTO> sizeDTOS = new HashSet<>();

}
