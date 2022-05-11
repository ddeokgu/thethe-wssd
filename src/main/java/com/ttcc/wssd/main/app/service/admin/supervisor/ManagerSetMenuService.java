package com.ttcc.wssd.main.app.service.admin.supervisor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttcc.wssd.main.app.mapper.admin.supervisor.ManagerSetMenuMapper;

@Service
@Transactional
public class ManagerSetMenuService {
	
	@Autowired
    private ManagerSetMenuMapper managerSetMenuMapper;

    public List<Map<String, String>> getManagerSetMenuList(Map paramMap) {
        return managerSetMenuMapper.Manager_Menu_S1_Str(paramMap);
    }

    public void createMenu(Map paramMap) {
        managerSetMenuMapper.Manager_Menu_i1_Str(paramMap);
    }

    public void updateMenu(Map paramMap) {
        managerSetMenuMapper.Manager_Menu_U1_Str(paramMap);
    }

    public void updateOrder(List<Map> paramList) {
    	 for(Map paramMap : paramList) {
    		 paramMap.put("loginUserSeq", 0);
             managerSetMenuMapper.Manager_Menu_U2_Str(paramMap);
         }
    }

}
