package com.ttcc.wssd.common.security.controller;


import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.security.authentication.CustomAuthenticationProvider;
import com.ttcc.wssd.common.security.authentication.CustomLoginSuccessHandler;
import com.ttcc.wssd.common.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SecurityController {

    @Autowired
    private CustomAuthenticationProvider customAuthenticationProvider;
    @Autowired
    private CustomLoginSuccessHandler customLoginSuccessHandler;

    @RequestMapping("/common/login.do")
    public String loginRequired(HttpServletRequest request, ModelMap model, @ModelAttribute("reqUrl") String reqUrl) {
        UserInfo user = Util.getUserInfo();
        request.getSession(true).setAttribute("reqUrl", reqUrl);

//        if(SHOP_TYPE.equals("close")){
//        if(user != null){
//            return "redirect:/shop/main.do";
//        }
//        Map<String, Object> paramMap = new HashMap<String, Object>();
//        paramMap.put("bmcode", "TTBD000006");
//        paramMap.put("site_cd", SITE_CD);
//        paramMap.put("currentPage", 1);
//        paramMap.put("rowsPerPage", 5);
//    	List<Map<String, Object>> balSql = boardService.Board_Article_List_S1_Str(paramMap);
//        model.addAttribute("blist", balSql);
//        } else{
//            return "redirect:/shop/main.do";
//        }
        if(user != null){
            return "redirect:/";
        }
        return "main-user:/login/login";

    }
    
    @RequestMapping("/master")
    public String adminLoginRequired2(HttpServletRequest request, @ModelAttribute("reqUrl") String reqUrl) {
        UserInfo user = Util.getUserInfo();
        if(user != null) {
        	reqUrl = "redirect:/master/login.do";
            return reqUrl;
        }
        return "redirect:/master/main.do";
    }
    
    @RequestMapping("/admin")
    public String adminLoginRequired3(HttpServletRequest request, @ModelAttribute("reqUrl") String reqUrl) {
        UserInfo user = Util.getUserInfo();
        if(user != null) {
        	reqUrl = "redirect:/master/login.do";
            return reqUrl;
        }
        return "redirect:/master/main.do";
    }
    
    
    
    @RequestMapping("/master/login.do")
    public String adminLoginRequired(HttpServletRequest request, @ModelAttribute("reqUrl") String reqUrl) {
        UserInfo user = Util.getUserInfo();
        if(user != null) {
        	reqUrl = "redirect:/master/main.do";
            return reqUrl;
        }
        return "login-admin:/login";
    }
    
    
   
}
