package com.vulenhtho.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
public class DiscountDTO {
    private Long id;

    private String name;

    private Long percent;

    private Long amount;

    private String content;

    private String startDate;

    private String endDate;

    private Boolean isForProduct;
}
