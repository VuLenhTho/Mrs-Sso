<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <title>Quản lý sản phẩm</title>
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
                        <button id="btnUpdateProduct" type="button" class="btn btn-rounded btn-info"><span
                                class="btn-icon-left"><i
                                class="fa fa-plus color-info"></i> </span>Cập nhật sản phẩm
                        </button>
                        <br>
                        <br>
                        <h4 class="card-title">Thông tin sản phẩm:</h4>

                        <div class="row">
                            <div class="col-sm-6 col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="id">ID
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="id"
                                                           readonly name="id" placeholder="" value="${product.id}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="name">Tên sản phẩm
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="name"
                                                           name="name" placeholder="" value="${product.name}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="importPrice">Giá nhập
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="importPrice"
                                                           name="importPrice" placeholder=""
                                                           value="${product.importPrice}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="price">Giá bán
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="price"
                                                           name="price" placeholder="" value="${product.price}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="shortDescription">Mô tả
                                                    toán
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="shortDescription"
                                                           name="shortDescription" placeholder=""
                                                           value="${product.shortDescription}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="status">Trạng thái
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="status"
                                                            name="status">
                                                        <option value="${product.status}" selected="selected">
                                                            <c:if test="${product.status == 'STOCKING'}">Còn hàng</c:if>
                                                            <c:if test="${product.status == 'OUT_OF_STOCK'}">Hết hàng</c:if>
                                                            <c:if test="${product.status == 'COMING_SOON'}">Sắp có</c:if>
                                                        </option>
                                                        <c:if test="${product.status == 'STOCKING'}">
                                                            <option value="OUT_OF_STOCK">Hết hàng</option>
                                                            <option value="COMING_SOON">Sắp có</option>
                                                        </c:if>
                                                        <c:if test="${product.status == 'OUT_OF_STOCK'}">
                                                            <option value="STOCKING">Còn hàng</option>
                                                            <option value="COMING_SOON">Sắp có</option>
                                                        </c:if>
                                                        <c:if test="${product.status == 'COMING_SOON'}">
                                                            <option value="STOCKING">Còn hàng</option>
                                                            <option value="OUT_OF_STOCK">Hết hàng</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="subCategoryDTO">Thể loại
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="subCategoryDTO"
                                                            name="subCategoryDTO">
                                                        <option value="${product.subCategoryDTO.id}"
                                                                selected="selected">
                                                            ${product.subCategoryDTO.name}
                                                        </option>
                                                        <c:forEach items="${subCategoryDTOS}" var="subCategory">
                                                            <option value="${subCategory.id}">${subCategory.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="discount">Khuyến mại
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="discount" name="discount">
                                                        <c:if test="${product.discountDTOS.size() > 0}">
                                                            <option value="${product.discountDTOS[0].id}"
                                                                    selected="selected">${product.discountDTOS[0].name}</option>
                                                            <option value="no">Không</option>
                                                            <c:forEach items="${discountDTOS}" var="discount">
                                                                <c:if test="${product.discountDTOS[0].id != discount.id}">
                                                                    <option value="${discount.id}">${discount.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${product.discountDTOS.size() < 1}">
                                                            <option value="no" selected="selected">Không</option>
                                                            <c:forEach items="${discountDTOS}" var="discount">
                                                                <option value="${discount.id}">${discount.name}</option>
                                                            </c:forEach>
                                                        </c:if>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="thumbnail">Ảnh đại diện
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="thumbnail"
                                                           name="thumbnail" placeholder=""
                                                           value="${product.thumbnail}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="photoList">Danh sách ảnh
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="photoList"
                                                           name="photoList" placeholder=""
                                                           value="${product.photoList}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="hot">Bán chạy
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="hot"
                                                            name="hot">
                                                        <option value="${product.hot}" selected="selected">
                                                            <c:if test="${product.hot == true}">Có</c:if>
                                                            <c:if test="${product.hot == false}">Không</c:if>
                                                        </option>
                                                        <c:if test="${product.hot == true}">
                                                            <option value="false">Không</option>
                                                        </c:if>
                                                        <c:if test="${product.hot == false}">
                                                            <option value="true">Có</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="trend">Xu hướng
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="trend"
                                                            name="trend">
                                                        <option value="${product.trend}" selected="selected">
                                                            <c:if test="${product.trend == true}">Có</c:if>
                                                            <c:if test="${product.trend == false}">Không</c:if>
                                                        </option>
                                                        <c:if test="${product.trend == true}">
                                                            <option value="false">Không</option>
                                                        </c:if>
                                                        <c:if test="${product.trend == false}">
                                                            <option value="true">Có</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="createdBy">Người tạo
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="createdBy"
                                                           readonly name="createdBy" placeholder=""
                                                           value="${product.createdBy}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="createdDate">Ngày tạo
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="createdDate"
                                                           readonly name="createdDate" placeholder=""
                                                           value="${product.createdDate}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="modifiedBy">Thay đổi lần
                                                    cuối
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="modifiedBy"
                                                           readonly name="lastModifiedBy" placeholder=""
                                                           value="${product.lastModifiedBy}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="modifiedDate">Thời gian thay
                                                    đổi
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="modifiedDate"
                                                           readonly name="lastModifiedDate" placeholder=""
                                                           value="${product.lastModifiedDate}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4 class="card-title">Thêm hoặc chỉnh sửa số lượng sản phẩm: </h4>
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="card" style="margin-bottom: 0px">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="color">Mã/Tên màu
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="color" name="color">
                                                        <option value="${color[0].id}" selected="selected">
                                                            ${color[0].name}
                                                        </option>
                                                        <c:forEach items="${color}" var="colorVar">
                                                            <c:if test="${colorVar.id != color[0].id}">
                                                                <option value="${colorVar.id}">${colorVar.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="size">Mã/Tên size
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="size" name="size">
                                                        <option value="${size[0].id}" selected="selected">
                                                            ${size[0].name}
                                                        </option>

                                                        <c:forEach items="${size}" var="sizeVar">
                                                            <c:if test="${sizeVar.id != size[0].id}">
                                                                <option value="${sizeVar.id}">${sizeVar.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="importPrice">Số lượng
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="quantity"
                                                           name="quantity" placeholder="" min="0"
                                                           value="1">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button id="btnAddProductColorSize" type="button" class="btn btn-rounded btn-info"><span
                                        class="btn-icon-left"><i
                                        class="fa fa-plus color-info"></i> </span>Xác nhận
                                </button>
                            </div>
                        </div>
                        <br>
                        <br>
                        <h4 class="card-title">Số lượng: </h4>
                        <form action="" id="formSubmit" method="get">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="table-responsive" style="padding: 20px">
                                        <table class="table muted-table-bordered" id="table">
                                            <thead class="thead-info">
                                            <tr>
                                                <th scope="col">Màu</th>
                                                <th scope="col">Size</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col" style="text-align: center">Xóa</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${product.productColorSizeDTOS}" var="productColorSize">
                                                <tr>
                                                    <th>${productColorSize.color}</th>
                                                    <td style="font-weight: bold">${productColorSize.size}</td>
                                                    <td style="font-weight: bold">${productColorSize.quantity}</td>
                                                        <%--action--%>
                                                    <td align="center">
                                                        <input type="checkbox" class="check-box"
                                                               name="productColorSizeId"
                                                               data-toggle="tooltip" data-html="true" title
                                                               data-original-title="<em>Chọn để xóa</em>"
                                                               value="${productColorSize.id}">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
            $('#btnUpdateProduct').click(function (e) {
                let idsToDel = "";
                let formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    if (v.name === "productColorSizeId") {
                        idsToDel = idsToDel + v.value + ',';
                    }
                });
                let discountDTO = [{id: document.getElementById("discount").value}];
                if (document.getElementById("discount").value === "no") {
                    discountDTO = [];
                }


                let productDTO = {
                    id: document.getElementById("id").value,
                    name: document.getElementById("name").value,
                    importPrice: document.getElementById("importPrice").value,
                    price: document.getElementById("price").value,
                    shortDescription: document.getElementById("shortDescription").value,
                    status: document.getElementById("status").value,
                    thumbnail: document.getElementById("thumbnail").value,
                    photoList: document.getElementById("photoList").value,
                    hot: document.getElementById("hot").value,
                    trend: document.getElementById("trend").value,
                    subCategoryDTO: {id: document.getElementById("subCategoryDTO").value},
                    discountDTOS: discountDTO
                }

                let productDetailDTO = {
                    productDTO: productDTO,
                    productColorSizeIdsToDel: idsToDel
                }

                callUpdateProduct(productDetailDTO);
            });

        $('#btnAddProductColorSize').click(function () {
            let productColorSizeDTO = {
                productId: document.getElementById("id").value,
                colorId: document.getElementById("color").value,
                sizeId: document.getElementById("size").value,
                quantity: document.getElementById("quantity").value
            }

            console.log(productColorSizeDTO);
            callAddProductColorSize(productColorSizeDTO);
        })

        function callAddProductColorSize(data) {
            let token = document.getElementById("token").value;

            $.ajax({
                url: ('http://localhost:8888/api/admin/product/addProductColorSize'),
                type: 'POST',
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
                    swal(mesTitle, {
                        icon: "error",
                    });
                }
            });
        }

        function callUpdateProduct(data) {
            let token = document.getElementById("token").value;

            $.ajax({
                url: ('http://localhost:8888/api/admin/product'),
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
                    swal(mesTitle, {
                        icon: "error",
                    });
                }
            });
        }

    </script>
</body>
</html>
