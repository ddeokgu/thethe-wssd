package com.ttcc.wssd.common.app.controller.admin.setting.school;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.setting.school.SchoolService;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class SchoolController extends CommonController {

    @Autowired
    SchoolService schoolService;

    @RequestMapping("/setting/school.do")
    public String schoolList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", schoolService.schoolCount(paramMap));
        model.addAttribute("pageInfo", paramMap);
        model.addAttribute("list", schoolService.schoolList(paramMap));
        return "main-admin:/setting/school";
    }

    @ResponseBody
    @RequestMapping("/setting/schoolOneList.do")
    public Map schoolOneList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        Util.setPageInfo(paramMap);
        List<Record> list = schoolService.schoolList(paramMap);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/setting/schoolRegist.do")
    public Map schoolRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        schoolService.schoolRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/schoolDelete.do")
    public Map schoolDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID", user.getId());
        schoolService.schoolDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/schoolVacationList.do")
    public Map schoolVacationList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        return JsonResponse.asSuccess("list" , schoolService.schoolVacationList(paramMap));
    }

    @ResponseBody
    @RequestMapping("/setting/schoolVacationInsert.do")
    public Map schoolVacationInsert(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        schoolService.schoolVacationInsert(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/schoolVacationDelete.do")
    public Map schoolVacationDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        schoolService.schoolVacationDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/schoolUpdate.do")
    public Map schoolUpdate(Model model,@RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        schoolService.schoolUpdate(paramMap);
        return JsonResponse.asSuccess();
    }
}
