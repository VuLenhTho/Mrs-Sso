package com.vulenhtho.service.impl;

import com.vulenhtho.dto.request.WebHomeRequest;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.SecurityService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.text.NumberFormat;
import java.util.Locale;

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
        if (!HttpStatus.OK.equals(allPageDataResponse.getStatusCode())) {
            return new ModelAndView("/web/home");
        }
        WebHomeRequest webHomeRequest = handleWebHomeRequestData(allPageDataResponse.getBody());

        modelAndView.addObject("trendProducts", webHomeRequest.getTrendProductList());
        modelAndView.addObject("bestSaleProducts", webHomeRequest.getHotProductList());
        modelAndView.addObject("category", webHomeRequest.getHeaderResponse().getCategoryDTOS());
        modelAndView.addObject("topSale", webHomeRequest.getHeaderResponse().getDiscounts());
        modelAndView.addObject("welcomeSlide", webHomeRequest.getWelcomeSlideDTOS());

        return modelAndView;
    }

    private WebHomeRequest handleWebHomeRequestData(WebHomeRequest webHomeRequest) {
        webHomeRequest.getHeaderResponse().getCategoryDTOS().forEach(categoryDTO -> {
            categoryDTO.getSubCategoryDTOS().forEach(subCategoryDTO -> {
                subCategoryDTO.setLinkToPage("/products?subCategoryId=" + subCategoryDTO.getId());
            });
        });
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        webHomeRequest.getHotProductList().forEach(product -> {
            product.setVnPrice(currencyVN.format(product.getPrice()));
        });
        webHomeRequest.getTrendProductList().forEach(product -> {
            product.setVnPrice(currencyVN.format(product.getPrice()));
        });

        return webHomeRequest;
    }


}
