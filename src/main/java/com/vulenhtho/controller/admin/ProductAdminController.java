package com.vulenhtho.controller.admin;

import com.vulenhtho.dto.request.FilterProductRequest;
import com.vulenhtho.service.ProductService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class ProductAdminController {
    private ProductService productService;

    public ProductAdminController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public ModelAndView getProductsByAdmin(@RequestParam(required = false) String subCategoryId
            , @RequestParam(defaultValue = "1", required = false) String page
            , @RequestParam(defaultValue = "12", required = false) String size
            , @RequestParam(required = false) String search
            , @RequestParam(required = false, defaultValue = "date-des") String sort
    ) {
        FilterProductRequest filterProductRequest = new FilterProductRequest(subCategoryId, page, size, sort, search);
        return productService.getListProductPage(filterProductRequest, true);
    }

    @GetMapping("/product/{id}")
    public ModelAndView getProductDetailByAdmin(@PathVariable Long id) {
        return productService.getDetailProductByAdmin(id);
    }

    @GetMapping("/product/create")
    public ModelAndView getCreateProductByAdmin() {
        return productService.getCreateProductByAdmin();
    }
}
