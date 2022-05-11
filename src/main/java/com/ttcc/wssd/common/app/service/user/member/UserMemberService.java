package com.ttcc.wssd.common.app.service.user.member;

import java.util.Map;

public interface UserMemberService {

     int checkLoginId(Map paramMap);

     int checkPassword(Map paramMap);

     void insertMember(Map paramMap);

     int Chk_Is_Id_Using_S1_Str(Map paramMap);

     void updatePassword(Map paramMap);

     void updateProfile(Map paramMap);

     void userPasswordUpdate(Map paramMap);

     Map<String, Object> getUserProfile(Map paramMap);
}