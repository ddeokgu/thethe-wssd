package com.ttcc.wssd.main.app.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/master")
@Controller
public class MainAdminHomeController {
/*
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
        model.addAttribute("caddytalkList", mainHomeService.getCaddytalkMain(null));
        return "main-admin:/main";
    }*/
/*
    @GetMapping("/{depth1}")
    public String testPages(@PathVariable("depth1") String depth1) {
        log.info("depth1 : {}", depth1);
        return "main-admin:/" + depth1;
    }

    @GetMapping("/{depth1}/{depth2}")
    public String testPages2(@PathVariable("depth1") String depth1,
                             @PathVariable("depth2") String depth2) {
        log.info("depth1 : {}", depth1);
        log.info("depth2 : {}", depth2);
        return "main-admin:/" + depth1 + "/" + depth2;
    }
*/
	
	@GetMapping("/main.do")
    public String testPages() {
         System.err.println("1234");
        return "main-admin:/main";
    }
}
