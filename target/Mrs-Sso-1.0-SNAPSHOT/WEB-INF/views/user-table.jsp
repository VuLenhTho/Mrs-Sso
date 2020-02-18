<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Mobile</title>
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

        <form action="<c:url value="/users"/>" id="formSubmit" method="get">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <a href="/newUser">
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
                                            <c:if test="${filter.status=='true'}">Đang hoạt động</c:if>
                                            <c:if test="${filter.status=='false'}">Đã khóa</c:if>
                                        </option>
                                        <c:if test="${filter.status=='all'}">
                                            <option value="true">Đang hoạt động</option>
                                            <option value="false">Đã khóa</option>
                                        </c:if>
                                        <c:if test="${filter.status=='true'}">
                                            <option value="all">Tất cả</option>
                                            <option value="false">Đã khóa</option>
                                        </c:if>
                                        <c:if test="${filter.status=='false'}">
                                            <option value="all">Tất cả</option>
                                            <option value="true">Đang hoạt động</option>
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
                                    <thead class="thead-muted">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Điện thoại</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Giới tính</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col" align="center" style="align-items: center;align-content: center">
                                            Cập nhật hoặc
                                            <button type="button" style="background-color: #989898;font-weight: bold;border-color: #cdcdcd"
                                                    class="btn btn-sm btn-primary" id="btnDelete"
                                                    data-toggle="tooltip" data-html="true" title
                                                    data-original-title="<em>Chọn để xóa</em>">Delete
                                            </button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${data.users}" var="user">
                                        <tr>
                                            <th>${user.id}</th>
                                            <td>${user.userName}</td>
                                            <td>${user.fullName}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.email}</td>
                                                <%--sex--%>
                                            <c:if test="${user.sex==true}">
                                                <td>Nam</td>
                                            </c:if>
                                            <c:if test="${user.sex==false}">
                                                <td>Nữ</td>
                                            </c:if>
                                                <%--status--%>
                                            <c:if test="${user.status==true}">
                                                <td>Hoạt động</td>
                                            </c:if>
                                            <c:if test="${user.status==false}">
                                                <td>Đã khóa</td>
                                            </c:if>
                                                <%--action--%>
                                            <td align="center">
                                                <a href="/user/${user.id}" data-toggle="tooltip"
                                                   data-placement="top"
                                                   title="" data-original-title="Chỉnh sửa">
                                                    <i class="fa fa-pencil color-muted m-r-5"></i>
                                                </a>
                                                <input type="checkbox"  class="check-box" name="userID" title=""
                                                       value="${user.id}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <ul class="pagination" id="pagination"></ul>
                                <input type="hidden" value="1" id="page" name="page">
                                <input type="hidden" value="5" id="size" name="size">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

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

    $('#btnDelete').click(function (e) {
        e.preventDefault();

        var data = {};
        var ids = [];
        var userId;
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name === "userID") {
                userId = parseInt(v.value, 10);
                ids.push(userId);
            }
        });
        data["ids"] = ids;
        deleteAccount(data);


        function deleteAccount(data) {
            $.ajax({
                url: ('http://localhost:8888/user'),
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'text',
                success: function () {
                    alert('Delete success');
                    location.reload();
                },
                error: function () {
                    alert('Delete failure');
                }
            });
        }
    })

</script>

</body>
</html>