package com.example.online_shoe_store.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/src/data/images/products/**")
                .addResourceLocations("file:src/data/images/products/");

        registry.addResourceHandler("/src/data/images/categories/**")
                .addResourceLocations("file:src/data/images/categories/");
//        /src/data/images/products/main_6d6bde8b.jpg
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}

