package com.vulenhtho.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductColorSizeDTO {
    private Long id;

    private Long productId;

    private Long colorId;

    private String color;

    private String size;

    private Long sizeId;

    private Long quantity;
}
