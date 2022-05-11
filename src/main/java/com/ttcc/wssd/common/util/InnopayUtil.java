package com.ttcc.wssd.common.util;

import org.apache.commons.beanutils.BeanUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

@Component
public class InnopayUtil {

    // innopay 환불 주소
    public static final String REFUND_URL = "https://api.innopay.co.kr/api/cancelApi";
    // 환불 성공 코드
    public static final String REFUND_SUCCESS_CODE = "2001";
    
    // innopay 현금영수증 발행 주소
    public static final String CASHBILL_URL = "https://api.innopay.co.kr/api/cashPayApi";

    // innopay 현금영수증 발행 취소 주소
    public static final String CASHBILL_CANCEL_URL = "https://api.innopay.co.kr/api/cancelApi";
    
    // 가상계좌 발급 취소 주소
    public static final String VBANK_CANCEL_URL = "https://api.innopay.co.kr/api/vbankCancel";
    
    public static Map innopayCancel(Map map) throws Exception {
        JSONObject jsonObject = urlConnect(REFUND_URL, "POST", map);
        map.put("innopay_cancel_tid", (String.valueOf(jsonObject.get("pgTid"))));
        map.put("innopay_cancel_resultcode", (String.valueOf(jsonObject.get("resultCode"))));
        map.put("innopay_cancel_resultmsg", (String.valueOf(jsonObject.get("resultMsg"))));
        map.put("innopay_cancel_msg", (map.get("cancelMsg")));
        map.put("innopay_cancel_amount", (String.valueOf(jsonObject.get("pgApprovalAmt"))));
        map.put("innopay_cancel_pg_app_date", (String.valueOf(jsonObject.get("pgAppDate"))));
        map.put("innopay_cancel_pg_app_time", (String.valueOf(jsonObject.get("pgAppTime"))));
        map.put("innopay_cancel_state_cd", (String.valueOf(jsonObject.get("stateCd"))));
        map.put("innopay_cancel_time", (String.valueOf(jsonObject.get("pgAppDate")) + String.valueOf(jsonObject.get("pgAppTime"))));
        System.err.println("map = = = = = " + map);
        return map;
    }
    
