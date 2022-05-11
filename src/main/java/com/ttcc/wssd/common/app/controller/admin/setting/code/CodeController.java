
package com.ttcc.wssd.common.app.controller.admin.setting.code;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.setting.code.CodeService;
import com.ttcc.wssd.common.model.JsonResponse;
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

import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class CodeController extends CommonController {

    @Autowired
    CodeService codeService;

    @RequestMapping("/setting/code.do")
    public String codeList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", codeService.codeCount());
        model.addAttribute("codeGroupList",codeService.getCodeGroupAll());
        model.addAttribute("list", codeService.codeList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        System.err.println("paramMap = " + paramMap);
        return "main-admin:/setting/code";
    }

    @ResponseBody
    @RequestMapping("/setting/codeCheck.do")
    public Map codeCheck(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        codeService.codeCheck(paramMap);
        if( codeService.codeCheck(paramMap) != 0) {
            return JsonResponse.asFailure();
        } else {
            return JsonResponse.asSuccess();
        }
    }

    @ResponseBody
    @RequestMapping("/setting/codeRegist.do")
    public Map codeRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        codeService.codeRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/channelCodeDeleteCheck.do")
    public Map codeDeleteCheck(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        int result = codeService.channelCodeDeleteCheck(paramMap);
        return JsonResponse.asSuccess("result", result);
    }

    @ResponseBody
    @RequestMapping("/setting/codeDelete.do")
    public Map codeDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID", user.getId());
        codeService.codeDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/codeUpdate.do")
    public Map codeUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("UPDATE_ID", user.getId());
        codeService.codeUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/codeUseYn.do")
    public Map codeUseYn(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        codeService.codeUseYn(paramMap);
        return JsonResponse.asSuccess();
    }
}