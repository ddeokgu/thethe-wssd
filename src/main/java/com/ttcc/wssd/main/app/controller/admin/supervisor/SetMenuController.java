package com.ttcc.wssd.main.app.controller.admin.supervisor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerSetMenuService;


@Controller
@RequestMapping(value="/master/supervisor")
public class SetMenuController {
	
	@Autowired
	private ManagerSetMenuService managerSetMenuService;

	@RequestMapping(value = "/setMenu")
	public String setMenuPage(ModelAndView mav, Model model) {
		Map paramMap = new HashMap();
		Map paramMap2 = new HashMap();
		
		paramMap.put("menuLevel", 1);
		paramMap.put("menuSeq", "0");
		
		paramMap2.put("menuLevel", 2);
		paramMap2.put("menuSeq", "19");

		List<Map<String, String>> menuList = managerSetMenuService.getManagerSetMenuList(paramMap);
		List<Map<String, String>> menuList2 = managerSetMenuService.getManagerSetMenuList(paramMap2);
		
		for (int i = 0; i < menuList2.size(); i++) {
			if("/master/supervisor/setMenu".equals(menuList2.get(i).get("programUrl"))) {
				model.addAttribute("manage", menuList2.get(i));
				for (int j = 0; j < menuList.size(); j++) {
					if(String.valueOf(menuList.get(j).get("menuSeq")).equals(String.valueOf(menuList2.get(i).get("parentMenuSeq")))) {
						model.addAttribute("manageParent", menuList.get(j));
					}
				}
			}
		}
		model.addAttribute("menuList", menuList);
		return "main-admin:/supervisor/setMenu";
	}
	
	
	@PostMapping(value = "/getMenuList.json")
    @ResponseBody
    public Map getManagerList(@RequestBody Map paramMap) {
		
		System.err.println("paramMap : " + paramMap);
		
        return JsonResponse.asSuccess("storeData", managerSetMenuService.getManagerSetMenuList(paramMap));
    }

	@PostMapping(value = "/createMenu.json")
	@ResponseBody
	public Map createMenu(@RequestBody Map paramMap) {
		UserInfo user = Util.getUserInfo();
	    paramMap.put("loginUserSeq", user.getManagerSeq());
		managerSetMenuService.createMenu(paramMap);
		return JsonResponse.asSuccess();
	}
	
	@PostMapping(value = "/updateMenu.json")
    @ResponseBody
    public Map updateMenu(@RequestBody Map paramMap) {
		UserInfo user = Util.getUserInfo();
	    paramMap.put("loginUserSeq", user.getManagerSeq());
        managerSetMenuService.updateMenu(paramMap);
        return JsonResponse.asSuccess();
    }
	
	@PostMapping(value = "/updateOrder.json")
	@ResponseBody
	public Map updateOrder(@RequestBody List<Map> paramList) {

		managerSetMenuService.updateOrder(paramList);
		return JsonResponse.asSuccess();
	}
		
		
		

}
