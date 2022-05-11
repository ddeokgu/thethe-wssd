
package com.ttcc.wssd.common.app.controller.admin.setting.fee;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.app.service.admin.setting.fee.FeeService;
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class FeeController extends CommonController {

    @Autowired
    FeeService feeService;

    @Autowired
    ChannelService channelService;

    @RequestMapping("/setting/fee.do")
    public String codeList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", feeService.feeCount(paramMap));
        model.addAttribute("list", feeService.feeList(paramMap));
        Map map = new HashMap();
        map.put("startIndex",0);
        map.put("rowsPerPage", 100);
        model.addAttribute("channelList", channelService.channelList(map));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/setting/fee";
    }

    @ResponseBody
    @RequestMapping("/setting/feeOneList.do")
    public Map feeOneList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("REG_ID", user.getId());
        List<Record> list =  feeService.feeList(paramMap);
        model.addAttribute("list", list);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/setting/feeRegist.do")
    public Map channelRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        feeService.feeRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/feeDelete.do")
    public Map feeDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID" , user.getId());
        feeService.feeDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/feeUpdate.do")
    public Map feeUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("UPDATE_ID", user.getId());
        feeService.feeUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/feeUseYn.do")
    public Map feeUseYn(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        feeService.feeUseYn(paramMap);
        return JsonResponse.asSuccess();
    }

}