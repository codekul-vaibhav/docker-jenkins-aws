package com.example.jenkinsdockeraws;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping(value = "helloAws")
    public String test(){

        return "Hello,Welcome to UAT environment";

    }

}

//http://ec2-54-180-211-180.ap-northeast-2.compute.amazonaws.com:8081/helloAws