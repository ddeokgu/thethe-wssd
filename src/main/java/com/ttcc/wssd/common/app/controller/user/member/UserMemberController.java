
package com.ttcc.wssd.common.app.controller.user.member;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.LoginService;
import com.ttcc.wssd.common.app.service.user.member.UserMemberService;
import com.ttcc.wssd.common.exception.ServiceException;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/common")
@Controller
public class UserMemberController extends CommonController {

    @Autowired
    private UserMemberService userMemberService;

    @Autowired
    PasswordEncoder passwordEncoder;
    
    @Autowired
	private LoginService loginService;

	@Autowired
	private MessageSource messageSource;
    
    @ResponseBody
    @PostMapping("/member/updatePassword.json")
    public Map updatePassewod(@RequestBody Map paramMap) {
        
    	System.err.println(paramMap);
    	UserInfo user = Util.getUserInfo();
		paramMap.put("loginUserSeq", user.getManagerSeq());
		
    	userMemberService.updatePassword(paramMap);
    	
        return JsonResponse.asSuccess();
    }
    
    @ResponseBody
    @PostMapping("/member/check-login-id")
    public Map checkLoginId(@RequestBody Map paramMap) {
        int checkLoginId = userMemberService.checkLoginId(paramMap);
        if(checkLoginId == 0)
            return JsonResponse.asSuccess();
        else
            return JsonResponse.asFailure("");
    }
    
    @ResponseBody
    @PostMapping("/member/checkPassword.json")
    public Map checkPassword(@RequestBody Map paramMap) throws AuthenticationException {
        
    	//paramMap.put("password" , passwordEncoder.encode(String.valueOf(paramMap.get("editPassword"))));
    	String password = String.valueOf(paramMap.get("editPassword"));
    	UserInfo user = (UserInfo) loginService.loadUserByUsername(String.valueOf(paramMap.get("editId")));
    	String status = "";
    	
    	System.err.println("paramMap : " + paramMap);
    	 if(!passwordEncoder.matches(password, user.getPassword())){
    		status = "fail";
 			//throw new BadCredentialsException(messageSource.getMessage("fail.common.pwd.diffrent", null, Locale.getDefault()));
 			
 		}else {
 			status = "success";
 		}
    	
    	 System.err.println("status : " + status);
    	 //int checkPassword = userMemberService.checkPassword(paramMap);
    	 //System.err.println("checkPassword : " + checkPassword);
    	
    	
    	
        if(status.equals("success")) {
        	System.err.println("!");
            return JsonResponse.asSuccess();
        }else {
        	System.err.println("?");
            return JsonResponse.asFailure("");
        }
    }

    @PostMapping("/member/agree.do")
    public String agree(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        session.removeAttribute("id");
        session.removeAttribute("platform");
        session.removeAttribute("memberId");
        session.removeAttribute("password");

        session.setAttribute("memberId", paramMap.get("mb_id"));
        session.setAttribute("password", paramMap.get("mb_pw"));
 /*
        System.out.println("멤버타입 : " + paramMap.get("member_type"));
        model.addAttribute("mb_type", paramMap.get("member_type"));

        paramMap.put("site_cd", SITE_CD);
        paramMap.put("doc_subject", "P1");
        Map p1 = memberService.Get_Policy_For_Register_S1_Str(paramMap);
        paramMap.put("doc_subject", "P2");
        Map p2 = memberService.Get_Policy_For_Register_S1_Str(paramMap);
        paramMap.put("doc_subject", "P3");
        Map p3 = memberService.Get_Policy_For_Register_S1_Str(paramMap);
        paramMap.put("doc_subject", "P4");
        Map p4 = memberService.Get_Policy_For_Register_S1_Str(paramMap);

        model.addAttribute("p1", p1);
        model.addAttribute("p2", p2);
        model.addAttribute("p3", p3);
        model.addAttribute("p4", p4);
*/
        return "main-user:/join/joinFile";
    }

    @PostMapping("/member/regist.do")
    public String regist(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
        HttpSession session = request.getSession(true);
        if(session.getAttribute("memberId") == null)
            throw new ServiceException();

        paramMap.put("MU_ID",session.getAttribute("memberId"));
        paramMap.put("MU_PW", session.getAttribute("password")!=null
                ?passwordEncoder.encode(String.valueOf(session.getAttribute("password")))
                :null);
        userMemberService.insertMember(paramMap);
        super.returnPage("회원가입이 완료되었습니다.", "/", response);
        return super.returnPage;
    }

    @GetMapping(value="/member/register.do")
    public String register(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request, HttpServletResponse response) {

        return "main-user:/join/join";
    }


}