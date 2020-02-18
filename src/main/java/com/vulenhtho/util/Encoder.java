package com.vulenhtho.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Encoder {

    public static void main(String[] args) {
//        RestTemplate restTemplate = new RestTemplate();
//        String url = "http://localhost:8888/user?userName=";
//        String userName = "sondx";
//        UserRequestApi restquestApi = restTemplate.getForObject(url + userName, UserRequestApi.class);
//        System.out.println(restquestApi.getUserName());
//        System.out.println(restquestApi.getPassword());
//        restquestApi.getRoles().forEach(System.out::println);

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String password = "123456";
        System.out.println(passwordEncoder.encode("123456"));
        System.out.println(passwordEncoder.matches("123456", "$2a$10$ZzgTtiC/E/LVCwolhkXDIOm3y0UxnY/jznXSThZfO890dp8r2p6sW"));

    }
}
