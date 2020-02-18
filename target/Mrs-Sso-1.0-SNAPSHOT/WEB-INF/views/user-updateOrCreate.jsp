<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <c:if test="${user == null}">
        <title>Thêm tài khoản</title>
    </c:if>
    <title>Cập nhật tài khoản</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/template/assets/images/favicon.png"/>">
    <!-- wysihtml5 -->
    <link rel="stylesheet" href="<c:url value="/template/assets/plugins/wysihtml5/css/bootstrap-wysihtml5.css"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/template/css/style.css"/>" rel="stylesheet">
    <script src="<c:url value="/template/js/modernizr-3.6.0.min.js"/>"></script>
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
    <div class="content-body">
        <div class="container">
            <div class="row page-titles">
                <div class="col p-0">
                    <h5>Vui lòng điền đầy đủ thông tin theo mẫu dưới đây!</h5>
                </div>
                <div class="col p-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/users">Quản lý người dùng</a>
                        </li>
                        <li class="breadcrumb-item active">Thêm tài khoản</li>
                    </ol>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-validation">


                                <form id="formUpdateOrCreate">
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Tài khoản <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="val-username" name="userName"
                                                   maxlength="25" placeholder="Enter a username.."
                                                   value="${user.userName}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Mật khẩu <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="password" class="form-control" id="Password"
                                                   maxlength="20" name="password" placeholder="Enter a Password..">
                                        </div>
                                    </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-username"> Xác nhận mật khẩu
                                                <span
                                                        class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="ConfirmPassword"
                                                       maxlength="20" name="ConfirmPassword"
                                                       placeholder="Confirm Password..">
                                            </div>
                                        </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Họ tên <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="fullName" name="fullName"
                                                   maxlength="30" placeholder="Enter a Full Name.."
                                                   value="${user.fullName}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Email <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="email" name="email"
                                                   maxlength="30" placeholder="Enter a Email.." value="${user.email}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Điện thoại <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="number" class="form-control" id="phone" name="phone"
                                                   maxlength="15" placeholder="Enter a Phone.." value="${user.phone}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Giới tính <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <c:if test="${user == null}">
                                                <select class="form-control" id="sex" name="sex">
                                                    <option value="true" selected="selected">Nam</option>
                                                    <option value="false">Nữ</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${user!= null}">
                                                <select class="form-control" id="sex" name="sex">
                                                    <option value="${user.sex}" selected="selected">
                                                        <c:if test="${user.sex == true}">Nam</c:if>
                                                        <c:if test="${user.sex == false}">Nữ</c:if>
                                                    </option>
                                                    <c:if test="${user.sex == false}">
                                                        <option value="true"> Nam</option>
                                                    </c:if>
                                                    <c:if test="${user.sex == true}">
                                                        <option value="false"> Nữ</option>
                                                    </c:if>
                                                </select>
                                            </c:if>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Trạng thái<span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <c:if test="${user == null}">
                                                <select class="form-control" id="status" name="status">
                                                    <option value="true" selected="selected">Hoạt động</option>
                                                    <option value="false">Khóa</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${user!= null}">
                                                <select class="form-control" id="status" name="status">
                                                    <option value="${user.status}" selected="selected">
                                                        <c:if test="${user.status == true}">Hoạt động</c:if>
                                                        <c:if test="${user.status == false}">Khóa</c:if>
                                                    </option>
                                                    <c:if test="${user.status == false}">
                                                        <option value="true">Hoạt động</option>
                                                    </c:if>
                                                    <c:if test="${user.status == true}">
                                                        <option value="false">Khóa</option>
                                                    </c:if>
                                                </select>
                                            </c:if>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Quyền<span
                                                class="text-danger">*</span>
                                        </label>

                                    </div>
                                    <c:set value="${true}" var="show"/>
                                    <c:forEach items="${roles}" var="role">
                                        <c:if test="${user == null}">
                                            <c:if test="${role.name == 'ROLE_USER'}">
                                                <p>
                                                    <label>
                                                        <input type="checkbox" class="check-box" name="ids"
                                                               checked="checked" value="${role.id}">
                                                    </label> ${role.description}
                                                </p>
                                            </c:if>
                                            <c:if test="${role.name != 'ROLE_USER'}">
                                                <p>
                                                    <label>
                                                        <input type="checkbox" class="check-box" name="ids"
                                                               value="${role.id}">
                                                    </label> ${role.description}
                                                </p>
                                            </c:if>

                                        </c:if>

                                        <c:if test="${user != null}">
                                            <c:forEach items="${user.roles}" var="userRole">
                                                <c:if test="${role.id == userRole.id}">
                                                    <p>
                                                        <label>
                                                            <input type="checkbox" class="check-box" name="ids"
                                                                   checked="checked" value="${role.id}">
                                                        </label> ${role.name}
                                                    </p>
                                                    <c:set value="${false}" var="show"/>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${show}">
                                                <p>
                                                    <label>
                                                        <input type="checkbox" class="check-box" name="ids"
                                                               value="${role.id}">
                                                    </label> ${role.name}
                                                </p>
                                            </c:if>

                                            <c:set value="${true}" var="show"/>
                                        </c:if>

                                    </c:forEach>

                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="id" name="id" value="${user.id}"/>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <c:if test="${user==null}">
                                                <button type="submit" class="btn btn-primary"
                                                        id="btnAddOrUpdate">Thêm
                                                </button>
                                            </c:if>
                                            <c:if test="${user!=null}">
                                                <button type="submit" class="btn btn-primary"
                                                        id="btnAddOrUpdate">Cập nhật
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <p id="wr" style="size: 12px;color: #ff4f65"></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #/ container -->
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


