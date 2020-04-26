package com.vulenhtho.service.impl;

import com.vulenhtho.dto.ProductColorSizeDTO;
import com.vulenhtho.dto.request.FilterProductRequest;
import com.vulenhtho.dto.request.ListProductPageRequest;
import com.vulenhtho.dto.request.PageHeaderDTO;
import com.vulenhtho.dto.request.WebHomeRequest;
import com.vulenhtho.dto.response.ProductWebResponse;
import com.vulenhtho.dto.response.ProductWebWindowViewResponseDTO;
import com.vulenhtho.model.request.DiscountRequest;
import com.vulenhtho.model.response.ProductFilterWebResponse;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.SecurityService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.text.NumberFormat;
import java.util.*;

@Service
public class ProductServiceImpl implements ProductService {

    private RestTemplate restTemplate;
    private SecurityService securityService;

    public ProductServiceImpl(RestTemplate restTemplate, SecurityService securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public ModelAndView getWelcomePage() {
        ModelAndView modelAndView = new ModelAndView("/web/home");
        ResponseEntity<WebHomeRequest> allPageDataResponse = restTemplate.exchange("http://localhost:8888/api/web/welcome-page"
                , HttpMethod.GET, new HttpEntity<WebHomeRequest>(securityService.getHeaders()), WebHomeRequest.class);
        //todo
        if (!HttpStatus.OK.equals(allPageDataResponse.getStatusCode())) {
            return new ModelAndView("/web/home");
        }
        WebHomeRequest webHomeRequest = allPageDataResponse.getBody();
        webHomeRequest.getHeaderResponse().getCategoryDTOS().forEach(categoryDTO -> {
            categoryDTO.getSubCategoryDTOS().forEach(subCategoryDTO -> {
                subCategoryDTO.setLinkToPage("/products?subCategoryId=" + subCategoryDTO.getId());
            });
        });
        webHomeRequest.getTrendProductList().forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));
        webHomeRequest.getHotProductList().forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

        modelAndView.addObject("trendProducts", webHomeRequest.getTrendProductList());
        modelAndView.addObject("bestSaleProducts", webHomeRequest.getHotProductList());
        setHeaderToModelAndView(modelAndView, webHomeRequest.getHeaderResponse());
        modelAndView.addObject("welcomeSlide", webHomeRequest.getWelcomeSlideDTOS());

