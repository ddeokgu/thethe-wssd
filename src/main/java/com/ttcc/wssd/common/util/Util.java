package com.ttcc.wssd.common.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ttcc.wssd.common.security.UserInfo;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Component
public class Util {

    public static void main(String[] args) {
        //	System.out.println("1.23--41.23-4".replaceAll("[.-]", ""));
//		System.out.println("00--34..1.2345".replaceAll("[.-]", "").matches("^([1-9])[0-9]{8}$"));
//		System.out.println(getUUID());
    }

    /**
     * 스프링 시큐리티에 의해 만들어진 사용자 정보 가져오기.
     */
    public static UserInfo getUserInfo() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object userInfo = authentication.getPrincipal();
            if (userInfo instanceof UserInfo) {
                return (UserInfo) userInfo;
            }
        }
        return null;
    }

    /**
     * 스프링 시큐리티에 의해 만들어진 사용자 정보 가져오기.
     */
    public static String getUserInfo(String field) {
        UserInfo userInfo = getUserInfo();
        if (userInfo != null) {
            String value = "";
            try {
                value = (String) userInfo.getClass().getMethod(toGetterMethodName(field)).invoke(userInfo);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return value;
        } else {
            return "";
        }
    }

    /**
     * UUID 만들기.
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 나노 타임
     */
    public static String getNanoTimeStr() {
        return String.valueOf(System.nanoTime());
    }

    public static String getNanoTimeStr(int length) {
        String nano = getNanoTimeStr();
        return nano.substring(0, Math.min(length, nano.length()));
    }

    /**
     * DTO 등의 getter 메서드명 만들기.
     */
    public static String toGetterMethodName(String key) {
        return "get" + key.toUpperCase().charAt(0) + key.substring(1);
    }

    /**
     * 널/빈 문자열 여부 확인. 문자열 "null" 도 포함.
     */
    public static boolean isNull(Object str) {
        if (str == null || "".equals(str) || "null".equals(str)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 값이 널이면 빈 문자열 리턴, 아니면 해당 값 그대로 리턴.
     */
    public static <T> T nvl(T source) {
        return (T) nvl(source, "");
    }

    /**
     * 값이 널이면 지정한 대체 값 리턴, 아니면 해당 값 그대로 리턴.
     */
    public static <T> T nvl(T source, T defaultValue) {
        if (isNull(source)) {
            return defaultValue;
        } else {
            return source;
        }
    }

    /**
     * 현재 서버 아이피 가져오기.
     *
     * @throws UnknownHostException
     */
    public static String getLocalHostAddress() {
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 오늘 날짜 문자열로 리턴
     */
    public static final String Ymd = "yyyyMMdd";
    public static final String YmdHms = "yyyyMMddHHmmss";
    public static final String YmdHmsS = "yyyyMMddHHmmssSSS";
    public static final String YmdFmt = "yyyy.MM.dd";
    public static final String YmdHmsFmt = "yyyy.MM.dd HH:mm:ss";
    public static final String YmdHmsSFmt = "yyyy.MM.dd. HH:mm:ss SSS";

    public static String convertDateStrFormat(String value, String fromFmt, String toFmt) {
        try {
            Date d = new SimpleDateFormat(fromFmt).parse(value);
            return new SimpleDateFormat(toFmt).format(d);
        } catch (Exception e) {
            return value;
        }
    }

    //Vector 금액필드 전환용 double -> String 시 .90 -> .89999999999999999
    public static String parseForWon(String AMT, boolean pYN) {
        if (AMT.equals("")) {
            return "";
        }

        NumberFormat nf = NumberFormat.getInstance(); //NumberFormat 객체 생성
        nf.setGroupingUsed(false);
        Double d_value = Double.parseDouble(AMT.replaceAll(",", ""));
        if (pYN) {
            d_value = d_value * 100;
        } else {
            nf.setMaximumFractionDigits(2); // 2 dp floating
            nf.setMinimumFractionDigits(2); // as above
            d_value = d_value / 100;
        }

        String value = nf.format(d_value); //포맷에 맞춤

        return value;
    }

    //SAP 숫자필드 0 채운 값 제거
    public static String removeIntZero(String Str) {
        if (Str.equals("")) {
            return "";
        }

        Integer ii = Integer.parseInt(Str);
        return String.valueOf(ii);
    }

    public static Object getBean(String beanName) {
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        return context.getBean(beanName);
    }

    public static String timeFormat00(Object obj, int maxTime) {
        String str = obj.toString();
        int time = -1;
        try {
            time = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return "00";
        }
        if (str.length() == 1 && time < 10) {
            return "0" + str;
        } else if (str.length() == 1 && time < 10) {
            return str;
        } else if (time < maxTime) {
            return str;
        } else {
            return "00";
        }
    }

    public static boolean isPositiveNumber(String number) {
        try {
            return Integer.parseInt(number) > 0;
        } catch (Exception e) {
            return false;
        }
    }

    public static void setPageInfo(Map paramMap) {
        if (paramMap.get("rowsPerPage") == null || !Util.isPositiveNumber(paramMap.get("rowsPerPage").toString())) {
            paramMap.put("rowsPerPage", 10);
        } else if (paramMap.get("rowsPerPage") != null) {
            paramMap.put("rowsPerPage", Integer.parseInt(String.valueOf(paramMap.get("rowsPerPage"))));
        }
        if (paramMap.get("currentPage") == null || !Util.isPositiveNumber(paramMap.get("currentPage").toString())) {
            paramMap.put("currentPage", 1);
            paramMap.put("startIndex", 0);
        } else if (paramMap.get("currentPage") != null) {
            paramMap.put("currentPage", Integer.parseInt(String.valueOf(paramMap.get("currentPage"))));
            paramMap.put("startIndex", ((Integer.parseInt(String.valueOf(paramMap.get("currentPage"))))-1)*Integer.parseInt(String.valueOf(paramMap.get("rowsPerPage"))));
        }
        if (paramMap.get("searchText") == null) {
            paramMap.put("searchText", "");
        }
        if (paramMap.get("searchType") == null) {
            paramMap.put("searchType", "");
        }
    }

    public static void setPageInfo2(Map paramMap, String...defaultArr) {
        if (paramMap.get("currentPage") == null || !Util.isPositiveNumber(paramMap.get("currentPage").toString())) {
            paramMap.put("currentPage", 1);
        }
        if (paramMap.get("rowsPerPage") == null || !Util.isPositiveNumber(paramMap.get("rowsPerPage").toString())) {
            paramMap.put("rowsPerPage", 10);
        }
        paramMap.putIfAbsent("searchText", "");
        paramMap.putIfAbsent("searchType", "");
        if(defaultArr != null && defaultArr.length % 2 == 0){
            for(int i = 0; i < defaultArr.length; i += 2){
                if(paramMap.get(defaultArr[i]) == null || paramMap.get(defaultArr[i]).toString().length() == 0){
                    paramMap.put(defaultArr[i], defaultArr[i+1]);
                }
            }
        }
    }

    public static void setSearchPageInfo(Map paramMap) {
        if (paramMap.get("currentPage") == null || !Util.isPositiveNumber(paramMap.get("currentPage").toString())) {
            paramMap.put("currentPage", 1);
        } else if (paramMap.get("currentPage") != null) {
            paramMap.put("currentPage", Integer.parseInt(String.valueOf(paramMap.get("currentPage"))));
        }
        if (paramMap.get("rowsPerPage") == null || !Util.isPositiveNumber(paramMap.get("rowsPerPage").toString())) {
            paramMap.put("rowsPerPage", 20);
        } else if (paramMap.get("rowsPerPage") != null) {
            paramMap.put("rowsPerPage", Integer.parseInt(String.valueOf(paramMap.get("rowsPerPage"))));
        }
        if (paramMap.get("searchText") == null) {
            paramMap.put("searchText", "");
        }
        if (paramMap.get("searchType") == null) {
            paramMap.put("searchType", "");
        }
    }

    public static void setExcelPageInfo(Map paramMap) {
        paramMap.put("currentPage", 1);
        paramMap.put("rowsPerPage", 1000000);
        if (paramMap.get("searchText") == null) {
            paramMap.put("searchText", "");
        }
        if (paramMap.get("searchType") == null) {
            paramMap.put("searchType", "");
        }
    }

    public static String getNow(String format) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(format));
    }

    public static void print(Object obj) {
        if (obj == null) {
            System.out.println("null");
        } else if (obj instanceof String) {
            System.out.println(obj);
        } else if (obj instanceof Map) {
            ((Map<?, ?>) obj).forEach((key, value) -> System.out.println("\t" + key + " : " + value));
        } else if (obj instanceof List) {
            ((List<?>) obj).forEach(System.out::println);
        } else {
            System.out.println(obj.toString());
        }
    }

    public static long uncomma(Object value) {
        try {
            return Long.parseLong(String.valueOf(value).replaceAll(",", ""));
        } catch (Exception e) {
            return 0;
        }
    }

    public static String getRandomPrice(int numCount, int pickCount) {
        List<String> numList = new ArrayList<>();
        while (numList.size() < pickCount) {
            int randomNumber = (int) (Math.random() * numCount) + 1;
            if (numList.indexOf(String.valueOf(randomNumber)) < 0) {
                numList.add(String.valueOf(randomNumber));
            }
        }
        return String.join(",", numList);
    }

    // 아이피 가져오기
    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");

        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP-CLIENT-IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X-FORWARDED-FOR");
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }

    public static int getDistanceByLatLng(Object oLat1, Object oLng1, Object oLat2, Object oLng2){

        double lat1 = (double) oLat1;
        double lat2 = (double) oLat2;
        double lng1 = (double) oLng1;
        double lng2 = (double) oLng2;

        double theta = lng1 - lng2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1609.344;
        return (int) dist;

    }

    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

    public static void setLogPageInfo(Map paramMap) {
        if (paramMap.get("currentPage") == null || !Util.isPositiveNumber(paramMap.get("currentPage").toString())) {
            paramMap.put("currentPage", 1);
        } else if (paramMap.get("currentPage") != null) {
            paramMap.put("currentPage", Integer.parseInt(String.valueOf(paramMap.get("currentPage"))));
        }
        if (paramMap.get("rowsPerPage") == null || !Util.isPositiveNumber(paramMap.get("rowsPerPage").toString())) {
            paramMap.put("rowsPerPage", 10);
        } else if (paramMap.get("rowsPerPage") != null) {
            paramMap.put("rowsPerPage", Integer.parseInt(String.valueOf(paramMap.get("rowsPerPage"))));
        }
        if (paramMap.get("gubun") == null) {
            paramMap.put("gubun", "C");
        }
        if (paramMap.get("searchText") == null) {
            paramMap.put("searchText", "");
        }
        if (paramMap.get("searchType") == null) {
            paramMap.put("searchType", "");
        }

        // Date
        if (paramMap.get("datePart") == null) {
            paramMap.put("datePart", (int) Math.ceil(Integer.parseInt(Util.getNow("M")) / 3.0));
        }
        if (paramMap.get("dateYear") == null) {
            paramMap.put("dateYear", Util.getNow("YYYY"));
        }
    }

    public static Map jsonObjectToMap(JSONObject jsonObj){
        Map<String, Object> map = null;

        try {
            map = new ObjectMapper().readValue(jsonObj.toString(), Map.class);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }

    public static String setcomma(String value) {
        try {
            return value.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
        } catch (Exception e) {
            return "0";
        }
    }

    public static String getString(Object obj, String defaultValue) {
        return obj == null ? defaultValue : String.valueOf(obj);
    }

    public static String getString(Object obj) {
        return obj == null ? null : String.valueOf(obj);
    }

    public static int getInt(Object obj) {
        return Integer.parseInt(String.valueOf(obj));
    }

    public static int getInt(Object obj, int defaultValue) {
        try {
            return Integer.parseInt(String.valueOf(obj));
        } catch(NumberFormatException e) {
            return defaultValue;
        }
    }

    public static Map getMap(Object obj) {
        return (Map) obj;
    }

    public static <T> List<T> getList(Object obj, Class<T> clazz) {
        return (List<T>) obj;
    }

}
