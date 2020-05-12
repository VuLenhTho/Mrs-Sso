<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.vulenhtho.util.SecurityUtil" %>
<!-- Start Main Top -->
<div class="main-top" style="font-family: Helvetica,Arial">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="text-slid-box">
                    <div id="offer-box" class="carouselTicker">
                        <ul class="offer-box">
                            <c:forEach items="${topSale}" var="sale">
                                <li>
                                    <i class="fab fa-opencart"></i> ${sale}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="right-phone-box">
                    <p>HotLine : <a href="#">+84 353 113 548</a></p>
                </div>
                <div class="our-link">
                    <c:set value="<%=SecurityUtil.getUserName()%>" var="name"/>
                    <ul>
                        <c:if test="${name != null && name != 'anonymousUser'}">
                            <li><a href="/#">Xin chào <span><%=SecurityUtil.getUserName()%></span></a></li>
                            <li><a href="<c:url value="/logout"/>">Đăng xuất</a></li>
                        </c:if>
                        <c:if test="${name == null || name == 'anonymousUser'}">
                            <li><a href="<c:url value="/login"/>">Đăng nhập</a></li>
                            <li><a href="#">Đăng ký</a></li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Main Top -->

<!-- Start Main Top -->
<header class="main-header" style="font-family: Helvetica,Arial">
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu"
                        aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="<c:url value="/home"/>"><img
                        src="<c:url value="/shoptemplate/images/logo3.png"/>"
                        class="logo" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" style="font-family: Helvetica,Arial; font-size: 200px"
                 id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item active"><a class="nav-link" href="<c:url value="/home"/>">Trang chủ</a></li>
                    <li class="dropdown megamenu-fw">
                        <a href="<c:url value="/products"/>" class="nav-link dropdown-toggle" data-toggle="dropdown">Sản
                            phẩm</a>
                        <ul class="dropdown-menu megamenu-content" role="menu">
                            <li>
                                <div class="row">
                                    <c:forEach items="${category}" var="category">
                                        <div class="col-menu col-md-3">
                                            <h6 class="title">${category.name}</h6>
                                            <div class="content">
                                                <ul class="menu-col">
                                                    <c:forEach items="${category.subCategoryDTOS}" var="subCategory">
                                                        <li>
                                                            <a href="<c:url value="/products?subCategoryId=${subCategory.id}"/>">${subCategory.name}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- end row -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cửa hàng</a>
                        <ul class="dropdown-menu">
                            <li><a href="/cart">Giỏ hàng</a></li>
                            <li><a href="#">Giao hàng và thanh toán</a></li>
                            <li><a href="#">Chính sách bảo hành</a></li>
                            <li><a href="#contact">Giới thiệu</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">Dịch vụ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="/cart" data-toggle="tooltip" data-placement="right" title="Giỏ hàng">
                        <i class="fa fa-shopping-cart"></i>
                    </a></li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>

    </nav>
    <!-- End Navigation -->
</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<div class="top-search" style="font-family: Helvetica,Arial">
    <form action="<c:url value="/products"/>" id="formSearchHeader" method="get">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" name="search" id="search" class="form-control" placeholder="Tìm kiếm">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </form>
</div>
<!-- End Top Search -->