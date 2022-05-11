
package com.ttcc.wssd.common.app.controller.user.setting.regist;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.pay.PayService;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.app.service.admin.setting.fee.FeeService;
import com.ttcc.wssd.common.app.service.admin.setting.school.SchoolService;
import com.ttcc.wssd.common.app.service.admin.setting.test.TestService;
import com.ttcc.wssd.common.app.service.user.setting.regist.RegistService;
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

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user/setting")
@Controller
public class RegistController extends CommonController {

    @Autowired
    RegistService registService;

    @Autowired
    FeeService feeService;

    @Autowired
    ChannelService channelService;

    @Autowired
    TestService testService;

    @Autowired
    SchoolService schoolService;

    @Autowired
    PayService payService;

    @RequestMapping("/registList.do")
    public String registList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        paramMap.put("MU_CD" , user.getMbCd());
        paramMap.put("MU_NAME" , user.getName());
        String regist_date = registService.getRegistFirstDate(paramMap);
        paramMap.put("MU_REGIST_DATE", regist_date);
        paramMap.put("MU_PHONE", user.getPhone());
        paramMap.put("totalCount", registService.registCount(paramMap));
        model.addAttribute("list" , registService.registList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        return "main-user:/sub/record";
    }

    @RequestMapping("/register.do")
    public String registPage (Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        Util.setPageInfo(paramMap);
        System.err.println("paramMap = = = " + paramMap);
        if(paramMap.get("REGIST_SEQ") != null && paramMap.get("REGIST_SEQ") != "") {
            System.err.println(paramMap.get("REGIST_SEQ").toString());
            Map <String,Object> resultMap = registService.selectRegistOne(paramMap);
            System.err.println("resultMap =  ==  = " + resultMap);
            model.addAttribute("resultMap" , resultMap);
        }

        paramMap.put("MU_CD" , user.getMbCd());
        paramMap.put("MU_NAME" , user.getName());
        String regist_date = registService.getRegistFirstDate(paramMap);
        paramMap.put("MU_REGIST_DATE", regist_date);
        paramMap.put("MU_GENDER", user.getGender());
        paramMap.put("MU_PHONE", user.getPhone());
        model.addAttribute("channelList",channelService.channelList(paramMap));
        model.addAttribute("schoolList", schoolService.schoolList(paramMap));
        model.addAttribute("testList", testService.testList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        System.err.println("channelList = = = " + channelService.channelList(paramMap));

        return "main-user:/sub/register";

    }

    @ResponseBody
    @RequestMapping("/registInsert.do")
    public Map registInsert(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        paramMap.put("REGIST_MU_CD" , user.getMbCd());
        paramMap.put("REG_ID", user.getId());
        paramMap.put("REGIST_MU_ID", user.getId());
        paramMap.put("REGIST_MU_PHONE", user.getPhone());
        paramMap.put("REGIST_MU_GENDER", user.getGender());
        System.err.println("paramMap === " + paramMap);

        registService.registInsert(paramMap);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");

        LocalDate startDate = LocalDate.parse(paramMap.get("REGIST_START_DATE").toString(), formatter);
        LocalDate endDate = LocalDate.parse(paramMap.get("REGIST_END_DATE").toString(), formatter);
        List <LocalDate> dateList = getDatesBetweenTwoDates(startDate, endDate);

        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/registRoomList.do")
    public Map registRoomList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
       return JsonResponse.asSuccess("roomList" ,  registService.registRoomList(paramMap));
    }

    @ResponseBody
    @RequestMapping("/registSeatList.do")
    public Map registSeatList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        paramMap.put("REGIST_MU_CD" , user.getMbCd());
        paramMap.put("REG_ID", user.getId());
        return JsonResponse.asSuccess("seatList" ,  registService.registSeatList(paramMap));
    }

