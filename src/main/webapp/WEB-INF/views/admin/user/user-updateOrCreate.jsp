<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <c:if test="${user == null}">
        <title>Thêm tài khoản</title>
    </c:if>
    <title>Cập nhật tài khoản</title>

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
                        <li class="breadcrumb-item"><a href="<c:url value="/admin/users"/>">Quản lý người dùng</a>
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
                                <form:form action="/admin/user" method="post" id="formUpdateOrCreate">

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Tài khoản
                                            <span class="text-danger">*</span>
                                        </label>
                                        <c:if test="${submitType == 'Thêm mới'}">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="val-username"
                                                       name="userName"
                                                       maxlength="25" placeholder=""
                                                       value="${user.userName}">
                                            </div>
                                        </c:if>
                                        <c:if test="${submitType == 'Cập nhật'}">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userName" name="userName"
                                                       maxlength="25" placeholder="" readonly
                                                       value="${user.userName}">
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Mật khẩu
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="password" class="form-control" id="password"
                                                   maxlength="25" name="password" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username"> Xác nhận mật khẩu
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="password" class="form-control" id="confirmPassword"
                                                   maxlength="25" name="confirmPassword"
                                                   placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Họ tên
                                            <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="fullName" name="fullName"
                                                   maxlength="30" placeholder=""
                                                   value="${user.fullName}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Điện thoại
                                            <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                   maxlength="15" placeholder="" value="${user.phone}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Email
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="email" class="form-control" id="email" name="email"
                                                   maxlength="40" placeholder="" value="${user.email}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Địa chỉ
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="address" name="address"
                                                   maxlength="100" placeholder="" value="${user.address}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Giới tính
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
                                        <label class="col-lg-4 col-form-label" for="val-username">Kích hoạt
                                        </label>
                                        <div class="col-lg-6">
                                            <c:if test="${user == null}">
                                                <select class="form-control" id="activated" name="activated">
                                                    <option value="true" selected="selected">Đã kích hoạt</option>
                                                    <option value="false">Chưa kích hoạt</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${user!= null}">
                                                <select class="form-control" id="activated" name="activated">
                                                    <option value="${user.activated}" selected="selected">
                                                        <c:if test="${user.activated == false}">Chưa kích hoạt</c:if>
                                                        <c:if test="${user.activated == true}">Đã kích hoạt</c:if>
                                                    </option>
                                                    <c:if test="${user.activated == true}">
                                                        <option value="false">Chưa kích hoạt</option>
                                                    </c:if>
                                                    <c:if test="${user.activated == false}">
                                                        <option value="true">Đã kích hoạt</option>
                                                    </c:if>
                                                </select>
                                            </c:if>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Khóa
                                        </label>
                                        <div class="col-lg-6">
                                            <c:if test="${user == null}">
                                                <select class="form-control" id="locked" name="locked">
                                                    <option value="false" selected="selected">Hoạt động</option>
                                                    <option value="true">Khóa</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${user!= null}">
                                                <c:if test="${user.activated == true}">
                                                    <select class="form-control" id="locked" name="locked">
                                                        <option value="${user.locked}" selected="selected">
                                                            <c:if test="${user.locked == false}">Hoạt động</c:if>
                                                            <c:if test="${user.locked == true}">Khóa</c:if>
                                                        </option>
                                                        <c:if test="${user.locked == true}">
                                                            <option value="false">Hoạt động</option>
                                                        </c:if>
                                                        <c:if test="${user.locked == false}">
                                                            <option value="true">Khóa</option>
                                                        </c:if>
                                                    </select>
                                                </c:if>
                                                <c:if test="${user.activated == false}">
                                                    <p>
                                                        <label style="size: 20px;color: #ff4f65">
                                                        </label> Tài khoản chưa kích hoạt
                                                    </p>
                                                </c:if>
                                            </c:if>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="roles" name="roles"  value=""/>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="val-username">Quyền
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
                                                        </label> ${role.description}
                                                    </p>
                                                    <c:set value="${false}" var="show"/>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${show}">
                                                <p>
                                                    <label>
                                                        <input type="checkbox" class="check-box" name="ids"
                                                               value="${role.id}">
                                                    </label> ${role.description}
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
                                                <button type="button" class="btn btn-info" value="${submitType}"
                                                        id="btnAddOrUpdate">${submitType}
                                                </button>
                                        </div>
                                    </div>

                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" value="${result}" id="result" name="result">
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
<script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>


