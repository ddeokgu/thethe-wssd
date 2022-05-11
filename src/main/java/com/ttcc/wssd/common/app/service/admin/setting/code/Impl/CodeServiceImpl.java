package com.ttcc.wssd.common.app.service.admin.setting.code.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.code.CodeMapper;
import com.ttcc.wssd.common.app.service.admin.setting.code.CodeService;
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
public class CodeServiceImpl implements CodeService {

    @Autowired
    CodeMapper codeMapper;

    @Override
    public List<Record> getCodeGroupAll() {
        return codeMapper.getCodeGroupAll();
    }

    @Override
    public List<Record> codeList(Map ParamMap) {
        return codeMapper.codeList(ParamMap);
    }

    @Override
    public int codeCount(){return codeMapper.codeCount();}

    @Override
    public int codeCheck(Map paramMap) {
        return codeMapper.codeCheck(paramMap);
    }

    @Override
    public int channelCodeDeleteCheck(Map paramMap) {
        return codeMapper.channelCodeDeleteCheck(paramMap);
    }


    @Override
    public void codeRegist(Map paramMap) {
        codeMapper.codeRegist(paramMap);
    }


    @Override
    public void codeDelete(Map paramMap) {
        codeMapper.codeDelete(paramMap);
    }

    @Override
    public void codeUpdate(Map paramMap) {
        codeMapper.codeUpdate(paramMap);
    }

    @Override
    public void codeUseYn(Map paramMap) {
        codeMapper.codeUseYn(paramMap);
    }

}
