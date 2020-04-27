<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <%@include file="/common/web/head.jsp" %>
</head>

<body>
<%@include file="/common/web/header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box" style="font-family: Helvetica">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2></h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<c:url value="/home"/>">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a
                            href="<c:url value="/products?subCategoryId=${product.subCategoryDTO.id}"/>">${product.subCategoryDTO.name}</a>
                    </li>
                    <li class="breadcrumb-item active">${product.name}</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Detail  -->
<div class="shop-detail-box-main" style="font-family: Helvetica,Arial">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-5 col-md-6">
                <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active"> <img class="d-block w-100" src="${bigImg[0]}" alt="First slide"> </div>
                        <c:forEach items="${bigImg}" var="img">
                            <c:if test="${img != bigImg[0]}">
                                <div class="carousel-item"> <img class="d-block w-100" src="${img}" alt="First slide"> </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                            <img class="d-block w-100 img-fluid" src="${smImg[0]}" alt="" />
                        </li>
                        <c:forEach items="${smImg}" var="img">
                            <c:if test="${img != smImg[0]}">
                                <li data-target="#carousel-example-1" data-slide-to="1">
                                    <img class="d-block w-100 img-fluid" src="${img}" alt="" />
                                </li>
                            </c:if>
                        </c:forEach>

                    </ol>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7 col-md-6" style="font-family: Helvetica,Arial">
                <div class="single-product-details">
                    <h2>${product.name}</h2>
                    <c:if test="${product.discountDTOS.size() < 1}">
                        <h5> ${product.vnPrice}</h5>
                        <h4>Mô tả sản phẩm:</h4>
                        <p>${product.shortDescription}</p>
                    </c:if>
                    <c:if test="${product.discountDTOS.size() > 0}">
                        <h5>
                            <del>${product.vnOriginalPrice}</del>
                                ${product.vnOriginalPrice}
                        </h5>
                        <h4>Khuyến mại:</h4>
                        <c:forEach items="${product.discountDTOS}" var="discount">
                            <p>- ${discount.content}</p>
                        </c:forEach>
                        <h4>Mô tả sản phẩm:</h4>
                        <p>${product.shortDescription}</p>
                    </c:if>

                    <ul>
                        <li>
                            <div class="form-group size-st">
                                <label class="size-label">Size</label>
                                <select id="size"  class="selectpicker show-tick form-control">
                                    <option value="0" selected="selected">Chọn size</option>
                                    <c:forEach items="${product.sizeDTOS}" var="size">
                                        <option value="${size.id}">${size.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <p>Trạng thái: <h5 id="status"></h5></p>

                        </li>
                        <li>
                            <div class="form-group size-st">
                                <label class="size-label">Màu</label>
                                <select id="color" class="selectpicker show-tick form-control" >
                                    <option value="0" selected="selected">Chọn màu</option>
                                    <c:forEach items="${product.colorDTOS}" var="color">
                                        <option value="${color.id}">${color.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </li>

                        <li>
                            <div class="form-group quantity-box">
                                <label class="control-label">Số lượng</label>
                                <input class="form-control" id="amount" value="0" max="30" min="0" type="number">
                            </div>
                        </li>
                    </ul>
                    <div class="price-box-bar">
                        <div class="cart-and-bay-btn">
                            <a class="btn hvr-hover" data-fancybox-close="" href="#">Thêm vào giỏ hàng</a>
                        </div>
                    </div>

                    <div class="add-to-btn">
                        <div class="add-comp">
                            <a class="btn hvr-hover" href="#">Tư vấn trực tiếp: +84 353 113 548</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="row my-5">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Sản phẩm tương tự</h1>
                </div>
                <div class="featured-products-box owl-carousel owl-theme">
                    <c:forEach items="${sameCategoryProducts}" var="product">
                        <a href="/product/${product.id}">
                            <div class="item">
                                <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <img src="${product.thumbnail}" class="img-fluid" alt="Image">
                                    </div>
                                    <div class="why-text">
                                        <h4>${product.name}</h4>
                                        <c:if test="${product.isDiscount == true}">
                                            <p style="display: inline-block">
                                                <del>${product.originalPrice}</del>
                                                Chỉ còn:&nbsp;
                                            </p>
                                            <h4 style="color: red;display: inline-block"> ${product.vnPrice}</h4>
                                        </c:if>
                                        <c:if test="${product.isDiscount != true}">
                                            <h5>${product.vnPrice}</h5>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- End Cart -->

<!-- Start Instagram Feed  -->
<%@include file="/common/web/instaggram-box.jsp" %>
<!-- End Instagram Feed  -->

<%@include file="/common/web/footer.jsp" %>
<%--<script src="<c:url value="/template/assets/plugins/common/common.min.js"/>"></script>--%>

<!-- ALL JS FILES -->
<script src="<c:url value="/shoptemplate/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/popper.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootstrap.min.js"/>"></script>
<!-- ALL PLUGINS -->
<script src="<c:url value="/shoptemplate/js/jquery.superslides.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/inewsticker.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/bootsnav.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/images-loded.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/isotope.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/baguetteBox.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/form-validator.min.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/contact-form-script.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/custom.js"/>"></script>
<%--<script src="https://code.jquery.com/jquery-latest.js"></script>--%>

<script>
    var size = document.getElementById("size").value;
    var color = document.getElementById("color").value;
    var sizes = ${sizes};
    var colors = ${colors};
    var quantity = ${quantity};
    var productStatus = '${productStatus}';
    var productStatusMessage = document.getElementById("status");
    handleStatus();

    $(function () {
        $('#color').change(function () {
            color = this.value;
            handleStatus();
        });
        $('#size').change(function () {
            size = this.value;
            handleStatus();
        });

    });

    function handleStatus() {
        if (productStatus === 'COMING_SOON') {
            productStatusMessage.innerHTML = "Sắp có";
            return;
        }
        if (productStatus === 'OUT_OF_STOCK') {
            productStatusMessage.innerHTML = "Hết hàng";
            return;
        }
        if (size == 0 || color == 0) {
            productStatusMessage.innerHTML = "";
            return;
        }
        for (var i = 0; i < sizes.length; i++) {
            if (sizes[i] == size && colors[i] == color && quantity[i] > 0) {
                productStatusMessage.innerHTML = "Còn hàng";
                return;
            }
        }
        productStatusMessage.innerHTML = "Hết hàng";
    }
</script>
</body>

</html>
