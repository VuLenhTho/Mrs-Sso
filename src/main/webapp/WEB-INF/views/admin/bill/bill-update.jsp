<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <title>Quản lý đơn hàng</title>
    <style>
        table {
            color: #000000;
            border-bottom: 1px solid black;
            border-right: 1px solid black;
        }

        div {
            font-family: Helvetica, Arial, sans-serif;
        }

    </style>

    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/style.css"/>">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/responsive.css"/>">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/shoptemplate/css/custom.css"/>">
</head>

<body class="v-light vertical-nav fix-header fix-sidebar">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>
<div id="main-wrapper">
    <%@include file="/common/admin/header.jsp" %>
    <%@include file="/common/admin/menu.jsp" %>
    <div class="content-body" style="background-color: white">


        <div class="row" style="color: #000000">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <button id="btnUpdateBill" type="button" class="btn btn-rounded btn-info"><span
                                class="btn-icon-left"><i
                                class="fa fa-plus color-info"></i> </span>Cập nhật đơn hàng
                        </button>
                        <br>
                        <br>
                        <h4 class="card-title">Chi tiết đơn hàng:</h4>

                        <div class="row">
                            <div class="col-sm-7 col-lg-7">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="id">ID
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="id"
                                                           readonly name="id" placeholder="" value="${bill.id}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="receiver">Người nhận
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="receiver"
                                                           name="receiver" placeholder="" value="${bill.receiver}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="phone">Điện thoại
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="phone"
                                                           name="phone" placeholder="" value="${bill.phone}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="address">Địa chỉ
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="address"
                                                           name="address" placeholder="" value="${bill.address}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="id">Phương thức thanh
                                                    toán
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="paymentMethod"
                                                            name="paymentMethod">
                                                        <option value="${bill.paymentMethod}" selected="selected">
                                                            <c:if test="${bill.paymentMethod == 'PAY_ON_DELIVERY'}">Ship COD</c:if>
                                                            <c:if test="${bill.paymentMethod == 'PAY_BY_TRANSFER'}">Chuyển khoản</c:if>
                                                        </option>
                                                        <c:if test="${bill.paymentMethod == 'PAY_ON_DELIVERY'}">
                                                            <option value="PAY_BY_TRANSFER">Chuyển khoản</option>
                                                        </c:if>
                                                        <c:if test="${bill.paymentMethod == 'PAY_BY_TRANSFER'}">
                                                            <option value="PAY_ON_DELIVERY">Ship COD</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="accName">Chủ tài khoản
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="accName"
                                                           name="accName" placeholder="" value="${accName}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="accNumber">Số tài khoản
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="accNumber"
                                                           name="accNumber" placeholder="" value="${accNumber}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5 col-lg-5">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="id1">Tổng tiền
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="id1"
                                                           readonly name="vnFinalPayMoney" placeholder=""
                                                           value="${bill.vnFinalPayMoney}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="createdBy">Người tạo
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="createdBy"
                                                           readonly name="createdBy" placeholder=""
                                                           value="${bill.createdBy}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="createdDate">Ngày tạo
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="createdDate"
                                                           readonly name="createdDate" placeholder=""
                                                           value="${bill.createdDate}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="modifiedBy">Thay đổi lần
                                                    cuối
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="modifiedBy"
                                                           readonly name="lastModifiedBy" placeholder=""
                                                           value="${bill.lastModifiedBy}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="modifiedDate">Thời gian
                                                    thay đổi
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="modifiedDate"
                                                           readonly name="lastModifiedDate" placeholder=""
                                                           value="${bill.lastModifiedDate}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="status">Trạng thái
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="status" name="status">
                                                        <option selected="selected" value="${bill.status}">
                                                            <c:if test="${bill.status=='INIT'}">Đơn mới</c:if>
                                                            <c:if test="${bill.status=='CHECKING'}">Đang kiểm tra</c:if>
                                                            <c:if test="${bill.status=='CONFIRMED'}">Đã xác nhận</c:if>
                                                            <c:if test="${bill.status=='SHIPPING'}">Đang vận chuyển</c:if>
                                                            <c:if test="${bill.status=='RETURNED'}">Bị trả lại</c:if>
                                                            <c:if test="${bill.status=='FINISH'}">Hoàn thành</c:if>
                                                        </option>
                                                        <c:if test="${bill.status=='INIT'}">
                                                            <option value="CHECKING">Đang kiểm tra</option>
                                                            <option value="CONFIRMED">Đã xác nhận</option>
                                                            <option value="SHIPPING">Đang vận chuyển</option>
                                                            <option value="RETURNED">Bị trả lại</option>
                                                            <option value="FINISH">Hoàn thành</option>
                                                        </c:if>
                                                        <c:if test="${bill.status=='CHECKING'}">
                                                            <option value="INIT">Đơn mới</option>
                                                            <option value="CONFIRMED">Đã xác nhận</option>
                                                            <option value="SHIPPING">Đang vận chuyển</option>
                                                            <option value="RETURNED">Bị trả lại</option>
                                                            <option value="FINISH">Hoàn thành</option>
                                                        </c:if>
                                                        <c:if test="${bill.status=='CONFIRMED'}">
                                                            <option value="INIT">Đơn mới</option>
                                                            <option value="CHECKING">Đang kiểm tra</option>
                                                            <option value="SHIPPING">Đang vận chuyển</option>
                                                            <option value="RETURNED">Bị trả lại</option>
                                                            <option value="FINISH">Hoàn thành</option>
                                                        </c:if>
                                                        <c:if test="${bill.status=='SHIPPING'}">
                                                            <option value="INIT">Đơn mới</option>
                                                            <option value="CHECKING">Đang kiểm tra</option>
                                                            <option value="CONFIRMED">Đã xác nhận</option>
                                                            <option value="RETURNED">Bị trả lại</option>
                                                            <option value="FINISH">Hoàn thành</option>
                                                        </c:if>
                                                        <c:if test="${bill.status=='RETURNED'}">
                                                            <option value="INIT">Đơn mới</option>
                                                            <option value="CHECKING">Đang kiểm tra</option>
                                                            <option value="CONFIRMED">Đã xác nhận</option>
                                                            <option value="SHIPPING">Đang vận chuyển</option>
                                                            <option value="FINISH">Hoàn thành</option>
                                                        </c:if>
                                                        <c:if test="${bill.status=='FINISH'}">
                                                            <option value="INIT">Đơn mới</option>
                                                            <option value="CHECKING">Đang kiểm tra</option>
                                                            <option value="CONFIRMED">Đã xác nhận</option>
                                                            <option value="SHIPPING">Đang vận chuyển</option>
                                                            <option value="RETURNED">Bị trả lại</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="note">Ghi chú
                                                </label>
                                                <div class="col-lg-9">
                                                        <textarea type="text" class="form-control" id="note" rows="3"
                                                                  name="note" placeholder="">${bill.note}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button style="margin-left: 19px" id="btnAddItem" type="button" class="btn btn-rounded btn-info"><span
                class="btn-icon-left"><i
                class="fa fa-plus color-info"></i> </span>Thêm sản phẩm
        </button>
        <div class="row">
            <div class="col-sm-7 col-lg-7">
                <div class="card">
                    <div class="card-body">
                        <div class="form-validation">
                            <div class="form-group row">
                                <div class="col-sm-6 col-lg-6">
                                    <div class="row">
                                        <label class="col-lg-3 col-form-label" for="addProductId">Mã/ Tên sản phẩm
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="addProductId"
                                                   name="addProductId" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-6">
                                    <div class="row">
                                        <label class="col-lg-3 col-form-label" for="addProductQuantity">
                                            Số lượng
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="number" class="form-control" id="addProductQuantity"
                                                   name="addProductQuantity" placeholder="" max="50" min="1" step="1"
                                                   value="1">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 col-lg-6">
                                    <div class="row">
                                        <label class="col-lg-3 col-form-label" for="addProductColor">
                                            Mã/Tên màu
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="addProductColor"
                                                   name="addProductColor" placeholder="" value="">
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-6 col-lg-6">
                                    <div class="row">
                                        <label class="col-lg-3 col-form-label" for="addProductSize">
                                            Mã/Tên Size
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="addProductSize"
                                                   name="addProductSize" placeholder="" value="">
                                        </div>
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h4 class="card-title" style="margin-left: 19px">Danh sách sản phẩm</h4>
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
                                <th style="text-align: center">Thành tiền</th>
                                <th style="text-align: center">Gỡ bỏ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bill.itemDTOS}" var="item">
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="/product/${item.productId}">
                                            <img class="img-fluid" src="${item.thumbnail}" alt="thumbnail"/>
                                        </a>
                                    </td>
                                    <td class="name-pr">
                                        <p href="/product/${item.productId}" size="20">
                                                ${item.productName} <br>/ ${item.color}/ ${item.size}
                                        </p>
                                    </td>
                                    <td class="price-pr">
                                        <p>${item.vnPrice}</p>
                                    </td>
                                    <td class="quantity-box">
                                        <input type="number" value="${item.quantity}" name="quantity"
                                               min="1" max="100" step="1" class="c-input-text qty text">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                    </td>
                                    <td class="total-pr" style="text-align: center">
                                        <p>${item.vnTotalPrice}</p>
                                    </td>
                                    <td class="remove-pr">
                                        <input type="checkbox" class="check-box" name="productIdsToDelete"
                                               data-toggle="tooltip" data-placement="top"
                                               title="Chọn để xóa khỏi giỏ hàng"
                                               value="${item.productId}">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>

            </div>
        </div>


        <input type="hidden" value="${token}" id="token">
        <%@include file="/common/admin/footer.jsp" %>


    </div>


    <!-- Common JS -->
    <script src="<c:url value="/template/assets/plugins/common/common.min.js"/>"></script>
    <!-- Custom script -->
    <script src="<c:url value="/template/js/custom.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/bootstrap-wysihtml5.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-init.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.js"/>"></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.min.js"/>"></script>
    <script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>

        <script>
            document.getElementById("btnUpdateBill").onclick = function () {
                let paymentMethod = document.getElementById("paymentMethod").value;
                let accName = document.getElementById("accName").value;
                let accNumber = document.getElementById("accNumber").value;
                let receiver = document.getElementById("receiver").value;
                let phone = document.getElementById("phone").value;
                let address = document.getElementById("address").value;
                let textErr = "";

                if (paymentMethod === "PAY_BY_TRANSFER" && (!accName || !accNumber)) {
                    textErr = "Hãy điền thông tin tài khoản thanh toán !!"
                } else if (!receiver) {
                    textErr = "Hãy điền tên người nhận!!"
                } else if (!phone) {
                    textErr = "Hãy điền số điện thoại người nhận!!"
                } else if (!address) {
                    textErr = "Hãy điền địa chỉ giao hàng!!"
                }
                if (textErr !== "") {
                    swal(textErr, {
                        icon: "error",
                    });
                } else {
                    updateBill();
                }
            }

            document.getElementById("btnAddItem").onclick = function () {
                addItem();
            }

            function updateBill() {
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

                let paymentInfo = document.getElementById("accName").value + "," + document.getElementById("accNumber").value;

                let billDTO = {
                    id: document.getElementById("id").value,
                    receiver: document.getElementById("receiver").value,
                    phone: document.getElementById("phone").value,
                    address: document.getElementById("address").value,
                    note: document.getElementById("note").value,
                    paymentMethod: document.getElementById("paymentMethod").value,
                    paymentInfo: paymentInfo,
                    status: document.getElementById("status").value
                }

                let updateBillDTO = {
                    billDTO: billDTO,
                    productIdsToDel: productIdsToDelete,
                    productIds: productIds,
                    quantityOfProducts: quantityString
                }

                callUpdateBill(updateBillDTO)
            }

            function addItem() {
                let product = document.getElementById("addProductId").value;
                let color = document.getElementById("addProductColor").value;
                let size = document.getElementById("addProductSize").value;
                let quantity = document.getElementById("addProductQuantity").value;
                let billId = document.getElementById("id").value;
                let token = document.getElementById("token").value;

                let data = {
                    productInfo: product,
                    colorInfo: color,
                    sizeInfo: size,
                    quantity: quantity,
                    billId: billId
                }

                $.ajax({
                    url: ('http://localhost:8888/api/admin/bill/addItem'),
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'text',
                    headers: {
                        Authorization: token
                    },
                    success: function () {
                        swal({
                            title: "Thêm sản phẩm thành công",
                            icon: "success",
                        })
                            .then((value) => {
                                location.reload();
                            });

                    },
                    error: function (xhr, textStatus, errorThrown) {
                        let message = "Thêm sản phẩm thất bại, có lỗi xảy ra";
                        switch (xhr.status) {
                            case 400:
                                if (xhr.responseText === 'NotEnoughProductQuantity') {
                                    message = "Không đủ số lượng sản phẩm trong kho, hãy kiểm tra lại !!";
                                }
                                break;
                            case 404:
                                if (xhr.responseText === 'NotFound') {
                                    message = "Không tìm thấy sản phẩm, hãy kiểm tra lại !!";
                                }
                                break;
                        }
                        swal(message, {
                            icon: "error",
                        });
                    }
                });
            }


            function callUpdateBill(data) {
                let token = document.getElementById("token").value;

                $.ajax({
                    url: ('http://localhost:8888/api/admin/bill'),
                    type: 'PUT',
                    contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'text',
                headers: {
                    Authorization: token
                },
                    success: function () {
                        swal({
                            title: "Cập nhật thành công",
                            icon: "success",
                        })
                            .then((value) => {
                                location.reload();
                            });
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        let mesTitle = "Cập nhật thất bại, có lỗi xảy ra";
                        let message = "";
                        switch (xhr.status) {
                            case 400:
                                if (xhr.responseText === 'CanNotChangeQuantityAfterCONFIRMEDStatus') {
                                    mesTitle = "Không thể thay đổi số lượng sản phẩm sau khi xác nhận đơn hàng !!";
                                    message = "Hãy chuyển trạng thái đơn hàng về đơn mới hoặc đang kiểm tra và thay đổi số lượng !!"
                                }
                                if (xhr.responseText === 'PriceHasChanged') {
                                    mesTitle = "Không thể thay đổi số lượng sản phẩm vì giá đã thay đổi !!";
                                }
                                break;
                        }
                        swal(mesTitle, {
                            text: message,
                            icon: "error",
                        });
                    }
                });
            }


        </script>

</body>
</html>
