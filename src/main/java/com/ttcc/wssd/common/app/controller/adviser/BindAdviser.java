package com.ttcc.wssd.common.app.controller.adviser;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import java.util.List;
import java.util.Map;

/**
 * @author jklee
 * parameter 를 Map 에 담을때 managerSeq을 주입한다.
 */
@ControllerAdvice(annotations = Controller.class)
public class BindAdviser {

    public static final String LOGIN_USER_SEQ = "loginUserSeq";
    public static final String LOGIN_USER_ID = "loginUserId";
    public static final String LOGIN_USER_TYPE = "loginUserType";

    @InitBinder
    public void customizeBinding(WebDataBinder binder) {
        // 임시
//        System.err.println("SecurityContextHolder.getContext().getAuthentication() : " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        if (SecurityContextHolder.getContext().getAuthentication() != null && SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
            Object obj = binder.getTarget();
            if (obj instanceof Map) {
                setManagerSeq((Map) obj);
            } else if (obj instanceof Map[]) {
                for (int i = 0; i < ((Map[]) obj).length; i++) {
                    setManagerSeq(((Map[]) obj)[i]);
                }
            } else if (obj instanceof List) {
                for (Object o : (List) obj) {
                    if (o instanceof Map) {
                        setManagerSeq((Map) o);
                    }
                }
            }
        }
    }

    public void setManagerSeq(Map map) {

    }
}
