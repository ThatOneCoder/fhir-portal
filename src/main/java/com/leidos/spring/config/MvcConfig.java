package com.leidos.spring.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {
	
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
//        registry.addViewController("/").setViewName("home");
        registry.addViewController("/login").setViewName("login");
    }

//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/fhir-portal/public/**")
//                .addResourceLocations("classpath:/public/");
//        registry.addResourceHandler("/css/**")
//                .addResourceLocations("/css/");
//        registry.addResourceHandler("/img/**")
//                .addResourceLocations("/img/");
//        registry.addResourceHandler("/js/**")
//                .addResourceLocations("/js/");
//    }

}
