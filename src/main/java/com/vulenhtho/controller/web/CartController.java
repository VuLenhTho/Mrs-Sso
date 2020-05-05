package com.vulenhtho.controller.web;

import com.vulenhtho.dto.ItemDTO;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

    private final ProductService productService;

    private final UserService userService;

    @Autowired
    public CartController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/cart")
    public ModelAndView cart() {
        return new ModelAndView("cart");
    }

    @GetMapping("/addToCart")
    public ResponseEntity<?> addToCart(@RequestParam Long price, @RequestParam Long productId
            , @RequestParam Long colorId, @RequestParam Long sizeId
            , @RequestParam Long quantity) {

        if (!userService.isLogged()) {
            return ResponseEntity.badRequest().build();
        }
        ItemDTO itemDTO = new ItemDTO(productId, colorId, sizeId, price, quantity);

        productService.addProductToCart(itemDTO);
        return ResponseEntity.ok().build();
    }
}
