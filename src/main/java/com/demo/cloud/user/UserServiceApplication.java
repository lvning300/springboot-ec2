package com.demo.cloud.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;


@SpringBootApplication
public class UserServiceApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(UserServiceApplication.class, args);
    }


}

