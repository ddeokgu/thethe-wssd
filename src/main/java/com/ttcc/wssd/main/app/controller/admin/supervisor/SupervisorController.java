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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttcc.wssd.common.app.service.user.member.UserMemberService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerAuthGroupService;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerService;
import com.ttcc.wssd.main.app.service.admin.supervisor.ManagerSetMenuService;


@Controller
@RequestMapping(value="/master/supervisor")
public class SupervisorController {
	
	  @Autowired
	  private ManagerService managerService;

	  @Autowired
	  private ManagerAuthGroupService managerAuthGroupService;

	  @Autowired
	  private UserMemberService memberService;
	  
		@Autowired
		private ManagerSetMenuService managerSetMenuService;

	@RequestMapping(value = "/supervisor")
    public String supervisorPage(Model model, @RequestParam Map paramMap) {
		
		String aa = String.valueOf(paramMap.get("authGroupSeq"));
        Map paramMap2 = new HashMap();
        paramMap2.put("currentPage", 1);
        paramMap2.put("rowsPerPage", 10);
        paramMap2.put("useYn", "Y");
        model.addAttribute("authGroupList", managerAuthGroupService.getManagerAuthGroupList(paramMap2));
        
        if(paramMap.get("currentPage") == "" || paramMap.get("currentPage") == null) {
        	paramMap.put("currentPage", 1);
        }
        if(paramMap.get("rowsPerPage") == "" || paramMap.get("rowsPerPage") == null) {
        	paramMap.put("rowsPerPage", 10);
        }
        
        if(paramMap.get("searchKeyword") == "" || paramMap.get("searchKeyword") == null) {
        	paramMap.put("searchKeyword", "all");
        }
        if(paramMap.get("searchText") == "" || paramMap.get("searchText") == null) {
        	paramMap.put("searchText", "");
        }
        
        if(paramMap.get("authGroupSeq") == "" ) {
        	paramMap.put("authGroupSeq", aa);
        }
                
        List<Map<String, String>> MangerList = managerService.getManagerList(paramMap);
        paramMap.put("totalCount", MangerList.size());
        model.addAttribute("pageInfo", paramMap);
        model.addAttribute("MangerList", MangerList);
        
        Map paramMap1 = new HashMap();
        Map paramMap3 = new HashMap();
			
		paramMap1.put("menuLevel", 1);
		paramMap1.put("menuSeq", "0");
			
		paramMap3.put("menuLevel", 2);
		paramMap3.put("menuSeq", "19");

		 List<Map<String, String>> menuList = managerSetMenuService.getManagerSetMenuList(paramMap1);
		 List<Map<String, String>> menuList2 = managerSetMenuService.getManagerSetMenuList(paramMap3);
			
			for (int i = 0; i < menuList2.size(); i++) {
				if("/master/supervisor/supervisor".equals(menuList2.get(i).get("programUrl"))) {
					model.addAttribute("manage", menuList2.get(i));
					for (int j = 0; j < menuList.size(); j++) {
						if(String.valueOf(menuList.get(j).get("menuSeq")).equals(String.valueOf(menuList2.get(i).get("parentMenuSeq")))) {
							model.addAttribute("manageParent", menuList.get(j));
						}
					}
				}
			}
        
        return "main-admin:/supervisor/supervisor";
    }
	
	@PostMapping(value = "/getManagerList.json")
    @ResponseBody
    public Map getManagerList(@RequestBody Map paramMap) {
        
		paramMap.put("currentPage", 1);
	    paramMap.put("rowsPerPage", 10);
		List<Map<String, String>> ManagerList = managerService.getManagerList(paramMap);
		
		System.err.println("managerList : " + ManagerList);
		
		
		return JsonResponse.asSuccess("storeData", managerService.getManagerList(paramMap));
    }
	
	@PostMapping(value = "/createManager.json")
    @ResponseBody
    public Map createManager(@RequestBody Map paramMap) {
        paramMap.put("mb_id", paramMap.get("managerId"));
        
        UserInfo user = Util.getUserInfo();
        paramMap.put("loginUserSeq", user.getManagerSeq());

        int result = memberService.Chk_Is_Id_Using_S1_Str(paramMap);

        if(result > 0){
            return JsonResponse.asFailure("중복 아이디입니다.");
        }

        managerService.createManager(paramMap);
        return JsonResponse.asSuccess();
    }
	
	@PostMapping(value = "/updateManager.json")
    @ResponseBody
    public Map updateManager(@RequestBody Map paramMap) {
		System.out.println("파람 :: " + paramMap);
		
		 UserInfo user = Util.getUserInfo();
		 
        //paramMap.put("mbCode", paramMap.get("mbCd")+"");
        //paramMap.put("mbCode", );
        paramMap.put("loginUserSeq", user.getManagerSeq());
        
        System.out.println("파람2 :: " + paramMap);
        
        managerService.updateManager(paramMap);
        return JsonResponse.asSuccess();
    }
	
	
	@PostMapping(value = "/deleteManager.json")
    @ResponseBody
    public Map deleteManager(@RequestBody Map paramMap) {
		System.out.println("파람 :: " + paramMap);
        //paramMap.put("mbCode", paramMap.get("mb_cd")+"");
		UserInfo user = Util.getUserInfo();
		 paramMap.put("loginUserSeq", user.getManagerSeq());
        
        System.out.println("파람2 :: " + paramMap);
        
        managerService.deleteManager(paramMap);
        return JsonResponse.asSuccess();
    }
	
	
	
	@PostMapping(value = "/useYnEdit.json")
    @ResponseBody
    public Map useYnEdit(@RequestBody Map paramMap) {
		System.out.println("파람 :: " + paramMap);
        //paramMap.put("mbCode", paramMap.get("mb_cd")+"");
		UserInfo user = Util.getUserInfo();
		 paramMap.put("loginUserSeq", user.getManagerSeq());
        
        System.out.println("파람2 :: " + paramMap);
        
        managerService.useYnEdit(paramMap);
        return JsonResponse.asSuccess();
    }
	
	
}
