<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/common/admin/head.jsp" %>
    <title>Quản lý tài khoản</title>
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

        <form action="<c:url value="/admin/users"/>" id="formSubmit" method="get">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <a href="<c:url value="/admin/user/new"/>">
                                <button type="button" class="btn btn-rounded btn-info"><span class="btn-icon-left"><i
                                        class="fa fa-plus color-info"></i> </span>Thêm tài khoản
                                </button>
                            </a>
                            <br>
                            <br>
                            <br>
                            <h4 class="card-title">Danh sách tài khoản</h4>

                            <div class="form-row align-items-center">
                                <div class="col-auto my-1">
                                    <label class="mr-sm-2">Ngày tạo</label>
                                    <select class="custom-select mr-sm-2" id="sort" name="sort">
                                        <option selected="selected" value="${filter.sort}">
                                            <c:if test="${filter.sort=='all'}">Tất cả</c:if>
                                            <c:if test="${filter.sort=='date-des'}">Mới nhất</c:if>
                                            <c:if test="${filter.sort=='date-asc'}">Cũ nhất</c:if>
                                        </option>
                                        <c:if test="${filter.sort=='date-des'}">
                                            <option value="all">Tất cả</option>
                                            <option value="date-asc">Cũ nhất</option>
                                        </c:if>
                                        <c:if test="${filter.sort=='date-asc'}">
                                            <option value="all">Tất cả</option>
                                            <option value="date-des">Mới nhất</option>
                                        </c:if>
                                        <c:if test="${filter.sort=='all'}">
                                            <option value="date-des">Mới nhất</option>
                                            <option value="date-asc">Cũ nhất</option>
                                        </c:if>
                                    </select>
                                </div>
                                <div class="col-auto my-1">
                                    <label class="mr-sm-2">Giới tính</label>
                                    <select class="custom-select mr-sm-2" id="sex" name="sex">
                                        <option selected="selected" value="${filter.sex}">
                                            <c:if test="${filter.sex=='all'}">Tất cả</c:if>
                                            <c:if test="${filter.sex=='true'}">Nam</c:if>
                                            <c:if test="${filter.sex=='false'}">Nữ</c:if>
                                        </option>
                                        <c:if test="${filter.sex=='all'}">
                                            <option value="true">Nam</option>
                                            <option value="false">Nữ</option>
                                        </c:if>
                                        <c:if test="${filter.sex=='true'}">
                                            <option value="all">Tất cả</option>
                                            <option value="false">Nữ</option>
                                        </c:if>
                                        <c:if test="${filter.sex=='false'}">
                                            <option value="all">Tất cả</option>
                                            <option value="true">Nam</option>
                                        </c:if>
                                    </select>
                                </div>
                                <div class="col-auto my-1">
                                    <label class="mr-sm-2">Trạng thái</label>
                                    <select class="custom-select mr-sm-2" id="status" name="status">
                                        <option selected="selected" value="${filter.status}">
                                            <c:if test="${filter.status=='all'}">Tất cả</c:if>
                                            <c:if test="${filter.status=='active'}">Đang hoạt động</c:if>
                                            <c:if test="${filter.status=='non-activated'}">Chưa kích hoạt</c:if>
                                            <c:if test="${filter.status=='locked'}">Đã khóa</c:if>
                                        </option>
                                        <c:if test="${filter.status=='all'}">
                                            <option value="active">Đang hoạt động</option>
                                            <option value="non-activated">Chưa kích hoạt</option>
                                            <option value="locked">Đã khóa</option>
                                        </c:if>
                                        <c:if test="${filter.status=='active'}">
                                            <option value="all">Tất cả</option>
                                            <option value="non-activated">Chưa kích hoạt</option>
                                            <option value="locked">Đã khóa</option>
                                        </c:if>
                                        <c:if test="${filter.status=='non-activated'}">
                                            <option value="all">Tất cả</option>
                                            <option value="active">Đang hoạt động</option>
                                            <option value="locked">Đã khóa</option>
                                        </c:if>
                                        <c:if test="${filter.status=='locked'}">
                                            <option value="all">Tất cả</option>
                                            <option value="active">Đang hoạt động</option>
                                            <option value="non-activated">Chưa kích hoạt</option>
                                        </c:if>

                                    </select>
                                </div>
                                <div class="col-auto my-1">
                                    <label class="mr-sm-2">Tìm kiếm </label>
                                    <c:if test="${filter.search != null}">
                                        <input type="text" class="form-control form-control-sm" name="search"
                                               value="${filter.search}" placeholder="Bạn muốn tìm gì?.."
                                               aria-controls="DataTables_Table_0">
                                    </c:if>
                                    <c:if test="${filter.search == null}">
                                        <input type="text" class="form-control form-control-sm" name="search"
                                               placeholder="Bạn muốn tìm gì?.." aria-controls="DataTables_Table_0">
                                    </c:if>

                                </div>
                                <div class="col-auto my-1">
                                    <br>
                                    <button type="submit" class="btn btn-info">Áp dụng</button>
                                </div>
                            </div>

                            <br>
                            <div class="table-responsive">
                                <table class="table muted-table-bordered" id="table">
                                    <colgroup>
                                        <col width="auto" span="1">
                                        <col width="200" span="1">
                                        <col width=auto span="2">
                                        <col width="300" span="1">
                                        <col width="auto" span="2">
                                        <col width="200" span="1">
                                    </colgroup>
                                    <thead class="thead-info">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Điện thoại</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col" align="center"
                                            style="align-items: center;align-content: center">
                                            Cập nhật hoặc
                                            <button type="button"
                                                    style="background-color: #989898;font-weight: bold;border-color: #cdcdcd"
                                                    class="btn btn-sm btn-primary" id="btnDelete"
                                                    data-toggle="tooltip" data-html="true" title
                                                    data-original-title="<em>Chọn để xóa</em>">Xóa
                                            </button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${data.userDTOS}" var="user">
                                        <tr>
                                            <th>${user.id}</th>
                                            <td>${user.userName}</td>
                                            <td>${user.fullName}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.email}</td>
                                                <%--sex--%>
                                            <c:if test="${user.sex == true}">
                                                <td>Nam</td>
                                            </c:if>
                                            <c:if test="${user.sex == false}">
                                                <td>Nữ</td>
                                            </c:if>
                                                <%--status--%>
                                            <c:if test="${(user.locked == false) and (user.activated = true)}">
                                                <td>Hoạt động</td>
                                            </c:if>
                                            <c:if test="${(user.locked == true) and (user.activated = true)}">
                                                <td>Đã khóa</td>
                                            </c:if>
                                            <c:if test="${user.activated == false}">
                                                <td>Chưa kích hoạt</td>
                                            </c:if>
                                                <%--action--%>
                                            <td align="center">
                                                <a href="/admin/user/${user.id}" data-toggle="tooltip"
                                                   data-placement="top"
                                                   title="" data-original-title="Chỉnh sửa">
                                                    <i class="fa fa-pencil color-muted m-r-5"></i>
                                                </a>
                                                <input type="checkbox" class="check-box" name="userID" title=""
                                                       value="${user.id}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <ul class="pagination" id="pagination"></ul>
                                <input type="hidden" value="1" id="page" name="page">
                                <input type="hidden" value="5" id="size" name="size">
                                <input type="hidden" value="${result}" id="result" name="result">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <form:form action="/admin/users/deletes" method="post" id="formDelete">
            <input type="hidden" value="" id="userIds" name="userIds">
        </form:form>

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

