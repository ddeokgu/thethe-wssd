package com.ttcc.wssd.common.app.mapper.admin.setting.seat;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SeatMapper {

    List<Record> seatList(Map paramMap);

    void seatRegist(Map paramMap);

    void seatRegistOne(Map paramMap);

    void seatDelete(Map paramMap);

    void seatDeleteOne(Map paramMap);

    void seatStatusUpdate(Map paramMap);



   /* List<Record> roomList(Map paramMap);

    int roomCount();

    void roomUseYn(Map paramMap);

    void roomUpdate(Map paramMap);*/

}