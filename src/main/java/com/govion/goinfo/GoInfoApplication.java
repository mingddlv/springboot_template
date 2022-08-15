package com.govion.goinfo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.govion.goinfo")
@MapperScan("com.govion.goinfo.mapper")
public class GoInfoApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoInfoApplication.class, args);
    }

}
