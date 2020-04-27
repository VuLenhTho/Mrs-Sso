package com.vulenhtho.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ItemDTO {

    private Long productId;

    private Long price;

    private Long quantity;

    private List<Long> discountIds = new ArrayList<>();
}
