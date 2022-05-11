package com.ttcc.wssd.main.app.mapper.admin.supervisor;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ManagerMapper {

    public void Manager_List_i1_Str(Map paramMap);

    public List<Map<String, String>> Manager_List_S1_Str(Map paramMap);

    public void Manager_List_U1_Str(Map paramMap);
    
    public void Manager_List_U2_Str(Map paramMap);
    
    public void Manager_List_D1_Str(Map paramMap);
}
