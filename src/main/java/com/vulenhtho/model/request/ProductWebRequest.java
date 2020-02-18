package com.vulenhtho.model.request;

import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
public class ProductWebRequest {
    private Long id;
    private String name;
    private Long price;
    private String status;
    private String shortDescription;
    private String thumbnail;
    private String photoList;
    private CategoryRequest category;

    private Set<ColorRequest> colors = new HashSet<>();
    private Set<DiscountRequest> discounts = new HashSet<>();
    private Set<SizeRequest> sizes = new HashSet<>();
    private Set<ProductColorSizeRequest> productColorSizes = new HashSet<>();

}
