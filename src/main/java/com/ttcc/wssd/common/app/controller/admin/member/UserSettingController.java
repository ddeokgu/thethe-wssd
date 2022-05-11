package com.ttcc.wssd.common.app.controller.admin.member;


import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.member.AdminUserMemberService;
import com.ttcc.wssd.common.app.service.user.member.UserMemberService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.model.Record;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/member")
@Controller
public class UserSettingController extends CommonController {

    @Autowired
    AdminUserMemberService adminUserMemberService;

    @Autowired
    UserMemberService userMemberService;


    @RequestMapping("/userList.do")
    public String registList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", adminUserMemberService.adminUserMemberCount(paramMap));
        List<Record> list = adminUserMemberService.adminUserMemberList(paramMap);
        model.addAttribute("pageInfo", paramMap);
        model.addAttribute("list", list);
        return "main-admin:/member/list";
    }

    @ResponseBody
    @RequestMapping(value = "/passwordReset.do", produces = "application/json; utf-8")
    public Map passwordReset(Model model, @RequestBody Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        paramMap.put("password", "123456");
        System.err.println("paramMap = = = " + paramMap);
        userMemberService.updatePassword(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping(value = "/memberDeleteCheck.do", produces = "application/json; utf-8")
    public Map memberDeleteCheck(Model model, @RequestBody Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        paramMap.put("DATE", today);
        System.err.println("paramMap = = = " + paramMap);
        int count = adminUserMemberService.adminUserMemberDeleteCheck(paramMap);
        return JsonResponse.asSuccess("count", count);
    }

    @ResponseBody
    @RequestMapping(value = "/memberDelete.do", produces = "application/json; utf-8")
    public Map memberDelete(Model model, @RequestBody Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        System.err.println("paramMap = = = " + paramMap);
        adminUserMemberService.adminUserMemberDelete(paramMap);
        return JsonResponse.asSuccess();
    }

}
