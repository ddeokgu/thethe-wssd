package com.ttcc.wssd.common.app.service.admin.setting.school.Impl;

import com.ttcc.wssd.common.app.mapper.admin.setting.school.SchoolMapper;
import com.ttcc.wssd.common.app.service.admin.setting.school.SchoolService;
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
public class SchoolServiceImpl implements SchoolService {

    @Autowired
    SchoolMapper schoolMapper;


    @Override
    public int schoolCount(Map paramMap) {
        return schoolMapper.schoolCount(paramMap);
    }

    @Override
    public List<Record> schoolList(Map paramMap) {
        return schoolMapper.schoolList(paramMap);
    }

    @Override
    public List<Record> schoolVacationList(Map paramMap) {
        return schoolMapper.schoolVacationList(paramMap);
    }

    @Override
    public void schoolRegist(Map paramMap) {
        schoolMapper.schoolRegist(paramMap);
    }

    @Override
    public void schoolDelete(Map paramMap) {
        schoolMapper.schoolDelete(paramMap);
    }

    @Override
    public void schoolVacationInsert(Map paramMap) {
        schoolMapper.schoolVacationInsert(paramMap);
    }

    @Override
    public void schoolVacationDelete(Map paramMap) {
        schoolMapper.schoolVacationDelete(paramMap);
    }

    @Override
    public void schoolUpdate(Map paramMap) {
        schoolMapper.schoolUpdate(paramMap);
    }
}
