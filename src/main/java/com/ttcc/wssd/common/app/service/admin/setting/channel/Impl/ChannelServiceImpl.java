package com.ttcc.wssd.common.app.service.admin.setting.channel.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.channel.ChannelMapper;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
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
public class ChannelServiceImpl implements ChannelService {

    @Autowired
    ChannelMapper channelMapper;

    @Override
    public List<Record> channelCodeList() {
        return channelMapper.channelCodeList();
    }

    @Override
    public List<Record> channelList(Map paramMap) {
        return channelMapper.channelList(paramMap);
    }

    @Override
    public int channelCount(Map paramMap) {
        return channelMapper.channelCount(paramMap);
    }

    @Override
    public void channelRegist(Map paramMap) {
        channelMapper.channelRegist(paramMap);
    }

    @Override
    public void channelDelete(Map paramMap) {
        channelMapper.channelDelete(paramMap);
    }

    @Override
    public void channelUpdate(Map paramMap) {
        channelMapper.channelUpdate(paramMap);
    }

    @Override
    public void channelUseYn(Map paramMap) {
        channelMapper.channelUseYn(paramMap);
    }

    @Override
    public int deleteCheck(Map paramMap) {
        return channelMapper.deleteCheck(paramMap);
    }
}