    public static Map innopayCancel2(Map map) throws Exception {
        JSONObject jsonObject = urlConnect2(VBANK_CANCEL_URL, "POST", map);
        map.put("innopay_cancel_site_cd", map.get("site_cd"));
        map.put("innopay_cancel_tid", (map.get("tid")));
        map.put("innopay_cancel_resultcode", (String.valueOf(jsonObject.get("resultCode"))));
        map.put("innopay_cancel_resultmsg", (String.valueOf(jsonObject.get("resultMsg"))));
        map.put("innopay_cancel_msg", (map.get("cancelMsg")));
        map.put("innopay_cancel_amount", (map.get("amt")));
        map.put("innopay_cancel_pg_app_date", (String.valueOf(jsonObject.get("pgAppDate"))));
        map.put("innopay_cancel_pg_app_time", (String.valueOf(jsonObject.get("pgAppTime"))));
        map.put("innopay_cancel_state_cd", (String.valueOf(jsonObject.get("stateCd"))));
       // map.put("innopay_cancel_time", (String.valueOf(jsonObject.get("pgAppDate")) + String.valueOf(jsonObject.get("pgAppTime"))));
        
        return map;
    }
    
    
    public static Map innopayCancel3(Map map) throws Exception {
        JSONObject jsonObject = urlConnect3(REFUND_URL, "POST", map);
        map.put("innopay_cancel_site_cd", map.get("site_cd"));
        map.put("innopay_cancel_tid", (String.valueOf(jsonObject.get("pgTid"))));
        map.put("innopay_cancel_resultcode", (String.valueOf(jsonObject.get("resultCode"))));
        map.put("innopay_cancel_resultmsg", (String.valueOf(jsonObject.get("resultMsg"))));
        map.put("innopay_cancel_msg", (map.get("cancelMsg")));
        map.put("innopay_cancel_amount", (String.valueOf(jsonObject.get("pgApprovalAmt"))));
        map.put("innopay_cancel_pg_app_date", (String.valueOf(jsonObject.get("pgAppDate"))));
        map.put("innopay_cancel_pg_app_time", (String.valueOf(jsonObject.get("pgAppTime"))));
        map.put("innopay_cancel_state_cd", (String.valueOf(jsonObject.get("stateCd"))));
        map.put("innopay_cancel_time", (String.valueOf(jsonObject.get("pgAppDate")) + String.valueOf(jsonObject.get("pgAppTime"))));
        return map;
    }
    
    
    @SuppressWarnings("unchecked")
	public static Map innopayCashBillIssue(Map map) throws Exception {
        System.err.println("현금영수증 맵 : " + map);
        JSONObject jsonObject = urlConnect(CASHBILL_URL, "POST", map);
        map.put("cashBill_total_amt", (String.valueOf(jsonObject.get("amt"))));
        map.put("cashBill_authCode", (String.valueOf(jsonObject.get("authCode"))));
        map.put("cashBill_authDate", (String.valueOf(jsonObject.get("authDate"))));
        map.put("cashBill_buyerName", (String.valueOf(jsonObject.get("buyerName"))));
        map.put("cashBill_dutyFreeAmt", (String.valueOf(jsonObject.get("dutyFreeAmt"))));
        map.put("cashBill_goodsCnt", (String.valueOf(jsonObject.get("goodsCnt"))));
        map.put("cashBill_goodsName", (String.valueOf(jsonObject.get("goodsName"))));
        map.put("cashBill_mid", (String.valueOf(jsonObject.get("mid"))));
        map.put("cashBill_moid", (String.valueOf(jsonObject.get("moid"))));
        map.put("cashBill_resultCode", (String.valueOf(jsonObject.get("resultCode"))));
        map.put("cashBill_resultMsg", (String.valueOf(jsonObject.get("resultMsg"))));
        map.put("cashBill_userId", (String.valueOf(jsonObject.get("userId"))));
        map.put("cashBill_tid", (String.valueOf(jsonObject.get("tid"))));
        map.put("cashBill_site_cd", map.get("site_cd"));
        map.put("scral_cd", map.get("scral_cd"));
        map.put("mb_cd", map.get("mb_cd"));
        return map;
    }

    public static Map innopayCashBillCancel(Map map) throws Exception {
        System.err.println("map = = = =" + map);
        JSONObject jsonObject = urlConnect(CASHBILL_CANCEL_URL, "POST", map);
        System.err.println("jsonObject = = = " + jsonObject);
        map.put("cashBill_resultCode", (String.valueOf(jsonObject.get("resultCode"))));
        map.put("cashBill_tid", (String.valueOf(jsonObject.get("tid"))));
        map.put("cashBill_resultMsg", (String.valueOf(jsonObject.get("resultMsg"))));
        return map;
    }
    

