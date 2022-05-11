package com.ttcc.wssd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class WssdApplication {

    public static void main(String[] args) {
        SpringApplication.run(WssdApplication.class, args);
    }

}
