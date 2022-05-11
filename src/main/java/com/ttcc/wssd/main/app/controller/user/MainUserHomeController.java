package com.ttcc.wssd.main.app.controller.user;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.security.UserInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/front")
@Controller
public class MainUserHomeController extends CommonController {

    @RequestMapping("/main/main.do")
    public String main(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
      /*  if(user != null){
            paramMap.put("mbCd", user.getMbCd());
        }
        if (Util.getUserInfo() != null) {
            paramMap.put("mb_cd", Util.getUserInfo().getMbCd());
            paramMap.put("mbr_grp_cd", Util.getUserInfo().getMbrGrpCd());
        }
        Util.setPageInfo(paramMap);
        paramMap.put("banner_type", "M");
        Map<String, Object> resultMap = mainHomeService.Main_Page(paramMap);
        model.addAttribute("resultMap", resultMap);
        paramMap.put("caddy_type", "H");
        model.addAttribute("houseRecruit", mainHomeService.getMainRecruit(paramMap));
        paramMap.put("caddy_type", "F");
        model.addAttribute("freeRecruit", mainHomeService.getMainRecruit(paramMap));
        model.addAttribute("recruitLocation", mainHomeService.getMainRecruitLocation());
        model.addAttribute("caddytalkList", mainHomeService.getCaddytalkMain(null));*/
        return "main-user:/main";
    }


    @GetMapping("/{depth1}")
    public String testPages(@PathVariable("depth1") String depth1) {

        log.info("depth1 : {}", depth1);
        return "main-user:/" + depth1;
    }

    @GetMapping("/{depth1}/{depth2}")
    public String testPages2(@PathVariable("depth1") String depth1,
                             @PathVariable("depth2") String depth2) {
        log.info("depth1 : {}", depth1);
        log.info("depth2 : {}", depth2);
        return "main-user:/" + depth1 + "/" + depth2;
    }

}
