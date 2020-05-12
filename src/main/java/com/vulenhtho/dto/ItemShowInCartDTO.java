package com.vulenhtho.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemShowInCartDTO {

    private Long id;

    private String name;

    private String color;

    private String size;

    private String thumbnail;

    private Long price;

    private String vnPrice;

    private Long quantity;

    private Long totalPrice;

    private String vnTotalPrice;
}
