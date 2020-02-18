<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <%@include file="/common/web/head.jsp" %>
    <%--<script src="https://code.jquery.com/jquery-latest.js"></script>--%>

</head>

<body>
<%@include file="/common/web/header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container" style="font-family: Helvetica,Arial">
        <div class="row">
            <div class="col-lg-12">
                <h2>Shop</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/web">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Sản phẩm</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Page  -->
<div class="shop-box-inner" style="font-family: Helvetica,Arial">
    <form action="<c:url value="/web/products"/>" id="formSubmit" method="get">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <c:if test="${filter.search != null}">
                                <input class="form-control" placeholder="Tìm kiếm..." type="text" value="${filter.search}" name="search">
                            </c:if>
                            <c:if test="${filter.search == null}">
                                <input class="form-control" placeholder="Tìm kiếm..." type="text" name="search">
                            </c:if>
                            <button type="submit" id="searchButton"><i class="fa fa-search"></i></button>

                            <input  type="hidden" name="sex" value="${filter.sex}" id="sex">
                            <input  type="hidden" name="categoryId" value="${filter.categoryId}" id="categoryId">
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Thể loại</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree"
                                 id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men1"
                                       data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">Nam
                                    </a>
                                    <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <a href="/web/products?categoryId=1&sex=men"
                                               class="list-group-item list-group-item-action">Áo phông
                                            </a>
                                            <a href="/web/products?categoryId=7&sex=men"
                                               class="list-group-item list-group-item-action">Áo sơ mi
                                            </a>
                                            <a href="/web/products?categoryId=3&sex=men"
                                               class="list-group-item list-group-item-action">Quần jean
                                            </a>
                                            <a href="/web/products?categoryId=2&sex=men"
                                               class="list-group-item list-group-item-action">Áo khoác</a>
                                            <a href="/web/products?categoryId=5&sex=men"
                                               class="list-group-item list-group-item-action">Hoodie</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men2"
                                       data-toggle="collapse" aria-expanded="true" aria-controls="sub-men2">Nữ
                                    </a>
                                    <div class="collapse show" id="sub-men2" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <a href="/web/products?categoryId=1&sex=women"
                                               class="list-group-item list-group-item-action">Áo phông
                                            </a>
                                            <a href="/web/products?categoryId=2&sex=women"
                                               class="list-group-item list-group-item-action">Áo khoác
                                            </a>
                                            <a href="/web/products?categoryId=3&sex=women"
                                               class="list-group-item list-group-item-action">Quần jean
                                            </a>
                                            <a href="/web/products?categoryId=5&sex=women"
                                               class="list-group-item list-group-item-action">Hoodie
                                            </a>
                                            <a href="/web/products?categoryId=6&sex=women"
                                               class="list-group-item list-group-item-action">Chân váy
                                            </a>
                                            <a href="/web/products?categoryId=4&sex=women"
                                               class="list-group-item list-group-item-action">Váy
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right"
                     style="font-family: Helvetica,Arial">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sắp xếp</span>
                                    <select id="sort" class="selectpicker show-tick form-control" name="sort"
                                            data-placeholder="$ USD">
                                        <option data-display="Select" selected="selected" value="${filter.sort}">
                                            <c:if test="${filter.sort=='date-des'}">Mới nhất</c:if>
                                            <c:if test="${filter.sort=='hot-des'}">Bán chạy</c:if>
                                            <c:if test="${filter.sort=='price-des'}">Giá giảm dần</c:if>
                                            <c:if test="${filter.sort=='price-asc'}">Giá tăng dần</c:if>
                                        </option>
                                        <c:if test="${filter.sort=='date-des'}">
                                            <option value="hot-des">Bán chạy</option>
                                            <option value="price-des">Giá giảm dần</option>
                                            <option value="price-asc">Giá tăng dần</option>
                                        </c:if>
                                        <c:if test="${filter.sort=='hot-des'}">
                                            <option value="date-des">Mới nhất</option>
                                            <option value="price-des">Giá giảm dần</option>
                                            <option value="price-asc">Giá tăng dần</option>
                                        </c:if>
                                        <c:if test="${filter.sort=='price-des'}">
                                            <option value="date-des">Mới nhất</option>
                                            <option value="hot-des">Bán chạy</option>
                                            <option value="price-asc">Giá tăng dần</option>
                                        </c:if>
                                        <c:if test="${filter.sort=='price-asc'}">
                                            <option value="date-des">Mới nhất</option>
                                            <option value="hot-des">Bán chạy</option>
                                            <option value="price-des">Giá giảm dần</option>
                                        </c:if>
                                    </select>
                                </div>

                            </div>

                        </div>

                        <div class="row product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                        <c:forEach items="${data.products}" var="product">

                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                <a href="/web/product/${product.id}">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <c:if test="${product.discount.size()>0}">
                                                                <div class="type-lb">
                                                                    <p class="sale">Sale</p>
                                                                </div>
                                                            </c:if>

                                                            <img src="${product.thumbnail}" class="img-fluid"
                                                                 alt="Image">

                                                        </div>
                                                        <div class="why-text">
                                                            <h4>${product.name}</h4>
                                                            <c:if test="${product.discount.size()>0}">
                                                                <h6 style="display: inline-block">Chỉ còn:&nbsp;</h6><h5
                                                                    style="color: red;display: inline-block"> ${product.price}</h5>
                                                            </c:if>
                                                            <c:if test="${product.discount.size()<1}">
                                                                <h5>${product.price}</h5>
                                                            </c:if>
                                                            <%--<a href="/web/addToCart?productId=12"> cart</a>--%>
                                                        </div>
                                                    </div>
                                                </a>

                                            </div>

                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="1" id="page" name="page">
                    <input type="hidden" value="12" id="size" name="size">
                </div>
            </div>
        </div>
    </form>

</div>
<!-- End Shop Page -->

<!-- Start Instagram Feed  -->
<%@include file="/common/web/instaggram-box.jsp" %>
<!-- End Instagram Feed  -->

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
<script src="<c:url value="/shoptemplate/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/shoptemplate/js/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
<script src="<c:url value="/template/paging/jquery.twbsPagination.min.js"/>"></script>
<script>
    $(function () {
        $('#sort').change(function () {
            $('#formSubmit').submit();
        });
    });
</script>
<script type="text/javascript">
    var totalPages = ${data.totalPages};
    var currentPage = ${data.currentPage+1};
    var limit = 12;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            limit: 12,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#size').val(limit);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        })
    });
</script>
</body>

</html>