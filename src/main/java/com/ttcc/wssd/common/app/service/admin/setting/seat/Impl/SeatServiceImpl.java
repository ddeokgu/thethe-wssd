package com.ttcc.wssd.common.app.service.admin.setting.seat.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.seat.SeatMapper;
import com.ttcc.wssd.common.app.service.admin.setting.seat.SeatService;
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
public class SeatServiceImpl implements SeatService {

    @Autowired
    SeatMapper seatMapper;

    @Override
    public List<Record> seatList(Map paramMap) {
        return seatMapper.seatList(paramMap);
    }


    @Override
    public void seatRegist(Map paramMap) {
         seatMapper.seatRegist(paramMap);
    }

    @Override
    public void seatRegistOne(Map paramMap) {
        seatMapper.seatRegistOne(paramMap);
    }

    @Override
    public void seatDelete(Map paramMap) {
        seatMapper.seatDelete(paramMap);
    }

    @Override
    public void seatDeleteOne(Map paramMap) {
        seatMapper.seatDeleteOne(paramMap);
    }

    @Override
    public void seatStatusUpdate(Map paramMap) {
        seatMapper.seatStatusUpdate(paramMap);
    }




 /*   @Override
    public List<Record> roomList(Map paramMap) {
        return roomMapper.roomList(paramMap);
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
    }*/
}
