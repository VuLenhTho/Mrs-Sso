package com.vulenhtho.model.response;

import com.vulenhtho.model.request.ProductWebRequest;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ItemResponse {
    private ProductWebRequest product;
    private Long price;
    private Long amount;
}
