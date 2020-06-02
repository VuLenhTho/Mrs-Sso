package com.vulenhtho.dto.request;


import com.vulenhtho.dto.DiscountDTO;
import com.vulenhtho.dto.SubCategoryDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InfoToCreateProductDTO {

    private List<DiscountDTO> discountDTOS = new ArrayList<>();

    private List<SubCategoryDTO> subCategoryDTOS = new ArrayList<>();
}
