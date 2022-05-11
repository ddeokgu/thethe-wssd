
package com.ttcc.wssd.common.app.controller.admin.setting.test;

import com.ttcc.wssd.common.app.controller.CommonController;
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
public class TestController extends CommonController {

    @Autowired
    TestService testService;


    @RequestMapping("/setting/test.do")
    public String codeList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", testService.testCount(paramMap));
        model.addAttribute("list", testService.testList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/setting/test";
    }

    @ResponseBody
    @RequestMapping("/setting/testOneList.do")
    public Map testOneList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("REG_ID", user.getId());
        List<Record> list = testService.testList(paramMap);
        model.addAttribute("list",list);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/setting/testRegist.do")
    public Map testRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        testService.testRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/testDelete.do")
    public Map testDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID" , user.getId());
        testService.testDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/testUpdate.do")
    public Map testUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("UPDATE_ID", user.getId());
        testService.testUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/testUseYn.do")
    public Map testUseYn(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        testService.testUseYn(paramMap);
        return JsonResponse.asSuccess();
    }

}