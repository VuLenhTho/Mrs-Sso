package com.vulenhtho.controller.web;

import com.vulenhtho.model.request.RoleRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    private RestTemplate restTemplate;

    public HomeController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }


    @GetMapping("/accessDenied")
    public ModelAndView accessDenied() {
        ModelAndView modelAndView = new ModelAndView("login");
        String mess = "Bạn không đủ quyền truy cập vào trang này, hãy đăng nhập với tài khoản hợp lệ!";
        modelAndView.addObject("mess", mess);
        return modelAndView;
    }


    @GetMapping("/newUser")
    public ModelAndView addUser() {
        ModelAndView modelAndView = new ModelAndView("user-updateOrCreate");

        List<RoleRequest> roleRequests = restTemplate.getForObject("http://localhost:8888/roles", List.class);
        modelAndView.addObject("roles", roleRequests);

        return modelAndView;
    }


//    @GetMapping(value = "/accessDenied")
//    public String accessDenied(ModelMap model) {
//        model.addAttribute("message", "your aren't permission this url");
//
//        return "redirect:/login";
//    }
}
