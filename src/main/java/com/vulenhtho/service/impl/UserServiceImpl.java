package com.vulenhtho.service.impl;

import com.vulenhtho.config.Constant;
import com.vulenhtho.dto.ChangeUserAndResult;
import com.vulenhtho.dto.RoleDTO;
import com.vulenhtho.dto.UserDTO;
import com.vulenhtho.service.SecurityService;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Set;
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
    public ChangeUserAndResult updateByAdmin(HttpServletRequest request) {
        ChangeUserAndResult changeUserAndResult = setUserDTOAndCheckValid(request);

        if (changeUserAndResult.getResult() != null) {
            return changeUserAndResult;
        }
        ResponseEntity responseEntity = restTemplate.exchange("http://localhost:8888/api/admin/user"
                , HttpMethod.PUT, new HttpEntity<>(changeUserAndResult.getUserDTO(), securityService.getHeaders()), ResponseEntity.class);
        checkResponseStatus(changeUserAndResult, responseEntity.getStatusCode(), true);

        return changeUserAndResult;
    }

    @Override
    public ChangeUserAndResult createByAdmin(HttpServletRequest request) {
        ChangeUserAndResult changeUserAndResult = setUserDTOAndCheckValid(request);

        if (changeUserAndResult.getResult() != null) {
            return changeUserAndResult;
        }
        ResponseEntity<UserDTO> responseEntity = restTemplate.exchange("http://localhost:8888/api/admin/user"
                , HttpMethod.POST, new HttpEntity<>(changeUserAndResult.getUserDTO(), securityService.getHeaders())
                , new ParameterizedTypeReference<UserDTO>() {
                });


        checkResponseStatus(changeUserAndResult, responseEntity.getStatusCode(), false);

        return changeUserAndResult;
    }

    private ChangeUserAndResult setUserDTOAndCheckValid(HttpServletRequest request) {
        ChangeUserAndResult changeUserAndResult = new ChangeUserAndResult();
        UserDTO userDTO = getUserDTOByHttpRequest(request);
        changeUserAndResult.setUserDTO(userDTO);

        String valid = checkValid(request.getParameter("ConfirmPassword"), userDTO);
        changeUserAndResult.setResult(StringUtils.isEmpty(valid) ? null : valid);

        return changeUserAndResult;
    }

    private void checkResponseStatus(ChangeUserAndResult changeUserAndResult, HttpStatus status, boolean isUpdate) {
        if (HttpStatus.OK.equals(status)) {
            changeUserAndResult.setResult(isUpdate ? Constant.UPDATE_RESULT.SUCCESS : Constant.CREATE_RESULT.SUCCESS);
        } else if (HttpStatus.INTERNAL_SERVER_ERROR.equals(status)) {
            changeUserAndResult.setResult(isUpdate ? Constant.UPDATE_RESULT.ERROR_500 : Constant.CREATE_RESULT.ERROR_500);
        } else {
            changeUserAndResult.setResult(isUpdate ? Constant.UPDATE_RESULT.ELSE_ERROR : Constant.CREATE_RESULT.ELSE_ERROR);
        }
    }

    private UserDTO getUserDTOByHttpRequest(HttpServletRequest request) {
        UserDTO userDTO = new UserDTO();
        String id = request.getParameter("id");
        userDTO.setId(StringUtils.isEmpty(id) ? null : Long.parseLong(id));
        userDTO.setUserName(request.getParameter("userName"));
        userDTO.setPassword(request.getParameter("password"));
        userDTO.setEmail(request.getParameter("email"));
        userDTO.setFullName(request.getParameter("fullName"));
        userDTO.setLocked(Boolean.valueOf(request.getParameter("locked")));
        userDTO.setActivated(Boolean.valueOf(request.getParameter("activated")));
        userDTO.setPhone(request.getParameter("phone"));
        userDTO.setSex(Boolean.valueOf(request.getParameter("sex")));

        String roles = request.getParameter("roles");
        Set<RoleDTO> roleDTOS = Arrays.stream(roles.split("")).map(roleId -> {
            RoleDTO roleDTO = new RoleDTO();
            roleDTO.setId(Long.parseLong(roleId));
            return roleDTO;
        }).collect(Collectors.toSet());
        userDTO.setRoles(roleDTOS);

        return userDTO;
    }

    public String checkValid(String confirmPass, UserDTO userDTO) {
        Pattern mailPattern = Pattern.compile(Constant.EMAIL_PATTERN);
        Pattern phonePattern = Pattern.compile(Constant.PHONE_PATTERN);

        if (StringUtils.isEmpty(userDTO.getUserName()) || StringUtils.isEmpty(userDTO.getFullName())
                || StringUtils.isEmpty(userDTO.getEmail()) || CollectionUtils.isEmpty(userDTO.getRoles())
                || StringUtils.isEmpty(userDTO.getPhone()) || (StringUtils.isEmpty(confirmPass) && !StringUtils.isEmpty(userDTO.getPassword()))
                || (!StringUtils.isEmpty(confirmPass) && StringUtils.isEmpty(userDTO.getPassword()))) {
            return Constant.USER_ERROR_MESSAGE.FILL_INFO;
        } else if (!confirmPass.equals(userDTO.getPassword())) {
            return Constant.USER_ERROR_MESSAGE.CONFIRM_PASS_NOT_CORRECT;
        } else if (!mailPattern.matcher(userDTO.getEmail()).matches()) {
            return Constant.USER_ERROR_MESSAGE.EMAIL_NOT_CORRECT;
        }

        if (!phonePattern.matcher(userDTO.getPhone()).matches()) {
            return Constant.USER_ERROR_MESSAGE.PHONE_NOT_CORRECT;
        } else if (!(userDTO.getPhone().length() == 10 || userDTO.getPhone().length() == 11)) {
            return Constant.USER_ERROR_MESSAGE.PHONE_NOT_CORRECT;
        }
        if (!(StringUtils.isEmpty(confirmPass) && StringUtils.isEmpty(userDTO.getPassword())) && userDTO.getPassword().length() < 6 && userDTO.getPassword().length() > 20) {
            return Constant.USER_ERROR_MESSAGE.PASS_LENGTH_NOT_CORRECT;
        }
        if (userDTO.getUserName().length() < 3 && userDTO.getUserName().length() > 20) {
            return Constant.USER_ERROR_MESSAGE.USERNAME_LENGTH_NOT_CORRECT;
        }
        if (userDTO.getFullName().length() < 3 && userDTO.getFullName().length() > 20) {
            return Constant.USER_ERROR_MESSAGE.FULL_NAME_LENGTH_NOT_CORRECT;
        }

        return checkDuplicateUserInfo(userDTO);
    }

    public String checkDuplicateUserInfo(UserDTO userDTO) {
        ResponseEntity<String> checkDuplicateMessage = restTemplate.exchange("http://localhost:8888/api/web/user/check-duplicates-user-info?userName="
                        + userDTO.getUserName() + "&email=" + userDTO.getEmail() + "&phone=" + userDTO.getPhone(), HttpMethod.GET
                , new HttpEntity<>(userDTO, securityService.getHeaders()), new ParameterizedTypeReference<String>() {
                });
        if (Constant.USER_ERROR_MESSAGE_RESPONSE.USERNAME_EXISTED.equals(checkDuplicateMessage.getBody())) {
            return Constant.USER_ERROR_MESSAGE.USERNAME_EXISTED;
        } else if (Constant.USER_ERROR_MESSAGE_RESPONSE.PHONE_EXISTED.equals(checkDuplicateMessage.getBody())) {
            return Constant.USER_ERROR_MESSAGE.PHONE_EXISTED;
        } else if (Constant.USER_ERROR_MESSAGE_RESPONSE.EMAIL_EXISTED.equals(checkDuplicateMessage.getBody())) {
            return Constant.USER_ERROR_MESSAGE.EMAIL_EXISTED;
        }
        return null;
    }

    @Override
    public String deletesByAdmin(HttpServletRequest request) {
        return null;
    }
}
