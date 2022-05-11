
package com.ttcc.wssd.common.app.controller.user.setting.otherRegist;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.user.setting.otherRegist.OtherRegistService;
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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user/setting")
@Controller
public class OtherRegistController extends CommonController {

    @Autowired
    private OtherRegistService otherRegistService;

    @RequestMapping("/otherRegistList.do")
    public String otherRegistList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        paramMap.put("MU_CD", user.getMbCd());
        paramMap.put("TODAY", today);
        int historyCount = otherRegistService.otherRegistHistoryCount(paramMap);
        paramMap.put("totalCount", otherRegistService.otherRegistCount(paramMap));
        paramMap.put("historyCount", historyCount);
        paramMap.put("totalHistoryCount", historyCount + otherRegistService.otherRegistHistoryExcCount(paramMap));
        List<Record> list = otherRegistService.otherRegistList(paramMap);
        List<Record> excList = otherRegistService.otherRegistExcList(paramMap);
        List<Record> historyList = otherRegistService.otherRegistHistoryList(paramMap);

        model.addAttribute("list", list);
        model.addAttribute("excList", excList);
        model.addAttribute("historyList", historyList);
        model.addAttribute("pageInfo", paramMap);
        return "main-user:/sub/otherSch";
    }

    @ResponseBody
    @RequestMapping("/otherRegistInsert.do")
    public Map otherRegistInsert(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        paramMap.put("OTHER_REGIST_MU_CD", user.getMbCd());
        otherRegistService.otherRegistInsert(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/otherRegistDelete.do")
    public Map otherRegistDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID", user.getId());
        otherRegistService.otherRegistDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/otherRegistExcList.do")
    public String otherRegistExcList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        List<Record> list = otherRegistService.otherRegistList(paramMap);
        model.addAttribute("excList", list);
        return "main-user:/sub/otherSch";
    }

    @ResponseBody
    @RequestMapping("/otherRegistExcInsert.do")
    public Map otherRegistExcInsert(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user, @RequestParam(value = "OTHER_REGIST_EXC_DATE", required = false) String[] date) throws Exception {
        paramMap.put("REG_ID", user.getId());
        paramMap.put("MU_CD", user.getMbCd());
        for (int i = 0; i < date.length; i++) {
            paramMap.put("OTHER_REGIST_EXC_DATE", date[i]);
            otherRegistService.otherRegistExcInsert(paramMap);
        }
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/otherRegistExcDelete.do")
    public Map otherRegistExcDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID", user.getId());
        otherRegistService.otherRegistExcDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    public static Map getAttendanceMap(@RequestParam Map paramMap) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        sdf.parse(paramMap.get("OTHER_REGIST_COME").toString());
        String type = paramMap.get("OTHER_REGIST_TYPE").toString();
        String[] date = {"08:00", "09:10", "10:10", "11:10", "12:00", "12:50", "14:00", "15:00", "16:00", "17:00", "17:45", "18:30", "19:30", "20:30", "21:30", "22:30", "23:25"};
        Map map = new HashMap();
        System.err.println("length = = = " + date.length);
        if (paramMap.get("OTHER_REGIST_DEPART").toString().equals("B")) {
            if (paramMap.get("OTHER_REGIST_ARRIVE").toString().equals("B")) {
                map.put("C1", paramMap.get("OTHER_REGIST_SUB").toString());
                map.put("C2", "미등원");
                for (int i = 3; i < 16; i++) {
                    map.put("C" + i, "-");
                }
            }
            if (paramMap.get("OTHER_REGIST_ARRIVE").toString().equals("A")) {
                map.put("C1", paramMap.get("OTHER_REGIST_SUB").toString());
                long time = sdf.parse(paramMap.get("OTHER_REGIST_COME").toString()).getTime();
                for (int i = 2; i < date.length - 1; i++) {
                    long start = sdf.parse(date[i]).getTime();
                    long end = sdf.parse(date[i + 1]).getTime();
                    if (time > start && time > end) {
                        map.put("C" + i, "-");
                    }
                    if (time > start && time <= end) {
                        map.put("C" + i, paramMap.get("OTHER_REGIST_COME").toString());
                    }
                }
            }
        }

        if (paramMap.get("OTHER_REGIST_DEPART").toString().equals("A")) {
            if (paramMap.get("OTHER_REGIST_ARRIVE").toString().equals("B")) {
                long time = sdf.parse(paramMap.get("OTHER_REGIST_OUT").toString()).getTime();
                for (int i = 0; i < date.length - 1; i++) {
                    long start = sdf.parse(date[i]).getTime();
                    long end = sdf.parse(date[i + 1]).getTime();
                    if (time > start && time <= end) {
                        map.put("C" + i, paramMap.get("OTHER_REGIST_SUB").toString());
                    }
                    if (time > start && time <= end) {
                        map.put("C" + i, paramMap.get("OTHER_REGIST_COME").toString());
                    }
                }
                if (paramMap.get("OTHER_REGIST_ARRIVE").toString().equals("A")) {
                    map.put("C1", paramMap.get("OTHER_REGIST_SUB").toString());
                    for (int i = 2; i < date.length - 1; i++) {
                        long start = sdf.parse(date[i]).getTime();
                        long end = sdf.parse(date[i + 1]).getTime();
                        if (time > start && time > end) {
                            map.put("C" + i, "-");
                        }
                        if (time > start && time <= end) {
                            map.put("C" + i, paramMap.get("OTHER_REGIST_COME").toString());
                        }
                    }
                }
            }

        }
        return map;
    }
}