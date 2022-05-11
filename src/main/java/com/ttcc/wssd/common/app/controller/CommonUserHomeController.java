package com.ttcc.wssd.common.app.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@RequiredArgsConstructor
@Controller
public class CommonUserHomeController {

    @GetMapping("/")
    public String indexPage() {
        return "main-user:/main";
    }

}
