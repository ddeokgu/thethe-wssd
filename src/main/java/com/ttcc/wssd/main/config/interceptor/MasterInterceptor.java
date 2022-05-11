package com.ttcc.wssd.main.config.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpMethod;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.ttcc.wssd.common.config.WebSecurityConfig;
import com.ttcc.wssd.common.model.MenuItem;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;


@Component
public class MasterInterceptor implements HandlerInterceptor {
	

	String pattern = "([a-z0-9\\w-]+\\.*)+[a-z0-9]{2,4}";
	String menuSeq = "17";
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURI();    // query 제외한 ? 앞까지 url
		String queryString = request.getQueryString();  // ? 뒤의 url
		menuSeq = request.getParameter("menuSeq") == null ? menuSeq : request.getParameter("menuSeq");
		request.setAttribute("menuSeq", menuSeq);
		String totalUrl = "";
		if (queryString != null && !queryString.equals("")) {
			totalUrl = reqUrl + "?" + queryString;
		} else {
			totalUrl = reqUrl;
		}

		if (!"XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
			if (Util.getUserInfo() == null) {
				return false;
			}

			if (!totalUrl.contains("popup/")) { // popup URL 제외
				List<MenuItem> allowMenus = (List<MenuItem>) ((UserInfo)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getAllowedMenuMap().
						get(WebSecurityConfig.MASTER_MENU);
				
				MenuItem selectedMenu = null;
				setAllMenuSelectedFalse(allowMenus);
				if (allowMenus != null) {
					selectedMenu = findMenuItemBySeq(menuSeq, allowMenus);

					if (queryString != null && !queryString.equals("")) {
						System.err.println("셀렉트 트루1");
						setParentMenuSelectedTrue(selectedMenu, allowMenus);    // 둘다 selected 되게 해줌
					} else {
						System.err.println("셀렉트 트루2");
						//setParentMenuSelectedTrue(selectedMenu, allowMenus);
					}
				}
				if ((selectedMenu == null && !reqUrl.equals("/master")) || (selectedMenu == null && !reqUrl.equals("/admin"))  ) {
					throw new NoHandlerFoundException(HttpMethod.GET.toString(), request.getRequestURI(), null);
				}
				
				
				//Map paramMap = new HashMap();
				//paramMap.put("site_cd", SITE_CD);
				

			}
		}

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	

	public MenuItem findMenuItemBySeq(String menuSeq, List<MenuItem> allowMenus) {
		if (allowMenus != null) {
			for (MenuItem menuItem : allowMenus) {
				if (menuItem.getMenuSeq() == Integer.parseInt(menuSeq)) {
					return menuItem;
				}
			}
		}
		return null;
	}

	private void setParentMenuSelectedTrue(MenuItem child, List<MenuItem> allowMenus) {
		if (child != null) {
			child.setSelected(true);
			if (child.getParentMenuSeq() > 0) {
				MenuItem parentMenu = findMenuItemBySeq(child.getParentMenuSeq(), allowMenus);
				setParentMenuSelectedTrue(parentMenu, allowMenus);
			}
		}
	}

	private MenuItem findMenuItemBySeq(int parentMenuSeq, List<MenuItem> allowMenus) {
		for (MenuItem menuItem : allowMenus) {
			if (parentMenuSeq == menuItem.getMenuSeq()) {
				return menuItem;
			}
		}
		return null;
	}

	private void setAllMenuSelectedFalse(List<MenuItem> allowMenus) {
		if (allowMenus != null) {
			for (MenuItem menuItem : allowMenus) {
				menuItem.setSelected(false);
			}
		}
	}
	
	

}
