package com.ttcc.wssd.common.app.mapper;

import com.ttcc.wssd.common.security.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface LoginMapper {

    UserInfo selectMemberInfo(@Param("memberId") String memberId);

    UserInfo selectSocialMemberInfo(@Param("platform") String platform, @Param("socialId") String socialId);

    UserInfo selectMasterInfo(@Param("memberId") String memberId, @Param("memberPass") String memberPass );

    String memberInfo(@Param("mbCd") String mbCode, @Param("mbType") String mbType );

    UserInfo masterInfo(@Param("mbCd") String mbCode);

    void uptMbrAcsRec(String mb_code);

    Integer uptMngAcsRec(@Param("mbCd") String mbCode);

    List Manager_Menu_S4_Str(int authGroupSeq);

    Map<String, Object> Member_Info_From_Order_S1_Str(Map paramMap);


    void insertSocialLoginState(Map paramMap);

    Map getSocialLoginState(@Param("platform") String platform, @Param("state") String state);

    void checkSocialLoginState(@Param("platform") String platform, @Param("state") String state);

    void updateSocialTokenInfo(Map paramMap);

    UserInfo selectMemberInfoByMbCd(String mbCd);

    @Update("update member_user_master set mb_login_last = getdate() where mb_cd = #{mbCd}")
    void updateLoginDate(String mbCd);
}