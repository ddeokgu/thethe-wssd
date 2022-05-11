package com.ttcc.wssd.common.app.service.admin.member;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface AdminUserMemberService {

     List<Record> adminUserMemberList(Map paramMap);

     int adminUserMemberCount(Map paramMap);

     int adminUserMemberDeleteCheck(Map paramMap);

     void adminUserMemberDelete(Map paramMap);

}