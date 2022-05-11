package com.ttcc.wssd.common.security.authentication;

import com.ttcc.wssd.common.util.Util;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Slf4j
@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        HttpSession session = request.getSession();
        process1(request, response, session);
        String reqUrl = session.getAttribute("reqUrl") == null ? null : String.valueOf(session.getAttribute("reqUrl"));
        session.removeAttribute("reqUrl");
        if(reqUrl != null && reqUrl.length() > 0) {
            response.sendRedirect(reqUrl);
        } else {
            if(Util.getUserInfo().getMbType().equals("M")) {
                response.sendRedirect("/master/main.do");
            } else {
                response.sendRedirect("/");
            }
        }

    }
    
    
    public void process1(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		session.setAttribute("mbCd", Util.getUserInfo().getMbCd());
		session.setAttribute("mbType", Util.getUserInfo().getMbType());
		session.setAttribute("loginFlag", "1");
		session.setAttribute("mbId", Util.getUserInfo().getId());

/*        String mb_cd = Util.getUserInfo().getMbCd();

        System.out.println("이것 :: " + Util.getUserInfo().getMbCd());

        LoginService lsvc = new LoginService();

        lsvc.uptMbrAcsRec(mb_cd);*/

		if (Util.getUserInfo().getMbType().equals("M")) {
			session.setMaxInactiveInterval(8 * 60 * 60);
		} else {
			session.setMaxInactiveInterval(30 * 60);
		}

		String idsave = null;
		if(Util.getUserInfo().getMbType().equals("M")){
			if(request.getParameter("mstSaveId") == null){
				idsave = "N";
			}else{
				idsave = request.getParameter("mstSaveId");
			}

		}else{
			if(request.getParameter("memSaveId") == null){
				idsave = "N";
			}else{
				idsave = request.getParameter("memSaveId");
			}
		}

		try{
			Cookie[] cookies = request.getCookies();
			Cookie enCookie = null;
			for(Cookie c : cookies) {
				if ("memSaveId".equals(c.getName())) {
					enCookie = c;
				}
			}
			System.err.println("쿠키 :: " + enCookie);

			if(Util.getUserInfo().getMbType().equals("M")){
				if (idsave.equals("Y")) {
					Cookie cookie = new Cookie("mstSaveId", "");
					cookie = new Cookie("mstSaveId", Util.getUserInfo().getId());
//                Cookie cookie = new Cookie("NVC", EncryptService.encryptAES256(Util.getUserInfo().getEncryptKey()+" ", Util.getUserInfo().getEncryptKey()));
					cookie.setMaxAge(8*60*60);
					cookie.setPath("/master/");
					response.addCookie(cookie);
				}else{
					Cookie cookie = new Cookie("mstSaveId", "");
					cookie.setMaxAge(0);
					cookie.setPath("/master/");
					response.addCookie(cookie);
				}

			}
			
			/*else{

				if (idsave.equals("Y")) {
					Cookie cookie = new Cookie("memSaveId", "");
					cookie = new Cookie("memSaveId", Util.getUserInfo().getId());
//	                Cookie cookie = new Cookie("NVC", EncryptService.encryptAES256(Util.getUserInfo().getEncryptKey()+" ", Util.getUserInfo().getEncryptKey()));
					cookie.setMaxAge(8*60*60);
					cookie.setPath("/shop/");
					response.addCookie(cookie);
				}else{
					Cookie cookie = new Cookie("memSaveId", "");
					cookie.setMaxAge(0);
					cookie.setPath("/shop/");
					response.addCookie(cookie);
				}

			}*/

		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
