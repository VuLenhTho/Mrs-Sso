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
            <li class="text-left">
                <img src="<c:url value="/shoptemplate/images/banner-01.jpg"/>" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Thời trang thu đông <br>SnowQueen</strong></h1>
                            <p class="m-b-40">Sản phẩm mới 2019</p>
                            <p><a class="btn hvr-hover" href="#">Xem ngay</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="<c:url value="/shoptemplate/images/banner-02.jpg"/>" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Phong cách quý ông </strong></h1>
                            <p class="m-b-40">Lịch lãm và sang trọng</p>
                            <p><a class="btn hvr-hover" href="#">Khám phá</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="<c:url value="/shoptemplate/images/banner-03.jpg"/>" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Trẻ trung và năng động </strong></h1>
                            <p class="m-b-40">Thể hiện cá tính của riêng bạn</p>
                            <p><a class="btn hvr-hover" href="#">Khám phá</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>

    <!-- Start Products  -->
    <div class="products-box" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif">
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
                <c:forEach items="${trendProducts}" var="trend">
                    <div class="col-lg-3 col-md-6 special-grid top-featured">
                        <a href="/web/product/${trend.id}">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <c:if test="${trend.discount.size()>0}">
                                        <div class="type-lb">
                                            <p class="sale">Sale</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${trend.discount.size()<1}">
                                        <div class="type-lb">
                                            <p class="new">Mới</p>
                                        </div>
                                    </c:if>
                                    <img src="${trend.thumbnail}" class="img-fluid"
                                         alt="Image">
                                </div>

                                <div class="why-text">
                                    <h4>${trend.name}</h4>
                                    <c:if test="${trend.discount.size()>0}">
                                        <h6 style="display: inline-block">Chỉ còn:&nbsp;</h6><h5
                                            style="color: red;display: inline-block"> ${trend.price}</h5>
                                    </c:if>
                                    <c:if test="${trend.discount.size()<1}">
                                        <h5>${trend.price}</h5>
                                    </c:if>
                                </div>

                            </div>
                        </a>
                    </div>
                </c:forEach>

                <c:forEach items="${bestSaleProducts}" var="bestSale">
                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                        <a href="/web/product/${bestSale.id}">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <c:if test="${bestSale.discount.size()>0}">
                                        <div class="type-lb">
                                            <p class="sale">Sale</p>
                                        </div>
                                    </c:if>
                                    <img src="${bestSale.thumbnail}" class="img-fluid"
                                         alt="Image">
                                </div>

                                <div class="why-text">
                                    <h4>${bestSale.name}</h4>
                                    <c:if test="${bestSale.discount.size()>0}">
                                        <h6 style="display: inline-block">Chỉ còn:&nbsp;</h6><h5
                                            style="color: red;display: inline-block"> ${bestSale.price}</h5>
                                    </c:if>
                                    <c:if test="${bestSale.discount.size()<1}">
                                        <h5>${bestSale.price}</h5>
                                    </c:if></div>

                            </div>
                        </a>
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
