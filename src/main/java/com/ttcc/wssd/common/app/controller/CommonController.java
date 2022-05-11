package com.ttcc.wssd.common.app.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class CommonController {

    protected String returnValue = "";
	protected String returnPage = "";

	public CommonController() {
    	returnPage = "/common/return/returnPage";
    	returnValue = "";
	}

	public String getReturnPage() {
		return returnPage;
	}

	public void setReturnPage(String returnPage) {
		this.returnPage = returnPage;
	}

	/**
	 * 리턴 관련 메쏘드1
	 *
	 * @return String
	 * @throws Exception
	 */
	protected String getReturnProc(String msg, String url) throws Exception {
		String strScript = "";
		strScript += "<script type='text/javaScript' language='javascript'>";
		if(!msg.equals(""))
			strScript += "alert('"+msg+"');";
		if(!url.equals(""))
			strScript += "location.href='"+url+"';";
		strScript += "</script>";
		return strScript;
	}

	@Value("${pg.mid}")
	public String PG_MID;
	@Value("${pg.key}")
	public String PG_KEY;
	@Value("${pg.cancel_key}")
	public String PG_CANCEL_KEY;

	public Map<String, Object> defaultMap = new HashMap<>();

	@ModelAttribute(name = "defaultMap")
	public Map<String, Object> getDefaultMap() {
		defaultMap.put("PG_MID", PG_MID);
		defaultMap.put("PG_KEY", PG_KEY);
		defaultMap.put("PG_CANCEL_KEY", PG_CANCEL_KEY);
		return defaultMap;
	}

//	@InitBinder
//	public void shopBinding(WebDataBinder binder) {
//		// 임시
//		System.err.println("SHOP BINDING ------------");
//		Object obj = binder.getTarget();
//		if (obj instanceof Map) {
//			setShopMap((Map) obj);
//		} else if (obj instanceof Map[]) {
//			for (int i = 0; i < ((Map[]) obj).length; i++) {
//				setShopMap(((Map[]) obj)[i]);
//			}
//		} else if (obj instanceof List) {
//			for (Object o : (List) obj) {
//				if (o instanceof Map) {
//					setShopMap((Map) o);
//				}
//			}
//		}
//	}

//	public void setShopMap(Map map) {
//		map.put("site_cd" , SITE_CD);
//		map.put("CAT_BENEFIT_USE_YN" , CAT_BENEFIT_USE_YN);
//		map.put("SHOP_USE_YN" , SHOP_USE_YN);
//		map.put("ADMIN_ROLE" , ADMIN_ROLE);
//	}
	/**
	 * 리턴 관련 메쏘드2
	 *
	 * @return String
	 * @throws Exception
	 */
	protected String getReturnProc3(String msg, String url) throws Exception {
		String strScript = "";
		strScript += "<script type='text/javaScript' language='javascript'>";
		if(!msg.equals(""))
			strScript += "alert('"+msg+"');";
		if(!url.equals(""))
			strScript += "location.replace('"+url+"');";
		strScript += "</script>";
		return strScript;
	}

	/**
	 * 리턴 관련 메쏘드3
	 *
	 * @return String
	 * @throws Exception
	 */
	protected String getReturnProc2(String msg, String url) throws Exception {
		String strScript = "";
		strScript += "<script type='text/javaScript' language='javascript'>";
		if(!msg.equals(""))
			strScript += "var con = confirm('"+msg+"');\n";
		if(!url.equals(""))
			strScript += "if(con){location.href='"+url+"';}\n";
			strScript += "else{history.back();}";
		strScript += "</script>";
		return strScript;
	}

	protected String returnPage(String msg, String url, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script language='javascript' type='text/javascript'>alert('"+msg+"');location.href='"+url+"';</script>");
		out.flush();
		return null;
	}
	
	/**
	 * 브라우저 구분 얻기.
	 *
	 * @param request
	 * @return
	 */
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}
	
	/**
	 * Disposition 지정하기.
	 *
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private HttpHeaders setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		HttpHeaders headers = new HttpHeaders();
		
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}
		headers.add("Content-Disposition", dispositionPrefix + encodedFilename);
	//	response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
		
		return headers;
	}
	
/*	@RequestMapping("/fileDownload.do")
	public ResponseEntity<Resource> fileDownload(HttpServletRequest request, HttpServletResponse response) {
		
		String stordFilePath = DEFAULT_PATH;		
		String filename = request.getParameter("filename");
		String original = request.getParameter("original");
		HttpHeaders headers = new HttpHeaders();
		Resource resource = new FileSystemResource(stordFilePath + filename);
		 
		if (original == null || "".equals(original)) {
			original = filename;			
		}		
		
		request.setAttribute("downFile", stordFilePath + filename);
		request.setAttribute("orginFile", original);
		
		try {
			headers = setDisposition(original, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@RequestMapping("/fileDownloadPath.do")
	public void fileDownloadPath(HttpServletRequest request, HttpServletResponse response) {
		
		String stordFilePath = DEFAULT_PATH;	
		String folder1 = request.getParameter("folder1");
		String folder2 = request.getParameter("folder2");
		String filename = request.getParameter("filename");
		String original = request.getParameter("original");
		 
		if (original == null || "".equals(original)) {
			original = filename;			
		}
		
		if (StringUtils.isEmpty(folder1)) {
			folder1 = "";
		} else {
			folder1 = folder1 + "/";
		}
		
		if (StringUtils.isEmpty(folder2)) {
			folder2 = "";
		} else {
			folder2 = folder2 + "/";
		}
		
		request.setAttribute("downFile", stordFilePath + folder1 + folder2 + filename);
		request.setAttribute("orginFile", original);
		
		try {
			setDisposition(original, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}		
	}
*/
	/**
	 * @brief
	 *
	 *        <pre>
	 * null 값을 처리하는 메소드
	 *        </pre>
	 *
	 * @return String
	 * @see
	 */
	public String f_get_parm(String val) {
		if (val == null)
			val = "";
		return val;
	}

	protected String getReturnClose(String msg, String tp){
		String strScript = "";
		strScript += "<script type='text/javascript'>\n";
		if(!"".equals(msg)){
			strScript += "alert('"+msg+"');\n";
		}
		strScript += "opener.location.href = '"+tp+"'; \n";
		strScript += "window.parent.close(); \n";
		strScript += "</script>";
		return strScript;
	}


}
