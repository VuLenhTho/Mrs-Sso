package com.vulenhtho.service.impl;

import com.vulenhtho.config.APIConstant;
import com.vulenhtho.config.Constant;
import com.vulenhtho.dto.ChangeUserAndResult;
import com.vulenhtho.dto.RoleDTO;
import com.vulenhtho.dto.UserDTO;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private RestTemplate restTemplate;

    private SecurityServiceImpl securityService;


    @Autowired
    public UserServiceImpl(RestTemplate restTemplate, SecurityServiceImpl securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public ChangeUserAndResult updateByAdmin(HttpServletRequest request) {
        ChangeUserAndResult changeUserAndResult = setUserDTOAndCheckValid(request, false);

        if (changeUserAndResult.getResult() != null) {
            return changeUserAndResult;
        }
        ResponseEntity responseEntity = restTemplate.exchange(APIConstant.ADMIN_URI + "/user"
                , HttpMethod.PUT, new HttpEntity<>(changeUserAndResult.getUserDTO(), securityService.getHeadersWithToken()), ResponseEntity.class);
        checkResponseStatus(changeUserAndResult, responseEntity.getStatusCode(), true);

        return changeUserAndResult;
    }

    @Override
    public ChangeUserAndResult createByAdmin(HttpServletRequest request) {
        ChangeUserAndResult changeUserAndResult = setUserDTOAndCheckValid(request, true);

        if (changeUserAndResult.getResult() != null) {
            return changeUserAndResult;
        }
        ResponseEntity<UserDTO> responseEntity = restTemplate.exchange(APIConstant.ADMIN_URI + "/user"
                , HttpMethod.POST, new HttpEntity<>(changeUserAndResult.getUserDTO(), securityService.getHeadersWithToken())
                , new ParameterizedTypeReference<UserDTO>() {
                });


        checkResponseStatus(changeUserAndResult, responseEntity.getStatusCode(), false);

        return changeUserAndResult;
    }

    private ChangeUserAndResult setUserDTOAndCheckValid(HttpServletRequest request, boolean isCreate) {
        ChangeUserAndResult changeUserAndResult = new ChangeUserAndResult();
        UserDTO userDTO = getUserDTOByHttpRequest(request);
        changeUserAndResult.setUserDTO(userDTO);

        String valid = checkDuplicateUserInfo(userDTO, isCreate);
        changeUserAndResult.setResult(StringUtils.isEmpty(valid) ? null : valid);

        return changeUserAndResult;
    }

    private void checkResponseStatus(ChangeUserAndResult changeUserAndResult, HttpStatus status, boolean isUpdate) {
        if (HttpStatus.OK.equals(status)) {
            changeUserAndResult.setResult(Constant.CRUD_RESULT.SUCCESS);
        } else {
            changeUserAndResult.setResult(Constant.CRUD_RESULT.ERROR);
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

    public String checkDuplicateUserInfo(UserDTO userDTO, boolean isCreate) {
        ResponseEntity<String> checkDuplicateMessage;
        if (isCreate) {
            checkDuplicateMessage = restTemplate.exchange(APIConstant.WEB_URI + "/user/check-duplicates-user-info?userName="
                            + userDTO.getUserName() + "&email=" + userDTO.getEmail() + "&phone=" + userDTO.getPhone(), HttpMethod.GET
                    , new HttpEntity<>(userDTO, securityService.getHeadersWithToken()), new ParameterizedTypeReference<String>() {
                    });
        } else {
            checkDuplicateMessage = restTemplate.exchange(APIConstant.WEB_URI + "/user/check-duplicates-user-info-for-update?userName="
                            + userDTO.getUserName() + "&email=" + userDTO.getEmail() + "&phone=" + userDTO.getPhone(), HttpMethod.GET
                    , new HttpEntity<>(userDTO, securityService.getHeadersWithToken()), new ParameterizedTypeReference<String>() {
                    });
        }

        if (!StringUtils.isEmpty(checkDuplicateMessage.getBody())) {
            return checkDuplicateMessage.getBody();
        }
        return null;
    }

    @Override
    public String deletesByAdmin(HttpServletRequest request) {
        String idString = request.getParameter("userIds");
        if (StringUtils.isEmpty(idString)) {
            return Constant.CRUD_RESULT.NOT_FOUND;
        }
        List<Long> ids = Arrays.stream(idString.split(",")).map(Long::parseLong).collect(Collectors.toList());
        ResponseEntity<String> deletes = restTemplate.exchange(APIConstant.ADMIN_URI + "/users", HttpMethod.DELETE
                , new HttpEntity<>(ids, securityService.getHeadersWithToken()), new ParameterizedTypeReference<String>() {
                });
        if (HttpStatus.OK.equals(deletes.getStatusCode())) {
            return Constant.CRUD_RESULT.SUCCESS;
        } else {
            return Constant.CRUD_RESULT.ERROR;
        }
    }

    @Override
    public boolean isLogged() {
        Collection<? extends GrantedAuthority> authoritySet = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        return authoritySet.stream().anyMatch(role -> hasARoleInRoleList(role.getAuthority()));
    }

    private boolean hasARoleInRoleList(String role) {
        return Constant.ROLE_ADMIN.equals(role) || Constant.ROLE_SALE.equals(role) || Constant.ROLE_USER.equals(role);
    }
}
