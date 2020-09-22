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
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;

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
                        <form action="<c:url value="/admin/reportByMonthAndYear"/>" id="formSubmit" method="get">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label" for="month">Chọn tháng
                                        </label>
                                        <div class="col-lg-9">
                                            <select class="custom-select mr-sm-2" id="month" name="month">
                                                <option value="1" selected="selected">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label" for="year">Chọn năm
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="number" id="year" name="year" min="2020" value="2020"
                                                   class="form-control mb-2" placeholder="Chọn năm..">
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <button id="btnCreateReport" type="submit" class="btn btn-rounded btn-info"><i
                                    class="fa fa-check"></i> </span>Tạo báo cáo
                            </button>
                        </form>
                        <br>
                        <br>
                        <h4 class="card-title">Báo cáo tháng ${reportData.month} năm ${reportData.year}:</h4>

                        <div class="row">
                            <div class="col-sm-7 col-lg-7">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-validation">
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="moneyFromSale">Tổng tiền thu về:</label>
                                                <div class="col-lg-9">
                                                    <p id="moneyFromSale">${reportData.vnMoneyFromSale}</p>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="interestMoney">Tổng tiền lãi:
                                                </label>
                                                <div class="col-lg-9">
                                                    <p id="interestMoney">${reportData.vnInterestMoney}</p>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-3 col-form-label" for="importMoney">Tiền nhập:
                                                </label>
                                                <div class="col-lg-9">
                                                    <p id="importMoney">${reportData.vnImportMoney}</p>
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
        <div class="row">
            <div class="col-lg-6">
                <h4 class="card-title" style="margin-left: 19px">Danh sách sản phẩm bán chạy nhất</h4>
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead class="thead-info">
                        <tr>
                            <th>Id</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Đã bán</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${reportData.bestsellerProduct}" var="item">
                            <tr>
                                <td class="price-pr">
                                    <p>${item.id}</p>
                                </td>
                                <td class="thumbnail-img">
                                    <a href="/product/${item.id}">
                                        <img class="img-fluid" src="${item.thumbnail}" alt="thumbnail"/>
                                    </a>
                                </td>
                                <td class="name-pr">
                                    <p href="/product/${item.id}" size="20">
                                            ${item.name}
                                    </p>
                                </td>
                                <td class="price-pr">
                                    <p>${item.quantity}</p>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-6">
                <h4 class="card-title" style="margin-left: 19px">Danh sách sản phẩm bán chậm nhất</h4>
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead class="thead-info">
                        <tr>
                            <th>Id</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Đã bán</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${reportData.badSellerProduct}" var="item">
                            <tr>
                                <td class="price-pr">
                                    <p>${item.id}</p>
                                </td>
                                <td class="thumbnail-img">
                                    <a href="/product/${item.id}">
                                        <img class="img-fluid" src="${item.thumbnail}" alt="thumbnail"/>
                                    </a>
                                </td>
                                <td class="name-pr">
                                    <p href="/product/${item.id}" size="20">
                                            ${item.name}
                                    </p>
                                </td>
                                <td class="price-pr">
                                    <p>${item.quantity}</p>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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

</body>

</html>
