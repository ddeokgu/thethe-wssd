package com.ttcc.wssd.common.app.mapper.admin.member;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AdminUserMemberMapper {

     List<Record> adminUserMemberList(Map paramMap);

     int adminUserMemberCount(Map paramMap);

     int adminUserMemberDeleteCheck(Map paramMap);

     void adminUserMemberDelete(Map paramMap);

}