package com.dfp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloServerResource {

    @GetMapping
    @RequestMapping("/hello")
    public String helloServer(){

        return "{\"version\":\"v1.0\",\n" +
                "\"msg\":\"Hello!! Greetings from DFP. You have successfully deployed your first Spring boot application with DFP cloud platform!\"}";
    }
}
