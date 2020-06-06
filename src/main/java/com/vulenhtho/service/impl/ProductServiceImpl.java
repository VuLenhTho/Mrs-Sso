package com.vulenhtho.service.impl;

import com.vulenhtho.config.APIConstant;
import com.vulenhtho.controller.web.LoginController;
import com.vulenhtho.dto.*;
import com.vulenhtho.dto.enumeration.PaymentMethod;
import com.vulenhtho.dto.request.*;
import com.vulenhtho.dto.response.ProductWebResponse;
import com.vulenhtho.dto.response.ProductWebWindowViewResponseDTO;
import com.vulenhtho.model.response.ProductFilterWebResponse;
import com.vulenhtho.security.CustomUserDetail;
import com.vulenhtho.service.ProductService;
import com.vulenhtho.service.UserService;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

import static com.vulenhtho.util.CommonUtils.convertToVnCurrency;

@Service
public class ProductServiceImpl implements ProductService {

    private final RestTemplate restTemplate;

    private final SecurityServiceImpl securityService;

    private final UserService userService;

    private final LoginController loginController;

    public ProductServiceImpl(RestTemplate restTemplate, SecurityServiceImpl securityService, UserService userService, LoginController loginController) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
        this.userService = userService;
        this.loginController = loginController;
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
        setLinkToAdminPage(modelAndView);

