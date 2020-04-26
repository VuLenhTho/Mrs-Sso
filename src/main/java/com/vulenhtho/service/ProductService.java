package com.vulenhtho.service;

import com.vulenhtho.dto.request.FilterProductRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ProductService {
    ModelAndView getWelcomePage();

    ModelAndView getListProductPage(FilterProductRequest filterProductRequest);

    ModelAndView getDetailProductPage(Long productId);
}