    public static JSONObject urlConnect(String uri, String method, Map map) throws Exception {
        JSONObject jsonParam = new JSONObject();
        Map<String, Object> jsonMap = BeanUtils.describe(map);
        jsonParam.putAll(map);
        URL url = new URL(uri);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        
        // 실서버 올릴시 이걸로 변경(https)
        /*
        HttpsURLConnection  con = (HttpsURLConnection) url.openConnection();
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		con.setDoInput(true);
		con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);
        
      OutputStream wr = con.getOutputStream();
      wr.write( jsonParam.toJSONString().getBytes("utf-8") );
      wr.flush();
		
		StringBuilder sb = new StringBuilder();
		System.err.println("TEST 1.");
		if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
			System.err.println("TEST 2.");
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		} else {
			System.err.println("TEST 3." + con.getResponseMessage());
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		}
		System.err.println("TEST 4." + sb.toString());

		JSONParser jsonParser = new JSONParser();
		return (JSONObject) jsonParser.parse(sb.toString());
        */
        
        
        con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
        con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
        con.setRequestMethod(method);
        //json으로 message를 전달하고자 할 때
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoInput(true);
        con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
        con.setUseCaches(false);
        con.setDefaultUseCaches(false);
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        wr.write(jsonParam.toJSONString()); //json 형식의 message 전달
        wr.flush();
        StringBuilder sb = new StringBuilder();
        if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), "utf-8"));
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            br.close();
        } else {
            System.err.println("CONNECTION... NO");
        }
        JSONParser jsonParser = new JSONParser();
        return (JSONObject) jsonParser.parse(sb.toString());
    }
    
    
    
    public static JSONObject urlConnect2(String uri, String method, Map map) throws Exception {
        JSONObject jsonParam = new JSONObject();
        Map<String, Object> jsonMap = BeanUtils.describe(map);
        jsonParam.putAll(map);
        URL url = new URL(uri);
        
        
        // 실서버 올릴시 이걸로 변경(https)
        /*
        HttpsURLConnection  con = (HttpsURLConnection) url.openConnection();
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		con.setDoInput(true);
		con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);
        
      OutputStream wr = con.getOutputStream();
      wr.write( jsonParam.toJSONString().getBytes("utf-8") );
      wr.flush();
		
		StringBuilder sb = new StringBuilder();
		System.err.println("TEST 1.");
		if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
			System.err.println("TEST 2.");
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		} else {
			System.err.println("TEST 3." + con.getResponseMessage());
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		}
		System.err.println("TEST 4." + sb.toString());

		JSONParser jsonParser = new JSONParser();
		return (JSONObject) jsonParser.parse(sb.toString());
        */
        
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
        con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
        con.setRequestMethod(method);
        //json으로 message를 전달하고자 할 때
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoInput(true);
        con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
        con.setUseCaches(false);
        con.setDefaultUseCaches(false);
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        wr.write(jsonParam.toJSONString()); //json 형식의 message 전달
        wr.flush();
        StringBuilder sb = new StringBuilder();
        if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), "utf-8"));
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            br.close();
        } else {
            System.err.println("CONNECTION... NO");
        }
        JSONParser jsonParser = new JSONParser();
        return (JSONObject) jsonParser.parse(sb.toString());
    }
    
    
    
    public static JSONObject urlConnect3(String uri, String method, Map map) throws Exception {
        JSONObject jsonParam = new JSONObject();
        Map<String, Object> jsonMap = BeanUtils.describe(map);
        jsonParam.putAll(map);
        URL url = new URL(uri);
        
        
        // 실서버 올릴시 이걸로 변경(https)
        /*
        HttpsURLConnection  con = (HttpsURLConnection) url.openConnection();
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		con.setDoInput(true);
		con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);
        
      OutputStream wr = con.getOutputStream();
      wr.write( jsonParam.toJSONString().getBytes("utf-8") );
      wr.flush();
		
		StringBuilder sb = new StringBuilder();
		System.err.println("TEST 1.");
		if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
			System.err.println("TEST 2.");
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		} else {
			System.err.println("TEST 3." + con.getResponseMessage());
			BufferedReader br = new BufferedReader(
					new InputStreamReader(con.getInputStream(), "utf-8"));
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			br.close();
		}
		System.err.println("TEST 4." + sb.toString());

		JSONParser jsonParser = new JSONParser();
		return (JSONObject) jsonParser.parse(sb.toString());
        */
        
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
        con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
        con.setRequestMethod(method);
        //json으로 message를 전달하고자 할 때
        con.setRequestProperty("Content-Type", "application/json");
        con.setDoInput(true);
        con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
        con.setUseCaches(false);
        con.setDefaultUseCaches(false);
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        wr.write(jsonParam.toJSONString()); //json 형식의 message 전달
        wr.flush();
        StringBuilder sb = new StringBuilder();
        if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), "utf-8"));
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            br.close();
        } else {
            System.err.println("CONNECTION... NO");
        }
        JSONParser jsonParser = new JSONParser();
        return (JSONObject) jsonParser.parse(sb.toString());
    }
}
