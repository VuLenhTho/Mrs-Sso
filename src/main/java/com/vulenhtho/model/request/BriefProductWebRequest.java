package com.vulenhtho.model.request;

import lombok.Getter;
import lombok.Setter;

import java.util.Set;


@Getter
@Setter
public class BriefProductWebRequest {
    private Long id;
    private String name;
    private Long price;
    private String thumbnail;
    private Set<DiscountRequest> discount;
}
