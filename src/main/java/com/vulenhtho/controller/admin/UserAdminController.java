package com.vulenhtho.controller.admin;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.vulenhtho.config.Constant;
import com.vulenhtho.dto.ChangeUserAndResult;
import com.vulenhtho.dto.RoleDTO;
import com.vulenhtho.dto.UserDTO;
import com.vulenhtho.dto.request.PageUserRequest;
import com.vulenhtho.dto.response.UserFilterResponse;
import com.vulenhtho.service.SecurityService;
import com.vulenhtho.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserAdminController {

    private RestTemplate restTemplate;

    private SecurityService securityService;

    private UserService userService;

    @Autowired
    public UserAdminController(RestTemplate restTemplate, SecurityService securityService, UserService userService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
        this.userService = userService;
    }

    @GetMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("admin/home-admin");
    }

    @GetMapping("/users")
    public ModelAndView getAllUser(
            @RequestParam(defaultValue = "1", required = false) Integer page
            , @RequestParam(defaultValue = "5", required = false) Integer size
            , @RequestParam(defaultValue = "all", required = false) String status
            , @RequestParam(defaultValue = "all", required = false) String sex
            , @RequestParam(defaultValue = "all", required = false) String sort
            , @RequestParam(defaultValue = "all", required = false) String roles
            , @RequestParam(required = false) String search) {

        page = page != null ? page : 1;
        ModelAndView mav = new ModelAndView("admin/user/user-table");
        String url = "http://localhost:8888/api/admin/users?page=" + (page - 1) + "&size=" + size;

        if (!"all".equals(sex)) url += "&sex=" + sex;

        if ("non-activated".equals(status)) {
            url += "&activated=false";
        } else if ("locked".equals(status)) {
            url += "&locked=true";
        } else if ("active".equals(status)) {
            url += "&locked=false&activated=true";
        }

        if (!"all".equals(sort)) url += "&sort=" + sort;
        if (!StringUtils.isEmpty(search)) url += "&search=" + search;
        if (!"all".equals(roles)) url += "&roles=" + roles;

        PageUserRequest users = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(securityService.getHeaders()), PageUserRequest.class).getBody();

        mav.addObject("data", users);
        UserFilterResponse userFilterResponse = new UserFilterResponse(sort, search, sex, status, roles);
        mav.addObject("filter", userFilterResponse);
        return mav;
    }

    @GetMapping("/user/{id}")
    public ModelAndView update(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/user/user-updateOrCreate");
        UserDTO user = restTemplate.exchange("http://localhost:8888/api/admin/user/" + id, HttpMethod.GET, new HttpEntity<>(securityService.getHeaders()), UserDTO.class).getBody();

        mav.addObject("roles", getRole());
        mav.addObject("user", user);
        mav.addObject("submitType", "Cập nhật");

        return mav;
    }

    private List<RoleDTO> getRole() {
        List<RoleDTO> roles = restTemplate.exchange("http://localhost:8888/api/admin/roles", HttpMethod.GET, new HttpEntity<>(securityService.getHeaders()), List.class).getBody();

        ObjectMapper mapper = new ObjectMapper();
        List<RoleDTO> roleDTOS = mapper.convertValue(roles, new TypeReference<List<RoleDTO>>() {
        });
        roleDTOS.forEach(roleDTO -> {
            if (Constant.ROLE_USER.equals(roleDTO.getName())) {
                roleDTO.setDescription(Constant.ROLE_USER_DESCRIPTION);
            } else if (Constant.ROLE_ADMIN.equals(roleDTO.getName())) {
                roleDTO.setDescription(Constant.ROLE_ADMIN_DESCRIPTION);
            } else if (Constant.ROLE_SALE.equals(roleDTO.getName())) {
                roleDTO.setDescription(Constant.ROLE_SALE_DESCRIPTION);
            }
        });
        roleDTOS.sort(new Comparator<RoleDTO>() {
            @Override
            public int compare(RoleDTO o1, RoleDTO o2) {
                if (o1.getId() > o2.getId()) {
                    return 1;
                } else if (o1.getId().equals(o2.getId())) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });

        return roleDTOS;
    }

    @GetMapping("/user/new")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("admin/user/user-updateOrCreate");
        mav.addObject("submitType", "Thêm mới");
        mav.addObject("roles", getRole());
        return mav;
    }

    @PostMapping("/user")
    private ModelAndView updateAndCreate(HttpServletRequest request) {
        ModelAndView modelAndView;
        ChangeUserAndResult changeUserAndResult;
        String id = request.getParameter("id");
        if (!StringUtils.isEmpty(id)) {
            changeUserAndResult = userService.updateByAdmin(request);
            modelAndView = update(Long.parseLong(id));
            modelAndView.addObject("submitType", "Cập nhật");
        } else {
            changeUserAndResult = userService.createByAdmin(request);
            modelAndView = new ModelAndView("admin/user/user-updateOrCreate");
            modelAndView.addObject("roles", getRole());
            modelAndView.addObject("submitType", "Thêm mới");
        }
        modelAndView.addObject("user", changeUserAndResult.getUserDTO());
        modelAndView.addObject("result", changeUserAndResult.getResult());

        return modelAndView;
    }

    @PostMapping("/users/deletes")
    public ModelAndView deletes(HttpServletRequest request){

        String result = userService.deletesByAdmin(request);

        ModelAndView modelAndView = getAllUser(1, 5, "all", "all"
                , "all", "all",null);
        modelAndView.addObject("result", result);

        return modelAndView;
    }
}
