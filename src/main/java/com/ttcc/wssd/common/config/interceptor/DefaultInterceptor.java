package com.ttcc.wssd.common.config.interceptor;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class DefaultInterceptor implements HandlerInterceptor{


	String pattern = "([a-z0-9\\w-]+\\.*)+[a-z0-9]{2,4}";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		String requestURL = request.getServerName();
//		UserInfo user = Util.getUserInfo();
//		if(user != null) {
//			if(request.getSession().getAttribute("platformCode") == null){
//				if(user.getPlatformCode()!=null && user.getPlatformCode().length() > 1){
//					request.getSession().setAttribute("platformCode", user.getPlatformCode());
//				}else{
//					for(Map map : commonMapper.PLATFORM_INFO_S3_Str()){
//						String domain = map.get("address").toString();
//						if(domain.matches(pattern) && requestURL.equals(domain)) {
//							request.getSession().setAttribute("platformCode", map.get("platformCode").toString());
//						}
//					}
//				}
//			}
//
//			if("company".equals(user.getGubunId())){
//				request.setAttribute("platformCode", user.getCompany_platformCode());
//				return true;
//			}else {
//				return true;
//			}
//		}else{
//			for(Map map : commonMapper.PLATFORM_INFO_S3_Str()){
//				String domain = map.get("address").toString();
//				if(domain.matches(pattern) && requestURL.equals(domain)) {
//					request.setAttribute("platformCode", map.get("platformCode").toString());
//					request.setAttribute("platformTitle", map.get("platformTitle"));
//					request.setAttribute("platformType", map.get("platformType"));
//					request.setAttribute("empLogin", map.get("empLogin"));
//					return true;
//				}
//			}
//			response.sendRedirect(cmarketURL);
//			return false;
//		}
		return true;
	}

}
