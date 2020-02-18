package com.vulenhtho.controller.admin;


import com.vulenhtho.model.request.RoleRequest;
import com.vulenhtho.model.request.UpdateUserRequest;
import com.vulenhtho.model.request.UserFilterRequest;
import com.vulenhtho.model.response.UserFilterResponse;
import com.vulenhtho.service.SecurityService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserAdminController {

    private RestTemplate restTemplate;

    private SecurityService securityService;

    public UserAdminController(RestTemplate restTemplate, SecurityService securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @GetMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("admin/home-admin");
    }

    @GetMapping("/users")
    public ModelAndView getAllUser(
            @RequestParam(defaultValue = "1", required = false) Integer page
            , @RequestParam(defaultValue = "5", required = false) Integer size
            , @RequestParam(defaultValue = "all", required = false) String activated
            , @RequestParam(defaultValue = "all", required = false) String sex
            , @RequestParam(defaultValue = "all", required = false) String sort
            , @RequestParam(defaultValue = "all", required = false) String roles
            , @RequestParam(required = false) String search) {

        ModelAndView mav = new ModelAndView("admin/user-table");
        String url = "http://localhost:8888/users?page=" + (page - 1) + "&size=" + size;

        if (sex != null && !sex.equals("all")) url += "&sex=" + sex;
        if (activated != null && !activated.equals("all")) url += "&activated=" + activated;
        if (sort != null && !sort.equals("all")) url += "&sort=" + sort;
        if (search != null && search.length() > 0) url += "&search=" + search;
        if (roles != null && !roles.equals("all")) url += "&roles=" + roles;

        UserFilterRequest users = restTemplate.getForObject(url, UserFilterRequest.class);
        mav.addObject("data", users);
        UserFilterResponse userFilterResponse = new UserFilterResponse(sort, search, activated, sex);
        mav.addObject("filter", userFilterResponse);
        return mav;
    }

    @GetMapping("/user/{id}")
    public ModelAndView update(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("user-updateOrCreate");
        String userID = String.valueOf(id);
        UpdateUserRequest user = restTemplate.getForObject("http://localhost:8888/user/" + userID, UpdateUserRequest.class);
        List<RoleRequest> roleRequests = restTemplate.getForObject("http://localhost:8888/roles", List.class);
        mav.addObject("roles", roleRequests);
        mav.addObject("user", user);


        return mav;
    }


}