<script>
    $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();

        if (!checkValid()) return;

        var data = {};
        var roleIds = [];
        var formData = $('#formUpdateOrCreate').serializeArray();

        $.each(formData, function (i, v) {
            if (("" + v.name + "") === "ids") {
                var roleId = parseInt(v.value, 10);
                roleIds.push(roleId);
            }
            data["" + v.name + ""] = v.value;
        });
        if (roleIds.length < 1) {
            document.getElementById("wr").innerHTML = "Bạn chưa chọn quyền!";
            return;
        }
        data["ids"] = roleIds;
        data["creator"] = document.getElementById("creator").innerText;

        var id = $('#id').val();
        if (id === '') {
            addAccount(data);
        } else {
            updateAccount(data);
        }

    });

    function checkValid() {
        var pass = document.getElementById("Password");
        var confirmPass = document.getElementById("ConfirmPassword");
        var email = document.getElementById('email');
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var user = document.getElementById("val-username");
        var fullName = document.getElementById("fullName");
        var phone = document.getElementById("phone");

        if (pass.value === '' || confirmPass.value === '' || email.value === ''
            || user.value === '' || fullName.value === '' || phone.value === '') {
            document.getElementById("wr").innerHTML = "Vui lòng điền đầy đủ thông tin!";
            return false;
        } else if ((pass.value !== confirmPass.value)) {
            document.getElementById("wr").innerHTML = "Mật khẩu không trùng khớp!";
            return false;
        } else if (!filter.test(email.value)) {
            document.getElementById("wr").innerHTML = "Sai email!";
            return false;
        }
        document.getElementById("wr").innerHTML = "";
        return true;
    }

    function addAccount(data) {
        $.ajax({
            url: ('http://localhost:8888/user'),
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'text',
            success: function () {
                document.getElementById("wr").innerHTML = "Thêm mới thành công!";
            },
            error: function () {
                document.getElementById("wr").innerHTML = "Thêm mới thất bại!";
            }
        });
    }

    function updateAccount(data) {
        $.ajax({
            url: ('http://localhost:8888/user/${user.id}'),
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'text',
            success: function () {
                document.getElementById("wr").innerHTML = "Cập nhật thành công!";
            },
            error: function () {
                document.getElementById("wr").innerHTML = "Cập nhật thất bại!";
            }
        });
    }
</script>
</body>
</html>