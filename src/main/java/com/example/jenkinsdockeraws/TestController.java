package com.example.jenkinsdockeraws;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping(value = "helloAws")
    public String test(){
        return "Hello Aws jenkins";
    }
}
