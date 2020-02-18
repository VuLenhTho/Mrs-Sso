package com.vulenhtho.model.response;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CartResponse {
    private String customerName;
    private String phone;
    private String address;
    private List<ItemResponse> items;
}
