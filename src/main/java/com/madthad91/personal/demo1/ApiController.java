package com.madthad91.personal.demo1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping
public class ApiController {
    
    @GetMapping("/hello/{name}")
    public HelloMessage getHello(@PathVariable String name) {
        HelloMessage h = new HelloMessage();
        h.setName("Hello " + name);
        return h;
    }

    @GetMapping("/goodbye/{name}")
    public HelloMessage getGoodbye(@PathVariable String name) {
        HelloMessage h = new HelloMessage();
        h.setName("Goodbye " + name);
        return h;
    }

}
