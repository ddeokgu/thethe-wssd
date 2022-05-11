package com.ttcc.wssd.common.security.authentication;

import com.ttcc.wssd.common.config.WebSecurityUrlConfig;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        log.error("access denied handler");
        response.setContentType("text/html; charset=UTF-8");
        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        e.printStackTrace();
        boolean ajaxFlag = false;
        if("XMLHttpRequest".equals(request.getHeader("x-requested-with"))){
            ajaxFlag = true;
        }
        if(ajaxFlag) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
        } else {
            UserInfo user = Util.getUserInfo();
            if (user == null) {
                response.sendRedirect("/common/login.do");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<script language='javascript' type='text/javascript'>alert('로그인이 필요합니다.');location.href='" + WebSecurityUrlConfig.LOGIN_PAGE + "'}</script>");
            }
        }
    }
}
