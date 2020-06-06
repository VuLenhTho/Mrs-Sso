<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en" class="h-100" id="login-page1">
<%@include file="/common/taglib.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Đăng Nhập</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/template/assets/images/favicon.png"/>">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/template/css/style.css"/> " rel="stylesheet">
</head>

<body class="h-100">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>
<div class="login-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="form-input-content">
                    <div class="card">
                        <div class="card-body">
                            <div class="logo text-center">
                                <a href="/home">
                                    <img src="<c:url value="/shoptemplate/images/newLogo2.jpg"/> " alt="">
                                </a>
                            </div>
                            <br>
                            <p style="text-align: center;color: #ed9aff; font-size: 150%;">Đăng ký tài khoản</p>
                            <br>
                            <div class="form-group row">

                                <label class="col-lg-4 col-form-label" for="val-username">Tài khoản
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="text" class="form-control" id="val-username"
                                           name="userName"
                                           maxlength="25" placeholder=""
                                           value="">
                                </div>

                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Mật khẩu
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="password" class="form-control" id="password"
                                           maxlength="25" name="password" placeholder="" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username"> Xác nhận mật khẩu
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="password" class="form-control" id="confirmPassword"
                                           maxlength="25" name="confirmPassword"
                                           placeholder="" value="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Họ tên
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                           maxlength="30" placeholder=""
                                           value="${user.fullName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Điện thoại
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           maxlength="15" placeholder="" value="${user.phone}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Email
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="col-lg-7">
                                    <input type="email" class="form-control" id="email" name="email"
                                           maxlength="40" placeholder="" value="${user.email}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Địa chỉ
                                </label>
                                <div class="col-lg-7">
                                    <input type="text" class="form-control" id="address" name="address"
                                           maxlength="100" placeholder="" value="${user.address}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-4 col-form-label" for="val-username">Giới tính
                                </label>
                                <div class="col-lg-7">
                                    <select class="form-control" id="sex" name="sex">
                                        <option value="true" selected="selected">Nam</option>
                                        <option value="false">Nữ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-6 " style="margin: auto;">
                                    <button type="button" style="margin: auto;" class="btn btn-info" id="btnSignUp">Đăng
                                        ký
                                    </button>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12 ml-auto">
                                    <p style="text-align: center"><a href="/login" style="color: #ed9aff">Đăng nhập</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #/ container -->
<script src="<c:url value="/template/js/modernizr-3.6.0.min.js"/> "></script>
<!-- Common JS -->
<script src="<c:url value="/template/assets/plugins/common/common.min.js"/>"></script>
<!-- Custom script -->
<script src="<c:url value="/template/js/custom.min.js"/> "></script>
<script src="<c:url value="/template/assets/plugins/sweetalert/js/sweetalert.min.js"/>"></script>

<script>

    $('#btnSignUp').click(function (e) {
        var textError = checkValid();
        if (textError !== "") {
            swal({
                title: textError,
                icon: "error",
            });
            return;
        }
        signUp();
    });

    function checkValid() {
        var user = document.getElementById("val-username").value;
        var pass = document.getElementById("password").value;
        var confirmPass = document.getElementById("confirmPassword").value;
        var email = document.getElementById('email').value;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var phoneFilter = /^[0-9]*$/;
        var fullName = document.getElementById("fullName").value;
        var phone = document.getElementById("phone").value;

        var textError = "";
        if (user === '' || fullName === '' || phone === '' || pass === '' || confirmPass === '' || email === '') {
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

    function signUp() {
        var userName = document.getElementById("val-username").value;
        var pass = document.getElementById("password").value;
        var email = document.getElementById('email').value;
        var fullName = document.getElementById("fullName").value;
        var phone = document.getElementById("phone").value;
        var address = document.getElementById("address").value;
        var sex = document.getElementById("sex").value;

        let userDTO = {
            userName: userName,
            password: pass,
            fullName: fullName,
            sex: sex,
            email: email,
            phone: phone,
            address: address
        }

        $.ajax({
            url: ('http://localhost:8888/api/account/register'),
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(userDTO),
            dataType: 'text',
            statusCode: {
                201: function () {
                    swal("Thành công!", "Hãy nhập mã xác nhận để kích hoạt tài khoản", "success")
                }
            },
            error: function () {
                swal("Có lỗi xảy ra, hãy kiểm tra lại thông tin!", "error")
            }
        });
    }

</script>
</body>

</html>