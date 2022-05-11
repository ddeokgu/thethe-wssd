package com.ttcc.wssd.common.app.service.admin.setting.room.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.room.RoomMapper;
import com.ttcc.wssd.common.app.service.admin.setting.room.RoomService;
import com.ttcc.wssd.common.model.Record;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
public class RoomServiceImpl implements RoomService {

    @Autowired
    RoomMapper roomMapper;

    @Override
    public List<Record> roomList(Map paramMap) {
        return roomMapper.roomList(paramMap);
    }

    @Override
    public String roomRegist(Map paramMap) {
        return roomMapper.roomRegist(paramMap);
    }

    @Override
    public void roomDelete(Map paramMap) {
        roomMapper.roomDelete(paramMap);
    }

    @Override
    public void roomUseYn(Map paramMap) {
        roomMapper.roomUseYn(paramMap);
    }

    @Override
    public void roomUpdate(Map paramMap) {
        roomMapper.roomUpdate(paramMap);
    }

    @Override
    public int roomCount() {
        return roomMapper.roomCount();
    }
}
