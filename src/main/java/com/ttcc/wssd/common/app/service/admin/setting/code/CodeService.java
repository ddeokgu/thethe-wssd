package com.ttcc.wssd.common.app.service.admin.setting.code;

import com.ttcc.wssd.common.model.Record;

import java.util.List;
import java.util.Map;

public interface CodeService {

    List<Record> getCodeGroupAll();

    List<Record> codeList(Map paramMap);

    int codeCount();

    int codeCheck(Map paramMap);

    int channelCodeDeleteCheck(Map paramMap);

    void codeRegist(Map paramMap);

    void codeDelete(Map paramMap);

    void codeUpdate(Map paramMap);

    void codeUseYn(Map paramMap);

}
