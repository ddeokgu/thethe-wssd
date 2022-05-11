package com.ttcc.wssd.common.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.CacheControl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.WebContentInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.ttcc.wssd.common.config.interceptor.DefaultInterceptor;
import com.ttcc.wssd.common.config.interceptor.LoginInterceptor;
import com.ttcc.wssd.main.config.interceptor.MasterInterceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RequiredArgsConstructor
@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
	
	
	private final DefaultInterceptor defaultInterceptor; 
	
	private final LoginInterceptor loginInterceptor;
	
	private final MasterInterceptor masterInterceptor;
	
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**", "/favicon.ico")
				.addResourceLocations("/resources/")
				.setCacheControl(CacheControl.maxAge(4, TimeUnit.HOURS))
		;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	

	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
		resolver.setContentNegotiationManager(manager);

		// Define all possible view resolvers
		List<ViewResolver> resolvers = new ArrayList<ViewResolver>();

		resolvers.add(tilesViewResolver());
		resolver.setViewResolvers(resolvers);
		return resolver;
	}

	@Bean
	public ViewResolver tilesViewResolver() {
		TilesViewResolver viewResolver = new TilesViewResolver();
		viewResolver.setOrder(1);
		return viewResolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer(){
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/views/tiles/tiles.xml"});
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}

	@Bean
	public MessageSource messageSource(){
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:/messages/message");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setCacheSeconds(10);
		return messageSource;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		WebContentInterceptor wci = new WebContentInterceptor();
		wci.setCacheSeconds(0);
		registry.addInterceptor(wci);
		registry.addInterceptor(new DefaultInterceptor()).excludePathPatterns(
				"/*/*.json"
				, "/favicon.ico"
				, "/resources/**"
				, "/common/**"
		    	, "/error"
				, "/master/**"
				, "/admin/**"
				, "/img/**"
				, "/images/**"
		);
		
		//registry.addInterceptor(sInterceptor).excludePathPatterns("/board/**", "/master/**", "/**/css/**", "/**/font/**").addPathPatterns("/shop/**");		// shop 들어갈 때 shopInterceptor 거치기
		registry.addInterceptor(loginInterceptor).addPathPatterns("/master").addPathPatterns("/master/**").addPathPatterns("/admin").addPathPatterns("/admin/**").excludePathPatterns("/master/login.do","/favicon.ico","/board/**");
		registry.addInterceptor(loginInterceptor).addPathPatterns("/user").addPathPatterns("/user/**").excludePathPatterns("/common/login.do","/favicon.ico","/board/**");
		registry.addInterceptor(masterInterceptor).addPathPatterns("/master/**").addPathPatterns("/admin/**").excludePathPatterns(
			  "/master/login.do"
				, "/favicon.ico"
				, "/**/css/**"
				, "/**/font/**"
		);
		
		
	}

}
