<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title style="font-family: Helvetica,serif">Đăng ký</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="<c:url value="/template/login/images/icons/favicon.ico"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/vendor/bootstrap/css/bootstrap.min.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>"/>

    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/login/vendor/animate/animate.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/vendor/css-hamburgers/hamburgers.min.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/vendor/animsition/css/animsition.min.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/login/vendor/select2/select2.min.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/template/login/vendor/daterangepicker/daterangepicker.css"/>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/login/css/util.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/login/css/main.css"/>"/>
    <!--===============================================================================================-->

</head>
<body>

<div class="limiter">
    <div class="container-login100" id="container1"
         style="background-image: url('/shoptemplate/images/banner-03.jpg'); font-family: Helvetica, Arial, sans-serif;">
        <div class="wrap-login100 p-t-30 p-b-50">


				<span class="login100-form-title p-b-41" style="font-family: Helvetica,serif ; font-weight: bold">
					Đăng ký tài khoản
				</span>

            <div class="login100-form validate-form p-b-33 p-t-5">

                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="userName" id="val-username" placeholder="Tài khoản">
                    <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="password" id="password" placeholder="Mật khẩu">
                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="confirmPassword" id="confirmPassword"
                           placeholder="Xác nhận mật khẩu">
                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="fullName" id="fullName" placeholder="Họ tên">
                    <span class="focus-input100" data-placeholder="&#xe802;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="number" name="phone" id="phone" placeholder="Điện thoại">
                    <span class="focus-input100" data-placeholder="&#xe830;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="email" id="email" placeholder="Email">
                    <span class="focus-input100" data-placeholder="&#xe818;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="address" id="address" placeholder="Địa chỉ">
                    <span class="focus-input100" data-placeholder="&#xe833;"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <label for="sex" style="padding-left: 14px; font-size: 130%">Giới tính</label>
                    <select style="font-size: 130%" class="form-control" id="sex" name="sex">
                        <option value="true" selected="selected">Nam</option>
                        <option value="false">Nữ</option>
                    </select>
                </div>

                <div class="container-login100-form-btn m-t-32">
                    <button class="login100-form-btn" id="btnSignUp"
                            style="font-family: Helvetica,serif ; font-weight: bold; text-transform: none">
                        Đăng ký
                    </button>
                </div>

                <br>
                <p style="text-align: center"><a href="/login" style="color: #ed9aff">Đăng nhập</a>
                <p style="text-align: center"><a href="/home" style="color: #ed9aff">Trang chủ</a>
                </p>
            </div>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/template/login/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value="/template/login/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/template/login/js/main.js"/>"></script>
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
            success: function () {
                swal({
                    title: "Đăng ký thành công",
                    icon: "success",
                })
                    .then((value) => {
                        window.location.href = "http://localhost:8080/login";
                    });
            },
            error: function () {
                swal("Có lỗi xảy ra!!", "Hãy kiểm tra lại thông tin!! ", "error")
            }
        });
    }

</script>
</body>

</html>