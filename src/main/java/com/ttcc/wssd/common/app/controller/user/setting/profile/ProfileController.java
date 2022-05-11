
package com.ttcc.wssd.common.app.controller.user.setting.profile;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.user.member.UserMemberService;
import com.ttcc.wssd.common.exception.ServiceException;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user/profile")
@Controller
public class ProfileController extends CommonController {

    @Autowired
    private UserMemberService userMemberService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @RequestMapping("/profile.do")
    public String profile(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user ) throws Exception {
        paramMap.put("MU_CD", user.getMbCd());
        Map<String, Object> member = userMemberService.getUserProfile(paramMap);
        model.addAttribute("member", member);
        return "main-user:/sub/profile";
    }

    @RequestMapping("/profileUpdate.do")
    public String profileUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user, HttpServletResponse response ) throws Exception {
        paramMap.put("MU_CD", user.getMbCd());
        userMemberService.updateProfile(paramMap);
        super.returnPage("수정이 완료되었습니다.", "/", response);
        return super.returnPage;
    }

    @ResponseBody
    @PostMapping("/userPasswordUpdate.do")
    public Map userPasswordUpdate(@RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        paramMap.put("MU_CD", user.getMbCd());
        Map memberInfo = userMemberService.getUserProfile(paramMap);
        String oriPassword = String.valueOf(memberInfo.get("MU_PW"));
        if (memberInfo.get("MU_PW") == null || "".equals(oriPassword))
            throw new ServiceException("", "");

        if (!passwordEncoder.matches(paramMap.get("oriPassword").toString(), oriPassword)) {
            throw new ServiceException("", "현재 비밀번호가 일치하지 않습니다.");
        }
        paramMap.put("newPassword", passwordEncoder.encode(paramMap.get("newPassword").toString()));
        userMemberService.userPasswordUpdate(paramMap);

        return JsonResponse.asSuccess();
    }
}