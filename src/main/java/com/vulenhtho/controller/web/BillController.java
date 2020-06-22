package com.vulenhtho.controller.web;

import com.vulenhtho.dto.ItemDTO;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BillController {

    private final ProductService productService;

    private final UserService userService;

    @Autowired
    public BillController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/addToCart")
    public ResponseEntity<?> addToCart(@RequestParam Long price, @RequestParam Long productId
            , @RequestParam Long colorId, @RequestParam Long sizeId
            , @RequestParam Long quantity) {

        if (!userService.isLogged()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        try {
            ItemDTO itemDTO = new ItemDTO(productId, colorId, sizeId, price, quantity);
            productService.addProductToCart(itemDTO);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }

    @GetMapping("/cart")
    public ModelAndView getCart() {
        return productService.getCart();
    }

    @GetMapping("/updateCart")
    public void updateCart(@RequestParam String productIds, @RequestParam String quantity, @RequestParam String productIdsToDelete) {
        productService.updateCart(productIds, quantity, productIdsToDelete);
    }

    @GetMapping("/updateBillInfo")
    public void updateBillInfo(HttpServletRequest request) {
        productService.updateBillInfo(request);
    }

    @GetMapping("/createBill")
    public void createBill(HttpServletRequest request) {
        productService.updateBillInfo(request);
        productService.createBill();
    }

}
