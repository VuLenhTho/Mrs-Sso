package com.vulenhtho.config;

public class Constant {

    public static final String ROLE_USER = "ROLE_USER";
    public static final String ROLE_ADMIN = "ROLE_ADMIN";
    public static final String ROLE_SALE = "ROLE_SALE";

    public static final String ROLE_USER_DESCRIPTION = "Người dùng";
    public static final String ROLE_ADMIN_DESCRIPTION = "Quản trị viên";
    public static final String ROLE_SALE_DESCRIPTION = "Nhân viên";

    public static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    public static final String PHONE_PATTERN = "^[0-9]*$";

    public static class UPDATE_RESULT {
        public static final String SUCCESS = "Cập nhật thành công!";
        public static final String ERROR_500 = "Cập nhật thất bai, lỗi SERVER!";
        public static final String ELSE_ERROR = "Cập nhật thất bại, hãy kiểm tra lại dữ liệu";
    }

    public static final String USERNAME_EXITS = "Tên tài khoản đã tồn tại!";

    public static class CREATE_RESULT {
        public static final String SUCCESS = "Thêm mới thành công!";
        public static final String ERROR_500 = "Thêm mới thất bai, lỗi SERVER!";
        public static final String ELSE_ERROR = "Thêm mới thất bại, hãy kiểm tra lại dữ liệu";
    }

    public static class USER_ERROR_MESSAGE_RESPONSE {
        public static final String USERNAME_EXISTED = "USERNAME_EXISTED";
        public static final String PHONE_EXISTED = "PHONE_EXISTED";
        public static final String EMAIL_EXISTED = "EMAIL_EXISTED";
    }

    public static class USER_ERROR_MESSAGE {
        public static final String USERNAME_EXISTED = "Tên tài khoản đã tồn tại!";
        public static final String PHONE_EXISTED = "Số điện thoại đã tồn tại!";
        public static final String EMAIL_EXISTED = "Email đã tồn tại!";
        public static final String FILL_INFO = "Vui lòng điền đầy đủ thông tin!";
        public static final String CONFIRM_PASS_NOT_CORRECT = "Mật khẩu không khớp!";
        public static final String EMAIL_NOT_CORRECT = "Email không đúng!";
        public static final String PHONE_NOT_CORRECT = "Số điện thoại không hợp lệ!";
        public static final String PASS_LENGTH_NOT_CORRECT = "Mật khẩu cần từ 6 đến 20 kí tự";
        public static final String USERNAME_LENGTH_NOT_CORRECT = "Tài khoản cần từ 3 đến 20 kí tự";
        public static final String FULL_NAME_LENGTH_NOT_CORRECT = "Tên cần từ 3 đến 20 kí tự";
    }
}