    @ResponseBody
    @RequestMapping("/seatInsert.do")
    public Map seatInsert(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        paramMap.put("REGIST_MU_CD" , user.getMbCd());
        paramMap.put("REG_ID", user.getId());
        registService.seatInsert(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/feeList.do")
    public Map feeList(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        return JsonResponse.asSuccess("list",  registService.feeList(paramMap));
    }


    @ResponseBody
    @RequestMapping("/roomSiteMapCheck.do")
    public Map roomSiteMapCheck(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) {
        return JsonResponse.asSuccess("ROOM_SITE_MAP",  registService.roomSiteMapCheck(paramMap));
    }


    @ResponseBody
    @RequestMapping("/payCheck.do")
    public Map payCheck(Model model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws ParseException {
        Util.setPageInfo(paramMap);

        String startDate = paramMap.get("REGIST_START_DATE").toString();
        String endDate = paramMap.get("REGIST_END_DATE").toString();
        System.err.println("paramMap = = = = = " + paramMap);
        List<Record> feeList = feeService.feeList(paramMap);
        String REGIST_MU_SCHOOL = paramMap.get("REGIST_MU_SCHOOL").toString();
        System.err.println(REGIST_MU_SCHOOL);

        HashSet<String> setA = new HashSet<String>();
        HashSet<String> setB = new HashSet<String>();
        HashSet<String> setKyo = new HashSet<String>();
        if(REGIST_MU_SCHOOL != null && REGIST_MU_SCHOOL != "") {
            List<Record> vacationlist = schoolService.schoolVacationList(paramMap);
            for(int i = 0; i<vacationlist.size(); i++) {
                for(LocalDate date = LocalDate.parse(vacationlist.get(i).getString("VACATION_START")); date.isBefore(LocalDate.parse(vacationlist.get(i).getString("VACATION_END")).plusDays(1)); date = date.plusDays(1)) {
                    setA.add(date.toString());
                }
            }
        }
        System.err.println("setA == " + setA);

        for(LocalDate date = LocalDate.parse(startDate); date.isBefore(LocalDate.parse(endDate).plusDays(1)); date = date.plusDays(1)) {
            setB.add(date.toString());
        }

        System.err.println("setB == " + setB);

        Iterator<String> it = setB.iterator();
        while(it.hasNext()) {
            String temp = (String) it.next();
            if(setA.contains(temp)) { // 중복이 있는지 확인하기(생략가능)
                setKyo.add(temp);
            }
        }
        System.err.println("setKyo== " + setKyo);
        System.err.println("setBsize == " + setB.size());
        System.err.println("종일반 == " + setKyo.size());
        System.err.println("방과후반 == " + (setB.size()-setKyo.size()));
        System.err.println("feeList == " + feeList);
        int allDayFee;
        int afterSchoolFee;
        int allDay;
        int afterSchool;

        if(feeList.get(0).getString("FEE_EXC_SET").equals("Y")) {
            allDay = setKyo.size();
            afterSchool = (setB.size()-setKyo.size());
            allDayFee = feeList.get(0).getInt("FEE_SET");
            afterSchoolFee = feeList.get(0).getInt("FEE_EXC");
            return JsonResponse.asSuccess("allDay" , allDay,"afterSchool" ,afterSchool, "allDayFee", allDayFee, "afterSchoolFee", afterSchoolFee);
        } else {
             allDayFee = feeList.get(0).getInt("FEE_SET");
             afterSchoolFee = 0;
             allDay = setB.size();
            return JsonResponse.asSuccess("allDay" , allDay,"allDayFee", allDayFee, "afterSchoolFee", afterSchoolFee);
        }

    }

    public static List<LocalDate> getDatesBetweenTwoDates(LocalDate startDate, LocalDate endDate) {
        int numOfDaysBetween = (int) ChronoUnit.DAYS.between(startDate, endDate) + 1;
        return IntStream.iterate(0, i -> i + 1)
                .limit(numOfDaysBetween)
                .mapToObj(i -> startDate.plusDays(i))
                .collect(Collectors.toList());
    }
}