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
                        <button id="btnAddProduct" type="button" class="btn btn-rounded btn-info"><span
                                class="btn-icon-left"><i
                                class="fa fa-plus color-info"></i> </span>Tạo sản phẩm
                        </button>
                        <br>
                        <br>
                        <h4 class="card-title">Hãy điền thông tin sản phẩm:</h4>

                        <div class="row">
                            <div class="col-sm-6 col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="name">Tên sản phẩm
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="name"
                                                           name="name" placeholder="" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="importPrice">Giá nhập
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="importPrice"
                                                           name="importPrice" placeholder=""
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="price">Giá bán
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="number" class="form-control" id="price"
                                                           name="price" placeholder="" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="shortDescription">Mô tả ngắn
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="shortDescription"
                                                           name="shortDescription" placeholder=""
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="status">Trạng thái
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="status"
                                                            name="status">
                                                        <option value="STOCKING" selected="selected">Còn hàng</option>
                                                        <option value="OUT_OF_STOCK">Hết hàng</option>
                                                        <option value="COMING_SOON">Sắp có</option>
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
                                                           name="thumbnail" placeholder="Điền liên kết đến ảnh"
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="photoList">Danh sách ảnh
                                                </label>
                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="photoList"
                                                           name="photoList"
                                                           placeholder="Danh sách ảnh, ngăn cách bởi dấu ','"
                                                           value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="hot">Bán chạy
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="hot" name="hot">
                                                        <option value="false" selected="selected">Không</option>
                                                        <option value="true">Có</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="trend">Xu hướng
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="trend" name="trend">
                                                        <option value="false" selected="selected">Không</option>
                                                        <option value="true">Có</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="subCategoryDTO">Thể loại
                                                </label>
                                                <div class="col-lg-9">
                                                    <select class="form-control" id="subCategoryDTO"
                                                            name="subCategoryDTO">
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
                                                        <option value="no" selected="selected">Không</option>
                                                        <c:forEach items="${discountDTOS}" var="discount">
                                                            <option value="${discount.id}">${discount.name}</option>
                                                        </c:forEach>
                                                    </select>
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
            $('#btnAddProduct').click(function (e) {
                let discountDTO = [{id: document.getElementById("discount").value}];
                if (document.getElementById("discount").value === "no") {
                    discountDTO = [];
                }
                let productDTO = {
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

                callAddProduct(productDTO);
            });

            function callAddProduct(data) {
                let token = document.getElementById("token").value;

                $.ajax({
                    url: ('http://localhost:8888/api/admin/product'),
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'text',
                headers: {
                    Authorization: token
                },
                success: function (data) {
                    swal({
                        title: "Thêm sản phẩm thành công",
                        icon: "success",
                    })
                        .then((value) => {
                            window.location.href = "http://localhost:8080/admin/product/" + data;
                        });
                },
                error: function (xhr, textStatus, errorThrown) {
                    let mesTitle = "Thêm sản phẩm thất bại, có lỗi xảy ra";
                    swal(mesTitle, {
                        icon: "error",
                    });
                }
            });
        }

    </script>
</body>
</html>
