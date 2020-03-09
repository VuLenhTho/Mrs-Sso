package com.vulenhtho.service.impl;

import com.vulenhtho.config.Constant;
import com.vulenhtho.dto.RoleDTO;
import com.vulenhtho.dto.UserDTO;
import com.vulenhtho.service.SecurityService;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private RestTemplate restTemplate;

    private SecurityService securityService;


    @Autowired
    public UserServiceImpl(RestTemplate restTemplate, SecurityService securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public String updateByAdmin(HttpServletRequest request) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(Long.parseLong(request.getParameter("id")));
        userDTO.setUserName(request.getParameter("userName"));
        userDTO.setPassword(request.getParameter("password"));
        userDTO.setEmail(request.getParameter("email"));
        userDTO.setFullName(request.getParameter("fullName"));
        userDTO.setLocked(Boolean.valueOf(request.getParameter("locked")));
        userDTO.setActivated(Boolean.valueOf(request.getParameter("activated")));
        userDTO.setPhone(request.getParameter("phone"));
        userDTO.setSex(Boolean.valueOf(request.getParameter("sex")));

        String roles = request.getParameter("roles");
        Set<RoleDTO> roleDTOS =  Arrays.stream(roles.split("")).map(roleId ->{
            RoleDTO roleDTO = new RoleDTO();
            roleDTO.setId(Long.parseLong(roleId));
            return roleDTO;
        }).collect(Collectors.toSet());
        userDTO.setRoles(roleDTOS);

        String valid = checkValid(request.getParameter("ConfirmPassword"), userDTO);
        if (valid != null){
            return valid;
        }

        ResponseEntity responseEntity = restTemplate.exchange("http://localhost:8888/api/admin/user", HttpMethod.PUT, new HttpEntity<>(userDTO, securityService.getHeaders()), ResponseEntity.class);
        HttpStatus status = responseEntity.getStatusCode();
        if (HttpStatus.OK.equals(status)){
            return "Cập nhật thành công!";
        } else if (HttpStatus.INTERNAL_SERVER_ERROR.equals(status)){
            return "Cập nhật thất bai, lỗi SERVER!";
        } else {
            return "Cập nhật thất bại, hãy kiểm tra lại dữ liệu";
        }
    }

    public String checkValid(String confirmPass, UserDTO userDTO){
        Pattern mailPattern = Pattern.compile(Constant.EMAIL_PATTERN);
        Pattern phonePattern = Pattern.compile(Constant.PHONE_PATTERN);

         if (StringUtils.isEmpty(userDTO.getUserName())  || StringUtils.isEmpty(userDTO.getFullName())
            || StringUtils.isEmpty(userDTO.getEmail()) || CollectionUtils.isEmpty(userDTO.getRoles())
            || StringUtils.isEmpty(userDTO.getPhone()) || (StringUtils.isEmpty(confirmPass) && !StringUtils.isEmpty(userDTO.getPassword()))
            || (!StringUtils.isEmpty(confirmPass) && StringUtils.isEmpty(userDTO.getPassword())) ){
            return "Vui lòng điền đầy đủ thông tin!";
        } else if (!confirmPass.equals(userDTO.getPassword())){
             return "Mật khẩu không khớp!";
         } else if (!mailPattern.matcher(userDTO.getEmail()).matches()){
            return "Email không đúng!";
         } else if (userDTO.getUserName().length() < 3){
             return "Tên tài khoản cần ít nhất 3 kí tự";
         }

        if (!phonePattern.matcher(userDTO.getPhone()).matches()) {
            return "Số điện thoại không hợp lệ!";
        } else if (!(userDTO.getPhone().length() == 10 || userDTO.getPhone().length() == 11)) {
            return "Số điện thoại không hợp lệ!";
        }
        if (!(StringUtils.isEmpty(confirmPass) && StringUtils.isEmpty(userDTO.getPassword())) && userDTO.getPassword().length() < 6 && userDTO.getPassword().length() > 20){
            return "Mật khẩu cần từ 6 đến 20 kí tự";
        }
        if (userDTO.getUserName().length() < 3 && userDTO.getUserName().length() > 20){
            return "Tài khoản cần từ 3 đến 20 kí tự";
        }if (userDTO.getFullName().length() < 3 && userDTO.getFullName().length() > 20){
            return "Tên cần từ 3 đến 20 kí tự";
        }
        return null;
    }
}
