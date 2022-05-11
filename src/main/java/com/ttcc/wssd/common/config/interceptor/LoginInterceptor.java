package com.ttcc.wssd.common.config.interceptor;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@RequiredArgsConstructor
@Component
public class LoginInterceptor implements HandlerInterceptor{
	/*
	@Value("${shop.site_cd}")
    String SITE_CD;
    @Value("${shop.type}")
    String SHOP_TYPE;
    */
    String pattern = "([a-z0-9\\w-]+\\.*)+[a-z0-9]{2,4}";
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String reqUrl = request.getRequestURI();
        String memberId = (String) request.getSession().getAttribute("mbCd");
        System.out.println("세션 :: " + request.getSession().getAttribute("mbCd"));

        System.out.println("이거 :: " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());

        System.err.println("Login Interceptor ReqUrl : " + reqUrl);

        //System.err.println("Login Interceptor ReqUrl : " + SHOP_TYPE);


            if (memberId != null && !StringUtils.isEmpty(memberId) && SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
                if (reqUrl.contains("master") || reqUrl.contains("admin")) {
                    if (!request.getSession().getAttribute("mbType").equals("M")) {
                        System.err.println("여기");
                        response.setContentType("text/html; charset=UTF-8");
                        PrintWriter out = response.getWriter();
                        out.println("<script language='javascript' type='text/javascript'>alert('관리자로 로그인 후 이용해주세요.');location.href='/logout';</script>");
                        out.flush();
                    }
                }
                return true;
            } else if (memberId == null || SecurityContextHolder.getContext().getAuthentication().getPrincipal() == "anonymousUser") {
                if (reqUrl.contains("master") || reqUrl.contains("admin")) {
                    response.setContentType("text/html; charset=UTF-8");
                    if("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
                        response.sendError(401,"master");
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<script language='javascript' type='text/javascript'>location.href='/master/login.do';</script>");
                        out.flush();
                    }
                } else {
                    if (reqUrl.contains("user")) {
                        response.setContentType("text/html; charset=UTF-8");
                        if("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
                            response.sendError(401, "user");
                        } else {
                            PrintWriter out = response.getWriter();
                            out.println("<script language='javascript' type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='/common/login.do';</script>");
                            out.flush();
                        }

                    }
                }
            }


        return false;

    }

}
