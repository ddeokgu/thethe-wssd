package com.ttcc.wssd.common.app.mapper.admin.setting.channel;

import com.ttcc.wssd.common.model.Record;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ChannelMapper {

    List<Record> channelCodeList();

    List<Record> channelList(Map paramMap);

    int channelCount(Map paramMap);

    void channelRegist(Map paramMap);

    void channelDelete(Map paramMap);

    void channelUpdate(Map paramMap);

    void channelUseYn(Map paramMap);

    int deleteCheck(Map paramMap);

}