<script type="text/javascript">

    var totalPages = ${data.totalPages};
    var currentPage = ${data.currentPage+1};
    var limit = 5;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            limit: 5,
            onPageClick: function (event, page) {
                if (currentPage !== page) {
                    $('#size').val(limit);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        })
    });


    $(document).ready(function() {
        let result = document.getElementById("result").value;
        switch (result) {
            case "SUCCESS":
                swal("Xóa thành công!", {
                    icon: "success",
                });
                break;
            case "ERROR":
                swal("Xóa thất bại, có lỗi xảy ra", {
                    icon: "error",
                });
                break;
            case "NOT_FOUND":
                swal("Hãy chọn những tài khoản muốn xóa!", {
                    icon: "info",
                });
                break;
        }
    });

    $('#btnDelete').click(function (e) {
        e.preventDefault();

        var ids = "";
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name === "userID") {
                ids = ids + v.value + ',';
            }
        });
        document.getElementById("userIds").value = ids;
        if (ids === "" || ids == null) {
            swal("Hãy chọn những tài khoản muốn xóa!", {
                icon: "info",
            });
        } else {
            swal({
                title: "Bạn có chắc không?",
                text: "Những tài khoản này sẽ bị xóa!",
                icon: "warning",
                buttons: {
                    cancel: {
                        text: "Quay lại",
                        visible: true,
                    },
                    confirm: {
                        text: "Xóa",
                        visible: true,
                    }
                },
                dangerMode: true
            })
                .then((willDelete) => {
                    if (willDelete) {
                        $('#formDelete').submit();
                    }
                });
        }


    });


</script>

</body>
</html>