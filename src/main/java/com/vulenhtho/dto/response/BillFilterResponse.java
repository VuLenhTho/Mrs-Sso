package com.vulenhtho.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BillFilterResponse {

    private String sort;

    private String status;

    private String search;

    private String paymentMethod;

    private Integer page = 1;

    private Integer size = 5;
}
