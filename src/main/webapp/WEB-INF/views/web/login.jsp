<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en" class="h-100" id="login-page1">
<%@include file="/common/taglib.jsp"%>
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
        <svg class="circular" viewBox="25 25 50 50"><circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/></svg>
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
                                <a href="/web">
                                    <img src="<c:url value="/shoptemplate/images/logo3.png"/> " alt="">
                                </a>
                            </div>
                            <h3 class="text-center m-text-15">Đăng nhập</h3>
                            <h5 class="text-center m-text-15" style="color: #ff5185">${mess}</h5>
                            <form:form action="/login" method="post" >
                                <div class="form-group">
                                    <label>UserName</label>
                                    <input type="text" class="form-control" placeholder="UserName" name="userName">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" placeholder="Password" name="password">
                                </div>

                                <div class="text-center m-b-15 m-text-15">
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form:form>
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
</body>

</html>