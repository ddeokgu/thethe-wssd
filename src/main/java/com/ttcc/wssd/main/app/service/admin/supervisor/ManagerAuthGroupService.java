package com.ttcc.wssd.main.app.service.admin.supervisor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttcc.wssd.common.security.authentication.MenuLoaderService;
import com.ttcc.wssd.main.app.mapper.admin.supervisor.ManagerAuthGroupMapper;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ManagerAuthGroupService {

    @Autowired
    private ManagerAuthGroupMapper managerAuthGroupMapper;
    
    @Autowired
    MenuLoaderService menuLoaderService;
    
    public List<Map<String, String>> getManagerAuthGroupList(Map paramMap) {
        return managerAuthGroupMapper.Manager_Auth_Group_S1_Str(paramMap);
    }

    public List<Map<String, String>> getTreeMenuList(Map paramMap) {
        return managerAuthGroupMapper.Manager_Menu_S2_Str(paramMap);
    }

    public List<Map<String, String>> getDetailTreeMenuList(Map paramMap) {
        return managerAuthGroupMapper.Manager_Auth_Group_S2_Str(paramMap);
    }

    public void createAuth(Map paramMap) {
        managerAuthGroupMapper.Manager_Auth_Group_i1_Str(paramMap);
        List<Map<String, String>> menuSeqList = (List<Map<String, String>>) paramMap.get("menuSeqList");
        for(Map menuSeqMap : menuSeqList) {
            paramMap.put("menuSeq", menuSeqMap.get("menuSeq"));
            managerAuthGroupMapper.Manager_Menu_Group_i1_Str(paramMap);
        }
    }

    public void updateAuth(Map paramMap) {
        managerAuthGroupMapper.Manager_Auth_Group_U1_Str(paramMap);
        List<Map<String, String>> menuSeqList = (List<Map<String, String>>) paramMap.get("menuSeqList");
        for(Map menuSeqMap : menuSeqList) {
            paramMap.put("menuSeq", menuSeqMap.get("menuSeq"));
            managerAuthGroupMapper.Manager_Menu_Group_U1_Str(paramMap);
        }
    }

    public void deleteAuth(Map paramMap) {
        managerAuthGroupMapper.Manager_Auth_Group_D1_Str(paramMap);
    }
    
    public void accessUseYnEdit(Map paramMap) {
        managerAuthGroupMapper.accessUseYnEdit(paramMap);
    }
}
