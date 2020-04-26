package com.vulenhtho.dto.request;

import com.vulenhtho.dto.WelcomeSlideDTO;
import com.vulenhtho.dto.response.ProductWebWindowViewResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WebHomeRequest {

    private List<ProductWebWindowViewResponseDTO> hotProductList = new ArrayList<>();

    private List<ProductWebWindowViewResponseDTO> trendProductList = new ArrayList<>();

    private List<WelcomeSlideDTO> welcomeSlideDTOS = new ArrayList<>();

    private PageHeaderDTO headerResponse;

}
