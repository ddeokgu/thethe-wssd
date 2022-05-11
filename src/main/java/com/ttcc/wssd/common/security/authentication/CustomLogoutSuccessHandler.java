package com.ttcc.wssd.common.security.authentication;


import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.ttcc.wssd.common.security.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

    private final String LOGOUT_SUCCESS_URL = "/";

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
         String mb_type = request.getParameter("mb_type");
         if(authentication != null){
 			Object userObj = authentication.getPrincipal();
 			if(userObj instanceof UserInfo){
 				System.out.println(userObj);
 			}
 		}
        if(mb_type == null){
            response.sendRedirect("/master/login.do");
            return;
        }else if(mb_type.equals("M")){
            response.sendRedirect("/master/login.do");
        }else if(mb_type.equals("U")){
            response.sendRedirect(LOGOUT_SUCCESS_URL);
        }
    }
}