        return modelAndView;
    }

    private String convertToVnCurrency(Long longPrice){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        return currencyVN.format(longPrice);
    }

    private void setHeaderToModelAndView(ModelAndView modelAndView, PageHeaderDTO pageHeaderDTO){
        modelAndView.addObject("category", pageHeaderDTO.getCategoryDTOS());
        modelAndView.addObject("topSale", pageHeaderDTO.getDiscounts());
    }

    @Override
    public ModelAndView getListProductPage(FilterProductRequest filter) {
        ModelAndView modelAndView = new ModelAndView("web/product/product-list");
        String url = "http://localhost:8888/api/web/products/window-view?page=" + (Integer.parseInt(filter.getPage()) - 1) + "&size=" + filter.getSize();
        if (StringUtils.isEmpty(filter.getSearch())) {
            if (!StringUtils.isEmpty(filter.getSubCategoryId())) url += "&subCategoryId=" + filter.getSubCategoryId();
        } else {
            url += "&search=" + filter.getSearch();
        }

        url += "&sort=" + filter.getSort();

        ResponseEntity<ListProductPageRequest> productPageRequest = restTemplate.exchange(url, HttpMethod.GET
                , new HttpEntity<ListProductPageRequest>(securityService.getHeaders()), ListProductPageRequest.class);

        //todo
        if (!HttpStatus.OK.equals(productPageRequest.getStatusCode())){
            return new ModelAndView("web/product/product-list");
        }
        List<ProductWebWindowViewResponseDTO> productWindowViews = productPageRequest.getBody().getProducts();
        productWindowViews.forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

        Comparator<ProductWebWindowViewResponseDTO> comparator = null;
        if ( "price-des".equals(filter.getSort()) ) {
            comparator = (o1, o2) -> {
                if (o1.getPrice() < o2.getPrice()) {
                    return 1;
                } else if (o1.getPrice().equals(o2.getPrice())) {
                    return 0;
                } else {
                    return -1;
                }
            };
        }else if ("price-asc".equals(filter.getSort())) {
            comparator = (o1, o2) -> {
                if (o1.getPrice() > o2.getPrice()) {
                    return 1;
                } else if (o1.getPrice().equals(o2.getPrice())) {
                    return 0;
                } else {
                    return -1;
                }
            };
        }
        if (comparator != null){
            productWindowViews.sort(comparator);
        }
        modelAndView.addObject("productList", productWindowViews);
        modelAndView.addObject("totalPage", productPageRequest.getBody().getTotalPage());
        modelAndView.addObject("currentPage", productPageRequest.getBody().getCurrentPage());
       setHeaderToModelAndView(modelAndView, productPageRequest.getBody().getHeader());

        ProductFilterWebResponse filterWebResponse = new ProductFilterWebResponse(filter.getSearch(), filter.getSort(), filter.getSubCategoryId());
        modelAndView.addObject("filter", filterWebResponse);
        return modelAndView;
    }

    @Override
    public ModelAndView getDetailProductPage(Long productId) {
        ModelAndView modelAndView = new ModelAndView("/web/product/product-detail");
        ResponseEntity<ProductWebResponse> productResponseEntity = restTemplate.exchange("http://localhost:8888/api/web/product/" + productId
                , HttpMethod.GET, new HttpEntity<ProductWebResponse>(securityService.getHeaders()), ProductWebResponse.class);

        //todo
        if (!HttpStatus.OK.equals(productResponseEntity.getStatusCode())){
            return new ModelAndView("/web/product/product-detail");
        }
        ProductWebResponse productWebResponse = productResponseEntity.getBody();
        productWebResponse.setVnPrice(convertToVnCurrency(productWebResponse.getPrice()));
        productWebResponse.setVnOriginalPrice(convertToVnCurrency(productWebResponse.getOriginalPrice()));

        modelAndView.addObject("product", productWebResponse);
        setSizeColorAmount(modelAndView, productWebResponse.getProductColorSizeDTOS());
        setPhotoList(modelAndView, productWebResponse.getPhotoList());
        setProductHasSameSubCategory(modelAndView, productWebResponse.getSubCategoryDTO().getId());

        return modelAndView;
    }

    private void setSizeColorAmount(ModelAndView modelAndView, Set<ProductColorSizeDTO> productColorSizeDTOs) {
        List<Long> sizes = new ArrayList<>();
        List<Long> colors = new ArrayList<>();
        List<Long> quantity = new ArrayList<>();
        for (ProductColorSizeDTO p : productColorSizeDTOs) {
            sizes.add(p.getSizeId());
            colors.add(p.getColorId());
            quantity.add(p.getQuantity());
        }
        modelAndView.addObject("sizes", sizes);
        modelAndView.addObject("colors", colors);
        modelAndView.addObject("quantity", quantity);

    }

    private void setPhotoList(ModelAndView modelAndView, String photos) {
        String[] photoList = photos.split(",");
        List<String> bigImg = new ArrayList<>();
        List<String> smImg = new ArrayList<>();
        //big img first, after is small img
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

    private void setProductHasSameSubCategory(ModelAndView modelAndView, Long subCategoryId) {
        ResponseEntity<ListProductPageRequest> productPageRequest = restTemplate.exchange("http://localhost:8888/api/web/products/window-view?page=0&size=7&subCategoryId=" + subCategoryId
                , HttpMethod.GET, new HttpEntity<ListProductPageRequest>(securityService.getHeaders()), ListProductPageRequest.class);

        List<ProductWebWindowViewResponseDTO> products = productPageRequest.getBody().getProducts();
        products.forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

        modelAndView.addObject("sameCategoryProducts", products);
    }

}
