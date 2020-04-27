package com.vulenhtho.dto.response;

import com.vulenhtho.dto.*;
import com.vulenhtho.dto.enumeration.ProductStatus;
import com.vulenhtho.dto.request.PageHeaderDTO;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class ProductWebResponse {

    private Long id;

    private String name;

    private Long price;

    private String vnPrice;

    //has value if product has discount
    private Long originalPrice;

    private String vnOriginalPrice;

    private String shortDescription;

    @Enumerated(EnumType.STRING)
    private ProductStatus status;

    private String photoList;

    private Boolean hot;

    private Boolean trend;

    private SubCategoryDTO subCategoryDTO;

    private Set<ProductColorSizeDTO> productColorSizeDTOS = new HashSet<>();

    private Set<ColorDTO> colorDTOS = new HashSet<>();

    private Set<DiscountDTO> discountDTOS = new HashSet<>();

    private Set<SizeDTO> sizeDTOS = new HashSet<>();

    private PageHeaderDTO header;

}
