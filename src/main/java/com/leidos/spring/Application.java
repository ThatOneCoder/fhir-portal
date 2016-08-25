package com.leidos.spring;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

// Local Web App
//@Configuration
//@ComponentScan
//@EnableAutoConfiguration
//@EnableTransactionManagement
//@EnableAsync
//public class Application extends SpringBootServletInitializer {
//
//    public static void main(String[] args) {
//        SpringApplication.run(applicationClass, args);
//    }
//
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//        return application.sources(applicationClass);
//    }
//
//    private static Class<Application> applicationClass = Application.class;
//}

// Hosted in JBoss
// Note: must use command: mvn clean install, not just install (otherwise, for some unknown reason, it doesn't work)
@Configuration
@ComponentScan
@EnableAutoConfiguration
@EnableTransactionManagement
@EnableAsync
public class Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(applicationClass, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(applicationClass);
    }

    private static Class<Application> applicationClass = Application.class;
}