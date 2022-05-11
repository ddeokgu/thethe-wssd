package com.ttcc.wssd.common.app.service.user.setting.regist;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface RegistService {

    List<Record> registList(Map paramMap);

    List<Record> feeList(Map paramMap);

    List<Record> registSeatList(Map paramMap);

    List<Record> registRoomList(Map paramMap);

    String getRegistFirstDate(Map paramMap);

    String roomSiteMapCheck(Map paramMap);

    int registCount(Map paramMap);

    void registInsert(Map paramMap);

    void seatInsert(Map paramMap);

    void attendanceInsert(Map paramMap);

    Map selectRegistOne(Map paramMap);

}
