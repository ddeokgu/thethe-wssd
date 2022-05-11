package com.ttcc.wssd.common.config;

import com.ttcc.wssd.common.security.authentication.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	public static final String ADMIN_LOGIN_PAGE = "/master/login.do";
	public static final String LOGIN_PROCESS_URL = "/common/member/loginProc.do";
	public static final String USERNAME_PARAM_NAME = "memberId";
	public static final String PASSWORD_PARAM_NAME = "memberPass";
	public static final String LOGIN_SUCCESS_URL = "/main.do";
	public static final String LOGIN_PAGE = "/common/login.do";
	public static final String MASTER_MENU = "MASTER_MENU";

	private final LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint;
	private final CustomAuthenticationProvider customAuthenticationProvider;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web
			.ignoring()
				.antMatchers("/favicon.ico", "/resources/**", "/logo/**"
				)
		;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.headers()
				.frameOptions().sameOrigin() //Spring Security 는 디폴트로 iframe 사용을 막고 있다. 동일한 도메인일 경우 허용하도록 설정.
				.and()
			.csrf()
				.disable()
			.authorizeRequests()
				.antMatchers("/**").permitAll()
				.antMatchers("/*/main.do").permitAll()
				.antMatchers("/error").permitAll()
				.antMatchers("/mater/**").hasRole("ADMIN")
				.antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/common/member/**").permitAll()
				.antMatchers(ADMIN_LOGIN_PAGE).permitAll()
				.anyRequest().permitAll()
				.and()
			.formLogin()
				.usernameParameter(USERNAME_PARAM_NAME)
				.passwordParameter(PASSWORD_PARAM_NAME)
                .loginPage(WebSecurityUrlConfig.LOGIN_PAGE).permitAll()
                .loginProcessingUrl(WebSecurityUrlConfig.LOGIN_PROCESS_URL).permitAll()
                .successHandler(new CustomLoginSuccessHandler())
                .failureHandler(new CustomLoginFailureHandler())
                .and()
            .logout()
            	.logoutUrl("/logout")
            	.invalidateHttpSession(true)
            	.deleteCookies("JSESSIONID")
            	.logoutSuccessHandler(new CustomLogoutSuccessHandler())
            	.permitAll()
                .and()
            .exceptionHandling()
                .authenticationEntryPoint(loginUrlAuthenticationEntryPoint)
            	.accessDeniedHandler(new CustomAccessDeniedHandler())
            	.and()
            .sessionManagement()
            	.and()
         ;
	}

	

        /**
         * 사용자 인증 관련 설정
         */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//커스텀한 AuthenticationProvider 설정.
		auth.authenticationProvider(customAuthenticationProvider);
	}
	
	
	

}
