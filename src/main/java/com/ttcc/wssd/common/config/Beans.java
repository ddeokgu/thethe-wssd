package com.ttcc.wssd.common.config;

import com.ttcc.wssd.common.security.authentication.CustomLoginUrlAuthenticationEntryPoint;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.web.context.request.RequestContextListener;

@Configuration
public class Beans {

    @Bean
    public RequestContextListener requestContextListener(){
        return new RequestContextListener();
    }

    /**
     * session expired 발생시 핸들러
     */
    @Bean
    public LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint() {
        LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint = new CustomLoginUrlAuthenticationEntryPoint(WebSecurityUrlConfig.LOGIN_PAGE);
        return loginUrlAuthenticationEntryPoint;
    }

}
