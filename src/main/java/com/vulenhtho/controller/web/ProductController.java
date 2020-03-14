package com.vulenhtho.controller.web;

import com.vulenhtho.model.request.*;
import com.vulenhtho.model.response.ProductFilterWebResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class ProductController {
    private RestTemplate restTemplate;

    public ProductController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }


    @GetMapping("/")
    public ModelAndView webHome() {
        ModelAndView modelAndView = new ModelAndView("/web/home");

        BriefProductFilterWebRequest trendProducts = restTemplate.getForObject("http://localhost:8888/web/products?page=0&size=8&sort=date-des&trend=true", BriefProductFilterWebRequest.class);
        BriefProductFilterWebRequest bestSaleProducts = restTemplate.getForObject("http://localhost:8888/web/products?page=0&size=8&sort=hot-des", BriefProductFilterWebRequest.class);
        for (BriefProductWebRequest p : trendProducts.getProducts()) {
            p.setPrice(countPrice(p.getDiscount(), p.getPrice()));
        }
        for (BriefProductWebRequest p : bestSaleProducts.getProducts()) {
            p.setPrice(countPrice(p.getDiscount(), p.getPrice()));
        }

        modelAndView.addObject("trendProducts", trendProducts.getProducts());
        modelAndView.addObject("bestSaleProducts", bestSaleProducts.getProducts());

        return modelAndView;
    }


    @GetMapping("/web/products")
    public ModelAndView webProducts(@RequestParam(required = false) String categoryId
            , @RequestParam(defaultValue = "1", required = false) Integer page
            , @RequestParam(defaultValue = "12", required = false) Integer size
            , @RequestParam(required = false) String sex
            , @RequestParam(required = false) String search
            , @RequestParam(required = false, defaultValue = "date-des") String sort
    ) {
        ModelAndView modelAndView = new ModelAndView("product-list");
        String pageSt = Integer.toString(page - 1);
        String sizeSt = Integer.toString(size);
        String url = "http://localhost:8888/web/products?page=" + pageSt + "&size=" + sizeSt;
        if (search == null || search.length() < 1) {
            if (categoryId != null && categoryId.length() > 0) url += "&categoryId=" + categoryId;
            if (sex != null && sex.length() > 0) url += "&sex=" + sex;
        } else {
            url += "&search=" + search;
        }
        if (sort != null && sort.length() > 0) {
            url += "&sort=" + sort;
        } else {
            url += "&sort=date-des";
        }
        BriefProductFilterWebRequest data = restTemplate.getForObject
                (url, BriefProductFilterWebRequest.class);
        for (BriefProductWebRequest p : data.getProducts()) {
            p.setPrice(countPrice(p.getDiscount(), p.getPrice()));
        }
        modelAndView.addObject("data", data);

        ProductFilterWebResponse filterWebResponse = new ProductFilterWebResponse(search, sort, sex, categoryId);
        modelAndView.addObject("filter", filterWebResponse);
        return modelAndView;
    }

    @GetMapping("/web/product/{id}")
    public ModelAndView webProductDetail(@PathVariable String id) {
        ModelAndView modelAndView = new ModelAndView("product-detail");
        ProductWebRequest productWebRequest = restTemplate.getForObject("http://localhost:8888/web/product/" + id, ProductWebRequest.class);
        modelAndView.addObject("product", productWebRequest);
        modelAndView.addObject("newPrice", countPrice(productWebRequest.getDiscounts(), productWebRequest.getPrice()));
        setSizeColorAmount(modelAndView, productWebRequest.getProductColorSizes());
        setPhotoList(modelAndView, productWebRequest.getPhotoList());
        setSameProduct(modelAndView, productWebRequest.getCategory().getId());
        return modelAndView;
    }

    private void setSizeColorAmount(ModelAndView modelAndView, Set<ProductColorSizeRequest> productColorSizeRequests) {
        List<Long> sizes = new ArrayList<>();
        List<Long> colors = new ArrayList<>();
        List<Long> amounts = new ArrayList<>();
        for (ProductColorSizeRequest p : productColorSizeRequests) {
            sizes.add(p.getSizeId());
            colors.add(p.getColorId());
            amounts.add(p.getAmount());
        }
        modelAndView.addObject("sizes", sizes);
        modelAndView.addObject("colors", colors);
        modelAndView.addObject("amounts", amounts);

    }

    private void setPhotoList(ModelAndView modelAndView, String photos) {
        String[] photoList = photos.split(",");
        List<String> bigImg = new ArrayList<>();
        List<String> smImg = new ArrayList<>();
        for (int i = 0; i < photoList.length; i++) {
            if (i % 2 == 0) {
                bigImg.add(photoList[i]);
            } else {
                smImg.add(photoList[i]);
            }
        }
        modelAndView.addObject("bigImg", bigImg);
        modelAndView.addObject("smImg", smImg);
    }

    private Long countPrice(Set<DiscountRequest> discountRequests, Long price) {
        Long discountMoney = 0L;
        Long percent = 0L;
        if (discountRequests != null) {
            for (DiscountRequest d : discountRequests) {
                discountMoney += d.getAmount();
                percent += d.getPercent();
            }
        }

        return price - discountMoney - Math.round(price * ((float) percent / 100));
    }

    private void setSameProduct(ModelAndView modelAndView, Long categoryId) {
        String id = String.valueOf(categoryId);
        BriefProductFilterWebRequest request = restTemplate.getForObject("http://localhost:8888/web/products?page=0&size=7&sort=date-des&categoryId=" + id, BriefProductFilterWebRequest.class);
        for (BriefProductWebRequest p : request.getProducts()) {
            p.setPrice(countPrice(p.getDiscount(), p.getPrice()));
        }
        modelAndView.addObject("briefProducts", request.getProducts());
    }
}