        return modelAndView;
    }

    private void setHeaderToModelAndView(ModelAndView modelAndView, PageHeaderDTO pageHeaderDTO) {
        modelAndView.addObject("category", pageHeaderDTO.getCategoryDTOS());
        modelAndView.addObject("topSale", pageHeaderDTO.getDiscounts());
    }

    @Override
    public ModelAndView getListProductPage(FilterProductRequest filter, boolean forAdmin) {
        ModelAndView modelAndView = new ModelAndView("/web/product/product-list");
        if (forAdmin) {
            modelAndView.setViewName("/admin/product/product-list");
        }
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
        setLinkToAdminPage(modelAndView);
        modelAndView.addObject("token", securityService.getToken());

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
        setLinkToAdminPage(modelAndView);
        return modelAndView;
    }

    @Override
    public ModelAndView getDetailProductByAdmin(Long id) {
        ModelAndView modelAndView = new ModelAndView("/admin/product/product-detail");
        ResponseEntity<ProductDetailDTO> productDetailDTOResponseEntity = restTemplate.exchange(APIConstant.ADMIN_URI + "/product/" + id
                , HttpMethod.GET, new HttpEntity<ProductDetailDTO>(securityService.getHeadersWithToken()), ProductDetailDTO.class);
        //todo
        if (!HttpStatus.OK.equals(productDetailDTOResponseEntity.getStatusCode())) {

        }
        ProductDetailDTO productDetailDTO = productDetailDTOResponseEntity.getBody();
        productDetailDTO.getProductDTO().getProductColorSizeDTOS().sort(Comparator.comparing(ProductColorSizeDTO::getId));
        modelAndView.addObject("product", productDetailDTO.getProductDTO());

        productDetailDTO.getColorDTOS().sort((o1, o2) -> o2.getName().compareTo(o1.getName()));
        productDetailDTO.getSizeDTOS().sort(Comparator.comparing(SizeDTO::getName));

        modelAndView.addObject("color", productDetailDTO.getColorDTOS());
        modelAndView.addObject("size", productDetailDTO.getSizeDTOS());
        modelAndView.addObject("subCategoryDTOS", productDetailDTO.getSubCategoryDTOS());
        modelAndView.addObject("discountDTOS", productDetailDTO.getDiscountDTOS());
        modelAndView.addObject("token", securityService.getToken());

        return modelAndView;
    }

    @Override
    public ModelAndView getCreateProductByAdmin() {
        ModelAndView modelAndView = new ModelAndView("/admin/product/product-create");

        InfoToCreateProductDTO infoToCreateProductDTO = restTemplate.exchange(APIConstant.ADMIN_URI + "/product/infoToCreate"
                , HttpMethod.GET, new HttpEntity<InfoToCreateProductDTO>(securityService.getHeadersWithToken()), InfoToCreateProductDTO.class).getBody();
        modelAndView.addObject("token", securityService.getToken());
        modelAndView.addObject("subCategoryDTOS", infoToCreateProductDTO.getSubCategoryDTOS());
        modelAndView.addObject("discountDTOS", infoToCreateProductDTO.getDiscountDTOS());
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

    private boolean isSameProductByColorAndSize(ItemDTO itemDTO1, ItemDTO itemDTO2) {
        return itemDTO1.getProductId().equals(itemDTO2.getProductId()) && itemDTO1.getColorId().equals(itemDTO2.getColorId())
                && itemDTO1.getSizeId().equals(itemDTO2.getSizeId());
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

    private CartDTO createCart() {
        CustomUserDetail customUserDetail = (CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CartDTO cartDTO = new CartDTO();
        cartDTO.setReceiver(customUserDetail.getFullName());
        cartDTO.setPhone(customUserDetail.getPhone());
        cartDTO.setAddress(customUserDetail.getAddress());
        cartDTO.setPaymentMethod(PaymentMethod.PAY_ON_DELIVERY);
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).setCartDTO(cartDTO);
        return cartDTO;
    }

    private void addProductToNewCart(ItemDTO itemDTO) {
        CartDTO cartDTO = createCart();
        cartDTO.getItemList().add(itemDTO);
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).setCartDTO(cartDTO);
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


    @Override
    public ModelAndView getCart() {
        ModelAndView modelAndView = new ModelAndView("/web/cart");
        setLinkToAdminPage(modelAndView);
        if (!(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof CustomUserDetail)) {
            return loginController.login("getCart");
        }
        CustomUserDetail customUserDetail = (CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CartDTO cartDTO = customUserDetail.getCartDTO();
        if (cartDTO == null) {
            return getCartWhenCartNotExist(modelAndView);
        }
        HttpEntity<?> httpEntity = new HttpEntity<Object>(cartDTO.getItemList(), securityService.getHeaders());
        ResponseEntity<ItemsForCartAndHeader> itemsForCartAndHeaderResponseEntity = restTemplate.exchange(APIConstant.WEB_URI + "/products/itemInCart"
                , HttpMethod.POST, httpEntity, ItemsForCartAndHeader.class);

        ItemsForCartAndHeader itemsForCartAndHeader = itemsForCartAndHeaderResponseEntity.getBody();
        List<ItemShowInCartDTO> itemShowInCartDTOS = itemsForCartAndHeader.getItemShowInCartDTOS().stream().peek(item -> {
            item.setVnPrice(convertToVnCurrency(item.getPrice()));
            item.setVnTotalPrice(convertToVnCurrency(item.getTotalPrice()));
        }).collect(Collectors.toList());

        //total price of cart before discount
        Long costOfCart = itemShowInCartDTOS.stream().mapToLong(ItemShowInCartDTO::getTotalPrice).sum();
        //total import price
        Long totalImportPrice = itemShowInCartDTOS.stream().mapToLong(item -> item.getImportPrice() * item.getQuantity()).sum();
        Long discountInBill = itemsForCartAndHeader.getDiscountDTOS().stream().mapToLong(DiscountDTO::getPercent).sum();

        cartDTO.setTotalMoney(costOfCart);
        cartDTO.setTotalImportMoney(totalImportPrice);
        //final money client pay
        Long finalPay = costOfCart - (costOfCart * discountInBill) / 100;
        cartDTO.setFinalPayMoney(finalPay);

        if (CollectionUtils.isEmpty(itemShowInCartDTOS)) {
            modelAndView.addObject("finalPay", convertToVnCurrency(0L));
            modelAndView.addObject("discountInBill", convertToVnCurrency(0L));
        } else {
            modelAndView.addObject("discountInBill", convertToVnCurrency((costOfCart * discountInBill) / 100));
            modelAndView.addObject("finalPay", convertToVnCurrency(finalPay));
        }

        modelAndView.addObject("itemList", itemShowInCartDTOS);
        modelAndView.addObject("costOfCart", convertToVnCurrency(costOfCart));
        modelAndView.addObject("cartDTO", cartDTO);
        setHeaderToModelAndView(modelAndView, itemsForCartAndHeaderResponseEntity.getBody().getHeaderDTO());

        return modelAndView;
    }

    private ModelAndView getCartWhenCartNotExist(ModelAndView modelAndView) {
        ResponseEntity<PageHeaderDTO> headerDTOResponseEntity = restTemplate.exchange(APIConstant.WEB_URI + "/header"
                , HttpMethod.GET, new HttpEntity<PageHeaderDTO>(securityService.getHeaders()), PageHeaderDTO.class);
        CartDTO cartDTO = createCart();
        setHeaderToModelAndView(modelAndView, headerDTOResponseEntity.getBody());
        modelAndView.addObject("finalPay", convertToVnCurrency(0L));
        modelAndView.addObject("costOfCart", convertToVnCurrency(0L));
        modelAndView.addObject("discountInBill", convertToVnCurrency(0L));
        modelAndView.addObject("cartDTO", cartDTO);
        return modelAndView;
    }

    @Override
    public void updateCart(String productIds, String quantity, String productIdsToDelete) {
        List<Long> ids = Arrays.stream(productIds.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        List<Long> quantityList = Arrays.stream(quantity.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        List<Long> productIdsToDel = Arrays.stream(productIdsToDelete.split(",")).filter(st -> !StringUtils.isEmpty(st)).map(Long::parseLong).collect(Collectors.toList());
        CartDTO cartDTO = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO();
        if (cartDTO == null) {
            return;
        }
        Set<ItemDTO> itemDTOSet = cartDTO.getItemList();
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

    @Override
    public void updateBillInfo(HttpServletRequest request) {
        CartDTO cartDTO = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO();
        cartDTO.setReceiver(request.getParameter("receiver"));
        cartDTO.setPhone(request.getParameter("phone"));
        cartDTO.setAddress(request.getParameter("address"));
        cartDTO.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("paymentMethod")));
        cartDTO.setAccountName(request.getParameter("accountName"));
        cartDTO.setAccountNumber(request.getParameter("accountNumber"));
        cartDTO.setNote(request.getParameter("note"));
        ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).setCartDTO(cartDTO);
    }

    @Override
    public void createBill() {
        CartDTO cartDTO = ((CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getCartDTO();

        ResponseEntity<CartDTO> responseEntity = restTemplate.exchange(APIConstant.WEB_URI + "/products/createBill"
                , HttpMethod.POST, new HttpEntity<CartDTO>(cartDTO, securityService.getHeadersWithToken()), CartDTO.class);
    }

    private void setLinkToAdminPage(ModelAndView modelAndView) {
        if (userService.isAdmin()) {
            modelAndView.addObject("isAdmin", true);
        }
    }


}
