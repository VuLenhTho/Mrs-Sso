package com.vulenhtho.controller.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(required = false) String mess) {
        ModelAndView modelAndView = new ModelAndView("/web/login");
        if (!StringUtils.isEmpty(mess)) {
            switch (mess) {
                case "addToCart":
                    modelAndView.addObject("mess", "Bạn cần đăng nhập để mua hàng");
                    break;
                case "getCart":
                    modelAndView.addObject("mess", "Bạn cần đăng nhập để xem giỏ hàng");
                    break;
            }
        }
        return modelAndView;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/home";
    }

    @GetMapping("/signUp")
    public ModelAndView signUp() {
        return new ModelAndView("/web/sign-up");
    }


}