<script>

    $('#btnAddOrUpdate').click(function (e) {
        var textError = checkValid();
        if (textError !== ""){
            swal({
                title: textError,
                icon: "error",
            });
            return;
        }

        var roleIds = "";
        var formData = $('#formUpdateOrCreate').serializeArray();

        $.each(formData, function (i, v) {
            if (("" + v.name + "") === "ids") {
                var roleId = parseInt(v.value, 10);
                roleIds = roleIds +  roleId.toString();
            }
        });

        if (roleIds === ""){
            swal({
                title: "Hãy chọn quyền người dùng!",
                icon: "error",
            });
            return;
        }

        document.getElementById("roles").value = roleIds;
        $('#formUpdateOrCreate').submit();
    });

    function checkValid() {
        var user;
        if (document.getElementById("btnAddOrUpdate").value === "Thêm mới"){
            user = document.getElementById("val-username").value;
        } else {
            user = document.getElementById("userName").value;
        }
        var pass = document.getElementById("password").value;
        var confirmPass = document.getElementById("confirmPassword").value;
        var email = document.getElementById('email').value;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var phoneFilter = /^[0-9]*$/;
        var fullName = document.getElementById("fullName").value;
        var phone = document.getElementById("phone").value;

        var textError = "";
        if (user === '' || fullName === '' || phone === '') {
            textError = "Vui lòng điền đầy đủ các mục có gắn dấu *";

        } else if ((pass !== '' && confirmPass === '') || (pass === '' && confirmPass !== '')) {
            textError = "Hãy điền cả mật khẩu và xác nhận mật khẩu hoặc bỏ qua nếu không muốn thay đổi!";
            $('#password').focus();

        } else if (user != null && user.length < 3) {
            textError = "Tên tài khoản cần ít nhất 3 kí tự!";
            $('#val-username').focus();

        } else if (pass !== '' && pass.length < 3) {
            textError = "Mật khẩu cần ít nhất 6 kí tự!";
            $('#password').focus();

        } else if (fullName.length < 3) {
            textError = "Tên cần ít nhất 3 kí tự!";

            $('#password').focus();
        } else if ((pass !== confirmPass)) {
            textError = "Mật khẩu không trùng khớp!";

            $('#password').focus();
        } else if (!filter.test(email)) {
            textError = "Email không đúng!";

            $('#email').focus();
        } else if (!phoneFilter.test(phone)) {
            textError = "Số điện thoại không đúng!";

            $('#phone').focus();
        }
        return textError;
    }

    $(document).ready(function() {
        let result = document.getElementById("result").value;
        switch (result) {
            case "USERNAME_EXISTED":
                swal({
                    title: "Lỗi!...",
                    text: "Tên tài khoản đã tồn tại!",
                    icon: "error",
                });
                $('val-username').focus();
                break;
            case "PHONE_EXISTED":
                swal({
                    title: "Lỗi!...",
                    text: "Số điện thoại đã tồn tại!",
                    icon: "error",
                });
                $('phone').focus();
                break;
            case "EMAIL_EXISTED":
                swal({
                    title: "Lỗi!...",
                    text: "Email đã tồn tại!",
                    icon: "error",
                });
                $('email').focus();
                break;
            case "ERROR":
                swal({
                    title: "Có lỗi xảy ra!...",
                    text: "Hãy kiểm tra dữ liệu và thử lại!",
                    icon: "error",
                });
                break;
            case "SUCCESS":
                swal({
                    title: "Thành công!",
                    icon: "success",
                    buttons: {
                        cancel: {
                            text: "Quay lại",
                            visible: true,
                        }
                    }
                });
                break;
        }
    });
</script>
</body>
</html>