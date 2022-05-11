package com.ttcc.wssd.common.util;

import com.ttcc.wssd.common.util.paging.PlatformPaging;
import com.ttcc.wssd.common.util.paging.PlatformPaging2;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class DHTaglib {

    public static String pagingA(int totalCount, int currentPage, int rowsPerPage, int viewPageNum){
        return new PlatformPaging(totalCount, currentPage, rowsPerPage, viewPageNum).getResultTag();
    }
    public static String pagingB(int totalCount, int currentPage, int rowsPerPage, int viewPageNum){
        return new PlatformPaging2(totalCount, currentPage, rowsPerPage, viewPageNum).getResultTag();
    }
    public static String relaxFilter(String content){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.
                currentRequestAttributes()).
                getRequest();
        return Jsoup.clean(content.replace("&quot;", "\""),  (request.isSecure()?"https://":"http://") +request.getServerName() ,Whitelist.relaxed()
                .addAttributes("p","style")
                .addAttributes("span", "style")
                .addAttributes("table", "style")
                .addAttributes("tr", "style")
                .addAttributes("td", "style")
                .addAttributes("a", "style", "target")
                .addAttributes("b", "style")
                .addAttributes("img", "style", "src", "alt")
                .preserveRelativeLinks(true));
    }

    public static String noneFilter(String content){
        return Jsoup.clean(content, Whitelist.none());
    }

    public static String simpleTextFilter(String content){
        return Jsoup.clean(content, Whitelist.none());
    }

    public static long bitAnd(long a, long b){
//        System.out.println("a : " + (a));
//        System.out.println("b : " + (b));
//        System.out.println("a & b : " + (a & b));
        return a & b;
    }

    public static long bitAndByExp(long a, long exp){
//        System.out.println("a : " + (a));
//        System.out.println("b : " + (exp));
//        System.out.println("a & (int)Math.pow(2, exp) : " + (a & (int)Math.pow(2, exp)));
        return a & (long)Math.pow(2, exp);
    }

    public static long bitOr(long a, long b){
        return a | b;
    }

    public static long bitXor(long a, long b){
        return a ^ b;
    }

    public static long bitNot(long a){
        return ~ a;
    }

}
