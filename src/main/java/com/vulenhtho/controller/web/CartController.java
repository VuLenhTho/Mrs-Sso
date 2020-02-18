package com.vulenhtho.controller.web;

import com.vulenhtho.model.request.ProductWebRequest;
import com.vulenhtho.model.response.CartResponse;
import com.vulenhtho.model.response.ItemResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    private RestTemplate restTemplate;

    @Autowired
    public CartController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping("/web/cart")
    public ModelAndView cart() {
        return new ModelAndView("cart");
    }

    @GetMapping("/web/addToCart")
    public ModelAndView addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (req.getParameter("productId") != null) {
            ProductWebRequest product = restTemplate.getForObject
                    ("http://localhost:8888/web/product/"
                                    + req.getParameter("productId")
                            , ProductWebRequest.class);
            if (product != null) {
                HttpSession session = req.getSession();
                if (session.getAttribute("cart") == null) {
                    CartResponse cartResponse = new CartResponse();
                    List<ItemResponse> itemList = new ArrayList<>();
                    ItemResponse item = new ItemResponse(
                            product, product.getPrice(), 1L);
                    itemList.add(item);
                    cartResponse.setItems(itemList);
                    session.setAttribute("cart", cartResponse);
                } else {
                    CartResponse cartResponse = (CartResponse) session.getAttribute("cart");
                    List<ItemResponse> itemList = cartResponse.getItems();

                    boolean checkExist = false;
                    for (ItemResponse item : itemList) {
                        if (item.getProduct().getId().equals(product.getId())) {
                            item.setAmount(item.getAmount() + 1);
                            checkExist = true;
                        }
                    }
                    if (!checkExist) {
                        ItemResponse itemResponse = new ItemResponse(product, product.getPrice(), 1L);
                        itemList.add(itemResponse);
                    }
                    session.setAttribute("cart", cartResponse);
                }
            }
            System.out.println("vào");
        }
        return new ModelAndView("cart");
    }
}
