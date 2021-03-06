package com.ttcc.wssd.common.security.authentication;

import com.ttcc.wssd.common.config.WebSecurityConfig;
import com.ttcc.wssd.common.config.WebSecurityUrlConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

@Slf4j
public class CustomLoginUrlAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint {

	public CustomLoginUrlAuthenticationEntryPoint(String loginFormUrl) {
		super(loginFormUrl);
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
		response.setContentType("text/html; charset=UTF-8");
		response.setStatus(HttpStatus.UNAUTHORIZED.value());
		boolean ajaxFlag = false;
		if( "XMLHttpRequest".equals(request.getHeader("x-requested-with")) ) {
			ajaxFlag = true;
		}
		if(ajaxFlag) {
			//ajax request에 대한 세션 종료메시지는 commonScript.js ajaxSetup() 에서 보여준다.
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
		} else {
			PrintWriter out = response.getWriter();
			if(request.getRequestURI().equals("/")) {
				out.println("<script language='javascript' type='text/javascript'>location.href='" + WebSecurityUrlConfig.LOGIN_PAGE + "?reqUrl=" + URLEncoder.encode(request.getRequestURI()+"?"+request.getQueryString(), "UTF-8") + "';</script>");
			} else {
				if(request.getRequestURI().contains("/master")){
					out.println("<script language='javascript' type='text/javascript'>location.href='" + WebSecurityUrlConfig.ADMIN_LOGIN_PAGE + "';</script>");
				} else{
					out.println("<script language='javascript' type='text/javascript'>location.href='" + WebSecurityUrlConfig.LOGIN_PAGE + "?reqUrl=" + URLEncoder.encode(request.getRequestURI()+"?"+request.getQueryString(), "UTF-8") + "';</script>");
				}
			}
			out.flush();
		}
	}
}
