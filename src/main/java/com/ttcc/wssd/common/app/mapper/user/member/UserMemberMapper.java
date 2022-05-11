package com.ttcc.wssd.common.app.mapper.user.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface UserMemberMapper {

     int checkLoginId(Map paramMap);
   
     int checkPassword(Map paramMap);

     void insertMember(Map paramMap);
   
     void updatePassword(Map paramMap);

     void updateProfile(Map paramMap);

     void userPasswordUpdate(Map paramMap);
    
     int Chk_Is_Id_Using_S1_Str(Map paramMap);

     Map<String, Object> getUserProfile(Map paramMap);

}