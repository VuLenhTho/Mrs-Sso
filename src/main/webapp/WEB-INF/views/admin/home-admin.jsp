<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Mrs-Sso</title>
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
        <svg class="circular" viewBox="25 25 50 50"><circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/></svg>
    </div>
</div>
<div id="main-wrapper">
    <%@include file="/common/admin/header.jsp"%>
    <%@include file="/common/admin/menu.jsp"%>
    <div class="content-body">
        <!-- #/ container -->
    </div>
    <%@include file="/common/admin/footer.jsp"%>
</div>


<!-- Common JS -->
<script src="<c:url value="/template/assets/plugins/common/common.min.js"/>"></script>
<!-- Custom script -->
<script src="<c:url value="/template/js/custom.min.js"/>"></script>
<script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
<script src="<c:url value="/template/assets/plugins/wysihtml5/js/bootstrap-wysihtml5.js"/>"></script>
<script src="<c:url value="/template/assets/plugins/wysihtml5/js/wysihtml5-init.js"/>"></script>
</body>
</html>