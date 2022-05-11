package com.ttcc.wssd.common.app.service.admin.setting.channel;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface ChannelService {

  List<Record> channelCodeList();

  List<Record> channelList(Map paramMap);

  int channelCount(Map paramMap);

  void channelRegist(Map paramMap);

  void channelDelete(Map paramMap);

  void channelUpdate(Map paramMap);

  void channelUseYn(Map paramMap);

  int deleteCheck(Map paramMap);

}
