package com.ttcc.wssd.common.app.service.admin.setting.seat;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface SeatService {

    List<Record> seatList(Map paramMap);

    void seatRegist(Map paramMap);

    void seatRegistOne(Map paramMap);

    void seatDelete(Map paramMap);

    void seatDeleteOne(Map paramMap);

    void seatStatusUpdate(Map paramMap);

  /*  List<Record> roomList(Map paramMap);

    void roomUseYn(Map paramMap);

    void roomUpdate(Map paramMap);

    int roomCount();
*/
}
