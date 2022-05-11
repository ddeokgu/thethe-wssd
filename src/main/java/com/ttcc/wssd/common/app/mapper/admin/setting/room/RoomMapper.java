package com.ttcc.wssd.common.app.mapper.admin.setting.room;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface RoomMapper {

    List<Record> roomList(Map paramMap);

    int roomCount();

    String roomRegist(Map paramMap);

    void roomDelete(Map paramMap);

    void roomUseYn(Map paramMap);

    void roomUpdate(Map paramMap);

}