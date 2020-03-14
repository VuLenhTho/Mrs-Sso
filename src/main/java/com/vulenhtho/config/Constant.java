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

    public static class SUBMIT_TYPE {
        public static final String CREATE = "Thêm mới";
        public static final String UPDATE = "Cập nhật";

    }

    public static class CRUD_RESULT {
        public static final String SUCCESS = "SUCCESS";
        public static final String ERROR = "ERROR";
        public static final String NOT_FOUND = "NOT_FOUND";
    }

}
