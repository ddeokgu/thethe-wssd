
package com.ttcc.wssd.common.app.controller.admin.setting.channel;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
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
public class ChannelController extends CommonController {

    @Autowired
    ChannelService channelService;

    @RequestMapping("/setting/channel.do")
    public String chnnelList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("totalCount", channelService.channelCount(paramMap));
        model.addAttribute("list", channelService.channelList(paramMap));
        model.addAttribute("pageInfo", paramMap);
        return "main-admin:/setting/channel";
    }

    @ResponseBody
    @RequestMapping("/setting/channelOneList.do")
    public Map channelOneList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        paramMap.put("REG_ID", user.getId());
        List<Record> list = channelService.channelList(paramMap);
        model.addAttribute("list", list);
        return JsonResponse.asSuccess("result", list);
    }

    @ResponseBody
    @RequestMapping("/setting/channelRegist.do")
    public Map channelRegist(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("REG_ID", user.getId());
        channelService.channelRegist(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/channelDelete.do")
    public Map codeDelete(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("DLT_ID", user.getId());
        channelService.channelDelete(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/channelUpdate.do")
    public Map channelUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        paramMap.put("UPDATE_ID", user.getId());
        channelService.channelUpdate(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/channelUseYn.do")
    public Map channelUseYn(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        channelService.channelUseYn(paramMap);
        return JsonResponse.asSuccess();
    }

    @ResponseBody
    @RequestMapping("/setting/deleteCheck.do")
    public Map deleteCheck(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        int check = 0;
        System.err.println("paramMap = = = " + paramMap);
        if(paramMap.get("gubun") != null) {
            check = channelService.deleteCheck(paramMap);
            System.err.println("check = = = " + check);
        }
        return JsonResponse.asSuccess("result", check);
    }

}