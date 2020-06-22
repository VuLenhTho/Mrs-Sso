<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title style="font-family: Helvetica,serif">Đăng nhập</title>
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
         style="background-image: url('https://previews.123rf.com/images/mrtwister/mrtwister1804/mrtwister180400065/99567512-marine-theme-background-sea-shells-on-blue-shabby-wooden-boards-with-copy-space.jpg'); font-family: Helvetica, Arial, sans-serif;">
        <div class="wrap-login100 p-t-30 p-b-50">


				<span class="login100-form-title p-b-41" style="font-family: Helvetica,serif ; font-weight: bold">
					Đăng nhập
				</span>

            <form:form action="/login" method="post" class="login100-form validate-form p-b-33 p-t-5">
                <h5 class="text-center m-text-15" style="color: #0a0a0a; padding-top: 15px">${mess}</h5>
                <br>
                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="userName" placeholder="Tài khoản">
                    <span class="focus-input100" data-placeholder="&#xe82a;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="password" placeholder="Mật khẩu">
                    <span class="focus-input100" data-placeholder="&#xe80f;"></span>
                </div>

                <div class="container-login100-form-btn m-t-32">
                    <button class="login100-form-btn"
                            style="font-family: Helvetica,serif ; font-weight: bold; text-transform: none">
                        Đăng nhập
                    </button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <br>
                <p style="text-align: center">Chưa có tài khoản? <a href="/signUp" style="color: #ed9aff">Đăng ký
                    ngay!</a></p>
            </form:form>
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

</body>

</html>