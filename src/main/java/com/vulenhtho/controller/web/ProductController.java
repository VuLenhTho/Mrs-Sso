package com.vulenhtho.controller.web;

import com.vulenhtho.dto.request.FilterProductRequest;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.impl.SecurityServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(RestTemplate restTemplate, SecurityServiceImpl securityService, ProductService productService) {
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
