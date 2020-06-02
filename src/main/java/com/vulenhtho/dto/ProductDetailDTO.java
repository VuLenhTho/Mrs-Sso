package com.vulenhtho.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetailDTO {

    private ProductDTO productDTO;

    private List<SubCategoryDTO> subCategoryDTOS;

    private List<ColorDTO> colorDTOS;

    private List<SizeDTO> sizeDTOS;
}
