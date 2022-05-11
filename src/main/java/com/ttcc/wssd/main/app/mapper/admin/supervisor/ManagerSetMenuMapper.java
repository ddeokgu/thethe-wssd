package com.ttcc.wssd.main.app.mapper.admin.supervisor;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ManagerSetMenuMapper {
	
	 public List<Map<String, String>> Manager_Menu_S1_Str(Map paramMap);

	    public void Manager_Menu_i1_Str(Map paramMap);

	    public void Manager_Menu_U1_Str(Map paramMap);

	    public void Manager_Menu_U2_Str(Map paramMap);

}
