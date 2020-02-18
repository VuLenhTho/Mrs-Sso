package com.vulenhtho.model.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductColorSizeRequest {
    private Long colorId;
    private Long sizeId;
    private Long amount;
}
