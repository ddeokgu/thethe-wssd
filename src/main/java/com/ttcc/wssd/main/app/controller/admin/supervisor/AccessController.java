package com.ttcc.wssd.main.app.controller.admin.supervisor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerAuthGroupService;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerSetMenuService;


@Controller
@RequestMapping(value="/master/supervisor")
public class AccessController {
	
	@Autowired
    private ManagerAuthGroupService managerAuthGroupService;
	
	@Autowired
	private ManagerSetMenuService managerSetMenuService;
	
	 @GetMapping(value="/access")
	    public String accessPage(@RequestParam Map paramMap, Model model) { 
		 
         UserInfo user = Util.getUserInfo();
		 
		 paramMap.put("managerSeq", user.getManagerSeq());
		 paramMap.put("managerId", user.getId());
		 paramMap.put("managerName", user.getName());
		 paramMap.put("authGroupSeq", user.getAuthGroupSeq());
		 
			if (paramMap.get("currentPage") == "" || paramMap.get("currentPage") == null) {
				paramMap.put("currentPage", 1);
			}
			if (paramMap.get("rowsPerPage") == "" || paramMap.get("rowsPerPage") == null) {
				paramMap.put("rowsPerPage", 10);
			}

			if (paramMap.get("authGroupName") == "" || paramMap.get("authGroupName") == null) {
				paramMap.put("authGroupName", "");
			}
		 
		 List<Map<String, String>> list = managerAuthGroupService.getManagerAuthGroupList(paramMap);
		 Map paramMap1 = new HashMap();
         Map paramMap2 = new HashMap();
			
		 paramMap1.put("menuLevel", 1);
		 paramMap1.put("menuSeq", "0");

		 paramMap2.put("menuLevel", 2);
		 paramMap2.put("menuSeq", "19");

		 List<Map<String, String>> menuList = managerSetMenuService.getManagerSetMenuList(paramMap1);
		 List<Map<String, String>> menuList2 = managerSetMenuService.getManagerSetMenuList(paramMap2);
			for (int i = 0; i < menuList2.size(); i++) {
				if("/master/supervisor/access".equals(menuList2.get(i).get("programUrl"))) {
					model.addAttribute("manage", menuList2.get(i));
					for (int j = 0; j < menuList.size(); j++) {
						if(String.valueOf(menuList.get(j).get("menuSeq")).equals(String.valueOf(menuList2.get(i).get("parentMenuSeq")))) {
							model.addAttribute("manageParent", menuList.get(j));
						}
					}
				}
			}
	
		 model.addAttribute("list", list);
		 
		 paramMap.put("totalCount", list.size());
		 model.addAttribute("pageInfo", paramMap);
		 return "main-admin:/supervisor/access"; 
	 }
	 
	 @PostMapping(value = "/getDetailTreeMenu.json")
	 @ResponseBody
	    public Map getDetailTreeMenuList(@RequestBody Map paramMap) {
	        return JsonResponse.asSuccess("data", managerAuthGroupService.getDetailTreeMenuList(paramMap));
	    }
	 
	 
	 @PostMapping(value = "/getTreeMenu.json")
	 @ResponseBody
	    public Map getTreeMenuList(@RequestBody Map paramMap) {
		 
		 UserInfo user = Util.getUserInfo();
		 
		 paramMap.put("managerSeq", user.getManagerSeq());
		 paramMap.put("managerId", user.getId());
		 paramMap.put("managerName", user.getName());
		 paramMap.put("authGroupSeq", user.getAuthGroupSeq());
		 paramMap.put("rowsPerPage", 10);
		 paramMap.put("currentPage", 1);
		 
		 //System.err.println("list :  " + managerAuthGroupService.getTreeMenuList(paramMap));
		 //System.err.println("list22 :  " + managerAuthGroupService.getManagerAuthGroupList(paramMap));
		 
		
		 
	        return JsonResponse.asSuccess("data", managerAuthGroupService.getTreeMenuList(paramMap));
	    }
	 
		@PostMapping(value = "/createAuth.json")
		@ResponseBody
		public Map createAuth(@RequestBody Map paramMap) {
			UserInfo user = Util.getUserInfo();
			paramMap.put("loginUserSeq", user.getManagerSeq());
			managerAuthGroupService.createAuth(paramMap);
			return JsonResponse.asSuccess();
		}

		@PostMapping(value = "/updateAuth.json")
		@ResponseBody
		public Map updateAuth(@RequestBody Map paramMap) {
			UserInfo user = Util.getUserInfo();
			paramMap.put("loginUserSeq", user.getManagerSeq());
			managerAuthGroupService.updateAuth(paramMap);
			return JsonResponse.asSuccess();
		}

		@PostMapping(value = "/deleteAuth.json")
		@ResponseBody
		public Map deleteAuth(@RequestBody Map paramMap) {
			UserInfo user = Util.getUserInfo();
			paramMap.put("loginUserSeq", user.getManagerSeq());
			managerAuthGroupService.deleteAuth(paramMap);
			return JsonResponse.asSuccess();
		}
		
		@PostMapping(value = "/accessUseYnEdit.json")
		@ResponseBody
		public Map accessUseYnEdit(@RequestBody Map paramMap) {
			UserInfo user = Util.getUserInfo();
			paramMap.put("loginUserSeq", user.getManagerSeq());
			managerAuthGroupService.accessUseYnEdit(paramMap);
			return JsonResponse.asSuccess();
		}
		
		

}
