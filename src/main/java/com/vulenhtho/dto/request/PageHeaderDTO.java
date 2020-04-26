package com.vulenhtho.dto.request;

import com.vulenhtho.dto.CategoryDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class PageHeaderDTO {

    private List<CategoryDTO> categoryDTOS = new ArrayList<>();

    private List<String> discounts = new ArrayList<>();
}
