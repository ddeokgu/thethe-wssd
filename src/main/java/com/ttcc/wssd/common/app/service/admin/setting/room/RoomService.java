package com.ttcc.wssd.common.app.service.admin.setting.room;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface RoomService {

    List<Record> roomList(Map paramMap);

    String roomRegist(Map paramMap);

    void roomDelete(Map paramMap);

    void roomUseYn(Map paramMap);

    void roomUpdate(Map paramMap);

    int roomCount();

}
