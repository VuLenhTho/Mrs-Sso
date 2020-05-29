package com.vulenhtho.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ItemDTO {

    private Long productId;

    private String productName;

    private Long colorId;

    private String color;

    private String size;

    private Long sizeId;

    private String thumbnail;

    private Long price;

    private String vnPrice;

    private Long quantity;

    private String vnTotalPrice;

    public ItemDTO(Long productId, Long colorId, Long sizeId, Long price, Long quantity) {
        this.productId = productId;
        this.colorId = colorId;
        this.sizeId = sizeId;
        this.price = price;
        this.quantity = quantity;
    }
}
