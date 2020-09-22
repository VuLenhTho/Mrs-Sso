<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <%@include file="/common/web/head.jsp" %>

</head>

<body>
<div class="wrapper">
    <%@include file="/common/web/header.jsp" %>

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides" style="font-family: Helvetica,Arial">
        <ul class="slides-container">
            <c:forEach items="${welcomeSlide}" var="slide">
                <li class="text-center">
                    <img src="<c:url value="${slide.imageUrl}"/>" alt="photo">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="m-b-20"><strong>${slide.title}</strong></h1>
                                <p class="m-b-40">${slide.description}</p>
                                <p><a class="btn hvr-hover" href="#hot">Khám phá</a></p>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>

    <!-- Start Products  -->
    <div class="products-box" id="hot" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Sản phẩm nổi bật</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button id="btnXuHuong" class="active" data-filter=".top-featured">Xu hướng</button>
                            <button id="btnBanChay" data-filter=".best-seller">Bán chạy</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row special-list">
                <c:forEach items="${trendProducts}" var="trendProduct">
                    <div class="col-lg-3 col-md-6 special-grid top-featured">
                        <div class="products-single fix">
                            <a href="/product/${trendProduct.id}">

                                <div class="box-img-hover">
                                    <c:if test="${trendProduct.isDiscount == true}">
                                        <div class="type-lb">
                                            <p class="sale">Sale</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${trendProduct.isDiscount == false}">
                                        <div class="type-lb">
                                            <p class="new">Mới</p>
                                        </div>
                                    </c:if>
                                    <img src="${trendProduct.thumbnail}" class="img-fluid"
                                         alt="Image">
                                </div>

                                <div class="why-text">
                                    <h4 style=" white-space: nowrap;text-overflow: ellipsis; overflow: hidden;">${trendProduct.name}</h4>
                                    <c:if test="${trendProduct.isDiscount == true}">
                                        <p style="display: inline-block">Chỉ còn:&nbsp;</p><h4
                                            style="color: red;display: inline-block"> ${trendProduct.vnPrice}</h4>
                                    </c:if>
                                    <c:if test="${trendProduct.isDiscount != true}">
                                        <h4 style="color: black;display: inline-block"> ${trendProduct.vnPrice}</h4>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach items="${bestSaleProducts}" var="bestSale">
                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                        <div class="products-single fix">
                            <a href="/web/product/${bestSale.id}">

                                <div class="box-img-hover">
                                    <c:if test="${bestSale.isDiscount == true}">
                                        <div class="type-lb">
                                            <p class="sale">Sale</p>
                                        </div>
                                    </c:if>
                                    <img  src="${bestSale.thumbnail}" class="img-fluid"
                                         alt="Image">
                                </div>

                                <div class="why-text">
                                    <h4>${bestSale.name}</h4>
                                    <c:if test="${bestSale.isDiscount == true}">
                                        <p style="display: inline-block">Chỉ còn:&nbsp;</p>
                                        <h4 style="color: red;display: inline-block"> ${bestSale.vnPrice}</h4>
                                    </c:if>
                                    <c:if test="${bestSale.isDiscount != true}">
                                        <h4 style="color: black;display: inline-block"> ${bestSale.vnPrice}</h4>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- End Products  -->

    <%@include file="/common/web/instaggram-box.jsp" %>

    <%@include file="/common/web/footer.jsp" %>


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
    <script>
        window.onload = function () {
            var xh = document.getElementById("btnXuHuong");
            xh.click();
        }
    </script>
</div>

</body>

</html>
