
package com.ttcc.wssd.common.app.controller.user.attendance;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.user.attendance.UserAttendanceService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.model.Record;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user/attendance")
@Controller
public class UserAttendanceController extends CommonController {


    @Autowired
    UserAttendanceService userAttendanceService;

    @RequestMapping("/attendance.do")
    public String attendance(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {

        Util.setPageInfo(paramMap);
        String mu_cd = user.getMbCd();
        LocalDate date = LocalDate.now();
        LocalDate start = date.withDayOfMonth(1);
        LocalDate end = date.withDayOfMonth(date.lengthOfMonth());

        System.err.println("start = = = = " + start);
        System.err.println("end = = = = " +end);

        paramMap.put("ATTENDANCE_MU_CD", mu_cd);
        paramMap.put("start" ,start);
        paramMap.put("end", end);
        paramMap.put("select_year", date.getYear());
        paramMap.put("select_month", start.toString().split("-")[1]);

        List<Record> list = userAttendanceService.userAttendanceList(paramMap);

        model.addAttribute("list", list);
        model.addAttribute("pageInfo", paramMap);

        return "main-user:/sub/attendance";
    }

    @ResponseBody
    @RequestMapping("/attendanceChange.do")
    public Map attendanceChange(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        String mu_cd ="";
        LocalDate date = LocalDate.now();

        if(paramMap.get("ATTENDANCE_MU_CD") == null || paramMap.get("ATTENDANCE_MU_CD").toString() == "") {
            mu_cd = user.getMbCd();
        } else {
            mu_cd = paramMap.get("ATTENDANCE_MU_CD").toString();
        }

        if(paramMap.get("MONTH") == null || paramMap.get("MONTH").toString() == "") {
            date = LocalDate.now();
        } else {
            String selectDate = paramMap.get("MONTH").toString();
            date =  LocalDate.parse(selectDate);
        }

        LocalDate start = date.withDayOfMonth(1);
        LocalDate end = date.withDayOfMonth(date.lengthOfMonth());

        paramMap.put("ATTENDANCE_MU_CD", mu_cd);
        paramMap.put("start" ,start);
        paramMap.put("end", end);
        paramMap.put("select_year", date.getYear());
        paramMap.put("select_month", start.toString().split("-")[1]);

        Map dateMap = new HashMap();
        dateMap.put("select_year", date.getYear());
        dateMap.put("select_month", start.toString().split("-")[1]);

        List<Record> list = userAttendanceService.userAttendanceList(paramMap);

        model.addAttribute("pageInfo", paramMap);

        return JsonResponse.asSuccess("list", list, "dateMap", dateMap);
    }

}