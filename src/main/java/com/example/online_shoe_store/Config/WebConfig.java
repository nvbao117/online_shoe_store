package com.example.online_shoe_store.Config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${app.storage.products}")
    private String productsDir;

    @Value("${app.storage.categories}")
    private String categoriesDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/images/products/**")
                .addResourceLocations("file:" + ensureTrailingSlash(productsDir));

        registry.addResourceHandler("/images/categories/**")
                .addResourceLocations("file:" + ensureTrailingSlash(categoriesDir));
    }

    private String ensureTrailingSlash(String path) {
        if (path == null) return "";
        String p = path.trim().replace("\\", "/");
        if (p.isEmpty()) return "";
        return p.endsWith("/") ? p : p + "/";
    }
}
