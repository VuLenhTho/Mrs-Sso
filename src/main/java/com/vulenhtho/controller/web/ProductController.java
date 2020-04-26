package com.vulenhtho.controller.web;

import com.vulenhtho.dto.request.FilterProductRequest;
import com.vulenhtho.dto.response.ProductWebResponse;
import com.vulenhtho.model.request.*;
import com.vulenhtho.model.response.ProductFilterWebResponse;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.SecurityService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class ProductController {
    private RestTemplate restTemplate;

    private SecurityService securityService;

    private ProductService productService;

    public ProductController(RestTemplate restTemplate, SecurityService securityService, ProductService productService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
        this.productService = productService;
    }


    @GetMapping("/home")
    public ModelAndView webHome() {
        return productService.getWelcomePage();
    }


    @GetMapping("/products")
    public ModelAndView webProducts(@RequestParam(required = false) String subCategoryId
            , @RequestParam(defaultValue = "1", required = false) String page
            , @RequestParam(defaultValue = "12", required = false) String size
            , @RequestParam(required = false) String search
            , @RequestParam(required = false, defaultValue = "date-des") String sort
    ) {
        FilterProductRequest filterProductRequest = new FilterProductRequest(subCategoryId, page, size, sort, search);
        return productService.getListProductPage(filterProductRequest);

    }

    @GetMapping("/product/{id}")
    public ModelAndView webProductDetail(@PathVariable Long id) {
        return productService.getDetailProductPage(id);
    }


}
