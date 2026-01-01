package com.example.online_shoe_store.Config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

        @Value("${app.storage.products:./data/images/products/}")
        private String productsDir;

        @Value("${app.storage.categories:./data/images/categories/}")
        private String categoriesDir;

        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
                String productsLocation = "file:" + (productsDir.endsWith("/") ? productsDir : productsDir + "/");
                String categoriesLocation = "file:"
                                + (categoriesDir.endsWith("/") ? categoriesDir : categoriesDir + "/");

                // Product images - tìm trong cả data/images/products (uploads mới) và
                // productsDir (cũ)
                registry.addResourceHandler("/images/products/**")
                                .addResourceLocations("file:data/images/products/", productsLocation);

                registry.addResourceHandler("/images/categories/**")
                                .addResourceLocations(categoriesLocation);

                // Review images - lưu trong data/images/reviews
                registry.addResourceHandler("/images/reviews/**")
                                .addResourceLocations("file:data/images/reviews/");

                // tương thích ngược
                registry.addResourceHandler("/src/data/images/products/**")
                                .addResourceLocations(productsLocation);

                registry.addResourceHandler("/src/data/images/categories/**")
                                .addResourceLocations(categoriesLocation);
        }

        @Bean
        public RestTemplate restTemplate() {
                return new RestTemplate();
        }
}
