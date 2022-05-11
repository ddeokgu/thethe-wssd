package com.ttcc.wssd.main.app.service.admin.supervisor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttcc.wssd.main.app.mapper.admin.supervisor.ManagerMapper;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ManagerService {

    @Autowired
    private ManagerMapper managerMapper;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    public void createManager(Map paramMap) {
        paramMap.replace("password", passwordEncoder.encode((String)paramMap.get("password")));
        managerMapper.Manager_List_i1_Str(paramMap);
        System.err.println("paramMap = = = " + paramMap);
    }

    public List<Map<String, String>> getManagerList(Map paramMap) {
        return managerMapper.Manager_List_S1_Str(paramMap);
    }

    public void updateManager(Map paramMap) {
        //paramMap.replace("password", passwordEncoder.encode((String)paramMap.get("newPassword")));
        paramMap.replace("password", passwordEncoder.encode((String)paramMap.get("password")));
        managerMapper.Manager_List_U1_Str(paramMap);
    }
    
    public void deleteManager(Map paramMap) {
        managerMapper.Manager_List_D1_Str(paramMap);
    }
    
    public void useYnEdit(Map paramMap) {
    	managerMapper.Manager_List_U2_Str(paramMap);
    }
    
}
