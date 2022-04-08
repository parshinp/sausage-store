package com.yandex.practicum.devops;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SausageApplication {

    public static void main(String[] args) throws Exception {
        TrustAllCerts.trustAllCerts();
        SpringApplication.run(SausageApplication.class, args);
    }

}
