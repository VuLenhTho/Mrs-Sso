<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <%@include file="/common/web/head.jsp" %>
    <style>
        div {
            font-family: Helvetica;
        }
    </style>
</head>

<body>
<%@include file="/common/web/header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Giỏ hàng</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Giỏ hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->
<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form action="" id="formItemList" method="get">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Gỡ bỏ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${itemList}" var="item">
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="/product/${item.id}">
                                            <img class="img-fluid" src="${item.thumbnail}" alt="thumbnail"/>
                                        </a>
                                    </td>
                                    <td class="name-pr">
                                        <p href="/product/${item.id}" size="20">
                                                ${item.name} <br>/ ${item.color}/ ${item.size}
                                        </p>
                                    </td>
                                    <td class="price-pr">
                                        <p>${item.vnPrice}</p>
                                    </td>
                                    <td class="quantity-box">
                                        <input type="number" size="3" value="${item.quantity}" name="quantity"
                                               id="quantity"
                                               min="1" max="100" step="1" class="c-input-text qty text">
                                        <input type="hidden" name="productId" value="${item.id}">
                                    </td>
                                    <td class="total-pr">
                                        <p>${item.vnTotalPrice}</p>
                                    </td>
                                    <td class="remove-pr">
                                        <input type="checkbox" class="check-box" name="productIdsToDelete"
                                               data-toggle="tooltip" data-placement="top"
                                               title="Chọn để xóa khỏi giỏ hàng"
                                               value="${item.id}">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${itemList == null}">
                            <p>Giỏ hàng của bạn đang trống, tiếp tục mua sắm nào!!</p>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>

        <div class="row my-5">
            <div class="col-lg-12 col-sm-12">
                <button id="btnUpdateCart" class="btn btn-danger" type="button">Cập nhật giỏ hàng</button>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-lg-6 mb-3"></div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="checkout-address">
                    <div class="title-left">
                        <h3>Thông tin đơn hàng</h3>
                    </div>
                    <form class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="firstName">Họ tên người nhận</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                            <div class="invalid-feedback"> Vui lòng điền mục này!</div>
                        </div>
                        <div class="mb-3">
                            <label for="address">Địa chỉ nhận hàng</label>
                            <input type="text" class="form-control" id="address" placeholder="" required>
                            <div class="invalid-feedback"> Vui lòng điền mục này!</div>
                        </div>
                        <div class="mb-3">
                            <label for="firstName">Số điện thoại người nhận</label>
                            <input type="text" class="form-control" id="phone" placeholder="" value="" required>
                            <div class="invalid-feedback"> Vui lòng điền mục này!</div>
                        </div>
                        <hr class="mb-4">
                        <div class="title"><span>Phương thức thanh toán</span></div>
                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input"
                                       checked required>
                                <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input"
                                       required>
                                <label class="custom-control-label" for="debit">Chuyển khoản</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input"
                                       required>
                                <label class="custom-control-label" for="paypal">Paypal</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="cc-name">Tên chủ tài khoản</label>
                                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                                <div class="invalid-feedback"> Vui lòng điền mục này!</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cc-number">Số tải khoản</label>
                                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                                <div class="invalid-feedback"> Vui lòng điền mục này!</div>
                            </div>
                        </div>
                        <hr class="mb-1">
                    </form>
                </div>
            </div>
        </div>
        <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <div class="d-flex gr-total">
                        <h5>Tổng tiền hàng</h5>
                        <p class="ml-auto h5"> ${costOfCart} </p>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="col-12 d-flex shopping-box"><a href="checkout.html" class="ml-auto btn hvr-hover">Mua hàng</a>
            </div>
        </div>
    </div>
</div>
<!-- End Cart -->

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
    $('#btnUpdateCart').click(function (e) {
        e.preventDefault();

        let productIds = "";
        let quantityString = "";
        let productIdsToDelete = "";
        let formData = $('#formItemList').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name === "productIdsToDelete") {
                productIdsToDelete = productIdsToDelete + v.value + ',';
            }
            if (v.name === "productId") {
                productIds = productIds + v.value + ',';
            }
            if (v.name === "quantity") {
                quantityString = quantityString + v.value + ',';
            }
        });
        console.log(productIds);
        console.log(quantityString);
        console.log(productIdsToDelete);
        $.get("http://localhost:8080/updateCart?productIds=" + productIds + "&quantity=" + quantityString + "&productIdsToDelete=" + productIdsToDelete, function (data, status) {
            location.reload();
        });
    });


</script>


</body>
</html>
