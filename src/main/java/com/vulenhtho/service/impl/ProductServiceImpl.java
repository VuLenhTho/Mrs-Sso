package com.vulenhtho.service.impl;

import com.vulenhtho.config.APIConstant;
import com.vulenhtho.dto.*;
import com.vulenhtho.dto.request.FilterProductRequest;
import com.vulenhtho.dto.request.ListProductPageRequest;
import com.vulenhtho.dto.request.PageHeaderDTO;
import com.vulenhtho.dto.request.WebHomeRequest;
import com.vulenhtho.dto.response.ProductWebResponse;
import com.vulenhtho.dto.response.ProductWebWindowViewResponseDTO;
import com.vulenhtho.model.response.ProductFilterWebResponse;
import com.vulenhtho.security.CustomUserDetail;
import com.vulenhtho.service.ProductService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.text.NumberFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {

    private RestTemplate restTemplate;
    private SecurityServiceImpl securityService;

    public ProductServiceImpl(RestTemplate restTemplate, SecurityServiceImpl securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public ModelAndView getWelcomePage() {
        ModelAndView modelAndView = new ModelAndView("/web/home");
        ResponseEntity<WebHomeRequest> allPageDataResponse = restTemplate.exchange(APIConstant.WEB_URI + "/welcome-page"
                , HttpMethod.GET, new HttpEntity<WebHomeRequest>(securityService.getHeaders()), WebHomeRequest.class);
        //todo
        if (!HttpStatus.OK.equals(allPageDataResponse.getStatusCode())) {
            return new ModelAndView("/web/home");
        }
        WebHomeRequest webHomeRequest = allPageDataResponse.getBody();

        webHomeRequest.getTrendProductList().forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));
        webHomeRequest.getHotProductList().forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

        modelAndView.addObject("trendProducts", webHomeRequest.getTrendProductList());
        modelAndView.addObject("bestSaleProducts", webHomeRequest.getHotProductList());
        setHeaderToModelAndView(modelAndView, webHomeRequest.getHeaderResponse());
        modelAndView.addObject("welcomeSlide", webHomeRequest.getWelcomeSlideDTOS());

        return modelAndView;
    }

    private String convertToVnCurrency(Long longPrice) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);

        return currencyVN.format(longPrice);
    }

    private void setHeaderToModelAndView(ModelAndView modelAndView, PageHeaderDTO pageHeaderDTO) {
        modelAndView.addObject("category", pageHeaderDTO.getCategoryDTOS());
        modelAndView.addObject("topSale", pageHeaderDTO.getDiscounts());
    }

    @Override
    public ModelAndView getListProductPage(FilterProductRequest filter) {
        ModelAndView modelAndView = new ModelAndView("web/product/product-list");
        String url = APIConstant.WEB_URI + "/products/window-view?page=" + (Integer.parseInt(filter.getPage()) - 1) + "&size=" + filter.getSize();
        if (StringUtils.isEmpty(filter.getSearch())) {
            if (!StringUtils.isEmpty(filter.getSubCategoryId())) url += "&subCategoryId=" + filter.getSubCategoryId();
        } else {
            url += "&search=" + filter.getSearch();
        }

        url += "&sort=" + filter.getSort();

        ResponseEntity<ListProductPageRequest> productPageRequest = restTemplate.exchange(url, HttpMethod.GET
                , new HttpEntity<ListProductPageRequest>(securityService.getHeaders()), ListProductPageRequest.class);

        //todo
        if (!HttpStatus.OK.equals(productPageRequest.getStatusCode())) {
            return new ModelAndView("web/product/product-list");
        }
        List<ProductWebWindowViewResponseDTO> productWindowViews = productPageRequest.getBody().getProducts();
        productWindowViews.forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

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
        ResponseEntity<ProductWebResponse> productResponseEntity = restTemplate.exchange(APIConstant.WEB_URI + "/product/" + productId
                , HttpMethod.GET, new HttpEntity<ProductWebResponse>(securityService.getHeaders()), ProductWebResponse.class);

        //todo
        if (!HttpStatus.OK.equals(productResponseEntity.getStatusCode())) {
            return new ModelAndView("/web/product/product-detail");
        }
        ProductWebResponse productWebResponse = productResponseEntity.getBody();
        productWebResponse.setVnPrice(convertToVnCurrency(productWebResponse.getPrice()));
        if (productWebResponse.getOriginalPrice() != null) {
            productWebResponse.setVnOriginalPrice(convertToVnCurrency(productWebResponse.getOriginalPrice()));
        }
        modelAndView.addObject("product", productWebResponse);
        setSizeColorAmount(modelAndView, productWebResponse.getProductColorSizeDTOS());
        setPhotoList(modelAndView, productWebResponse.getPhotoList());
        setProductHasSameSubCategory(modelAndView, productWebResponse.getSubCategoryDTO().getId());
        setHeaderToModelAndView(modelAndView, productResponseEntity.getBody().getHeader());
        modelAndView.addObject("productStatus", productWebResponse.getStatus());
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
        List<String> bigImg = new ArrayList<>(Arrays.asList(photoList));
        modelAndView.addObject("bigImg", bigImg);
    }

    private void setProductHasSameSubCategory(ModelAndView modelAndView, Long subCategoryId) {
        ResponseEntity<ListProductPageRequest> productPageRequest = restTemplate.exchange(APIConstant.WEB_URI + "/products/window-view?page=0&size=7&subCategoryId=" + subCategoryId
                , HttpMethod.GET, new HttpEntity<ListProductPageRequest>(securityService.getHeaders()), ListProductPageRequest.class);

        List<ProductWebWindowViewResponseDTO> products = productPageRequest.getBody().getProducts();
        products.forEach(product -> product.setVnPrice(convertToVnCurrency(product.getPrice())));

        modelAndView.addObject("sameCategoryProducts", products);
    }

    @Override
    public void addProductToCart(ItemDTO itemDTO) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (isLoggedAndAlreadyExistCart(authentication)) {
            addProductToAlreadyExistCart(itemDTO);
        } else {
            addProductToNewCart(itemDTO);
        }
    }


    private boolean isLoggedAndAlreadyExistCart(Authentication authentication) {
        return authentication != null && authentication.getPrincipal() instanceof CustomUserDetail
                && ((CustomUserDetail) authentication.getPrincipal()).getCartDTO() != null;
    }

    private void addProductToNewCart(ItemDTO itemDTO) {
        CartDTO cartDTO = new CartDTO();
        cartDTO.getItemList().add(itemDTO);

        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof CustomUserDetail) {
            ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).setCartDTO(cartDTO);
        }
    }

    private void addProductToAlreadyExistCart(ItemDTO itemDTO) {
        Set<ItemDTO> itemDTOSet = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().getItemList();
        boolean productNotExistInCart = true;
        for (ItemDTO item : itemDTOSet) {
            if (isSameProductByColorAndSize(item, itemDTO)) {
                Long newQuantity = item.getQuantity() + itemDTO.getQuantity();
                item.setQuantity(newQuantity);
                productNotExistInCart = false;
            }
        }
        if (productNotExistInCart) {
            itemDTOSet.add(itemDTO);
        }
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().setItemList(itemDTOSet);
    }

    private boolean isSameProductByColorAndSize(ItemDTO itemDTO1, ItemDTO itemDTO2) {
        return itemDTO1.getProductId().equals(itemDTO2.getProductId()) && itemDTO1.getColorId().equals(itemDTO2.getColorId())
                && itemDTO1.getSizeId().equals(itemDTO2.getSizeId());
    }

    @Override
    public ModelAndView getCart() {
        ModelAndView modelAndView = new ModelAndView("/web/cart");
        if (!(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof CustomUserDetail)) {
            return new ModelAndView("/web/login");
        }
        CartDTO cartDTO = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO();
        if (cartDTO == null) {
            return modelAndView;
        }

        HttpEntity<?> httpEntity = new HttpEntity<Object>(cartDTO.getItemList(), securityService.getHeaders());
        ResponseEntity<ItemsForCartAndHeader> itemsForCartAndHeaderResponseEntity = restTemplate.exchange(APIConstant.WEB_URI + "/products/itemInCart"
                , HttpMethod.POST, httpEntity, ItemsForCartAndHeader.class);

        ItemsForCartAndHeader itemsForCartAndHeader = itemsForCartAndHeaderResponseEntity.getBody();
        List<ItemShowInCartDTO> itemShowInCartDTOS = itemsForCartAndHeader.getItemShowInCartDTOS().stream().peek(item -> {
            item.setVnPrice(convertToVnCurrency(item.getPrice()));
            item.setVnTotalPrice(convertToVnCurrency(item.getTotalPrice()));
        }).collect(Collectors.toList());

        modelAndView.addObject("itemList", itemShowInCartDTOS);
        setHeaderToModelAndView(modelAndView, itemsForCartAndHeaderResponseEntity.getBody().getHeaderDTO());
        return modelAndView;
    }

    @Override
    public Long updateProductQuantity(Long newQuantity, Long productId) {
        long newTotalPrice = 0;
        Set<ItemDTO> itemDTOSet = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().getItemList();
        for (ItemDTO item : itemDTOSet) {
            if (item.getProductId().equals(productId)) {
                item.setQuantity(newQuantity);
                newTotalPrice = newQuantity * item.getPrice();
            }
        }
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().setItemList(itemDTOSet);
        return newTotalPrice;
    }

    @Override
    public void updateCart(String productIds, String quantity, String productIdsToDelete) {
        List<Long> ids = Arrays.stream(productIds.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        List<Long> quantityList = Arrays.stream(quantity.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        List<Long> productIdsToDel = Arrays.stream(productIdsToDelete.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        Set<ItemDTO> itemDTOSet = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().getItemList();

        productIdsToDel.forEach(idToDel -> {
            itemDTOSet.removeIf(item -> item.getProductId().equals(idToDel));
        });

        for (int i = 0; i < ids.size(); i++) {
            for (ItemDTO item : itemDTOSet) {
                if (item.getProductId().equals(ids.get(i))) {
                    item.setQuantity(quantityList.get(i));
                }
            }
        }
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO().setItemList(itemDTOSet);
    }

}
