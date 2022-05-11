package com.ttcc.wssd.common.security.authentication;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CustomLoginFailureHandler implements AuthenticationFailureHandler {


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String referrer = request.getHeader("Referer");

        String uLogin = "/common/login.do";
        String mLogin = "/master/login.do";

        exception.printStackTrace();
        System.out.println("로그인 실패");
        String loginFailMessage = exception.getMessage();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(referrer.contains(uLogin)){
            out.println("<script language='javascript' type='text/javascript'>alert('"+loginFailMessage+"');location.href='/common/login.do';</script>");
        }else if(referrer.contains(mLogin)){
            out.println("<script language='javascript' type='text/javascript'>alert('"+loginFailMessage+"');location.href='/master/login.do';</script>");
        }
        out.flush();
    }
}
