package com.ttcc.wssd.common.app.controller.admin.regist;


import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.attendance.AttendanceService;
import com.ttcc.wssd.common.app.service.admin.regist.AdminRegistService;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.app.service.admin.setting.fee.FeeService;
import com.ttcc.wssd.common.app.service.admin.setting.room.RoomService;
import com.ttcc.wssd.common.app.service.admin.setting.school.SchoolService;
import com.ttcc.wssd.common.app.service.admin.setting.test.TestService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/regist")
@Controller
public class AdminRegistController extends CommonController {

    @Autowired
    AdminRegistService adminRegistService;

    @Autowired
    RoomService roomService;

    @Autowired
    SchoolService schoolService;

    @Autowired
    TestService testService;

    @Autowired
    FeeService feeService;

    @Autowired
    ChannelService channelService;

    @Autowired
    AttendanceService attendanceService;

    @RequestMapping("/registList.do")
    public String registList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", adminRegistService.registCount());
        System.err.println("paraMap = = " + paramMap);
        model.addAttribute("list", adminRegistService.registList(paramMap));
        model.addAttribute("channelList", channelService.channelList(paramMap));
        model.addAttribute("schoolList", schoolService.schoolList(paramMap));
        model.addAttribute("testList", testService.testList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/regist/regist";
    }

    @ResponseBody
    @RequestMapping("/registOneList.do")
    public Map registOneList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        System.err.println("paraMap = = " + paramMap);
        List<Record> list = adminRegistService.registList(paramMap);
        model.addAttribute("list", list);
        System.err.println("list = = = = " + list);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/registUpdate.do")
    public Map registUpdate(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        System.err.println("paramMap ==== " + paramMap);
        paramMap.put("UPDATE_ID", user.getId());
        adminRegistService.adminRegistUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/registDelete.do")
    public Map registDelete(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        System.err.println("paramMap ==== " + paramMap);
        adminRegistService.adminRegistDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/registInsert.do")
    public Map registInsert(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        System.err.println("paramMap ==== " + paramMap);
       /* List<Record> list = adminRegistService.getMemberCd(paramMap);
        paramMap.put("REGIST_FIRST_DATE", list.get(0).get("REGIST_FIRST_DATE"));*/
        paramMap.put("REG_ID", user.getId());
        System.err.println(paramMap);
        adminRegistService.adminRegistInsert(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/roomList.do")
    public Map roomList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        return JsonResponse.asSuccess("roomList", roomService.roomList(paramMap));
    }

    @ResponseBody
    @RequestMapping("/feeList.do")
    public Map feeList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        return JsonResponse.asSuccess("feeList", feeService.feeList(paramMap));
    }

    @ResponseBody
    @RequestMapping("/seatUpdate.do")
    public Map seatUpdate(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        paramMap.put("DATE", today);
        adminRegistService.registSeatUpdate(paramMap);
        System.err.println("paramMap = = = " + paramMap);
        attendanceService.attendanceSeatUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/searchMuId.do")
    public Map searchMuId(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        System.err.println("paramMap == " + paramMap);
        List<Record> userList = adminRegistService.adminSearchMuId(paramMap);
        System.err.println("list == " + userList);
        return JsonResponse.asSuccess("userList", userList);
    }

}
