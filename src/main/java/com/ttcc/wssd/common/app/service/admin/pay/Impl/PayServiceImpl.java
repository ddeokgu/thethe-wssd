package com.ttcc.wssd.common.app.service.admin.pay.Impl;

import com.ttcc.wssd.common.app.mapper.admin.pay.PayMapper;
import com.ttcc.wssd.common.app.service.admin.pay.PayService;
import com.ttcc.wssd.common.model.Record;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
public class PayServiceImpl implements PayService {

    @Autowired
    private PayMapper payMapper;

    @Override
    public int payCount(Map paramMap) {
        return payMapper.payCount(paramMap);
    }

    @Override
    public List<Record> payList(Map paramMap) {
        return payMapper.payList(paramMap);
    }

    @Override
    public Map payOneInfo(Map paramMap) {
        return payMapper.payOneInfo(paramMap);
    }

    public Map<String, Object> Order_Temp_Process(Map paramMap, Map defaultMap) throws UnsupportedEncodingException {

        String payCode = payMapper.getPayCoode(paramMap);

        Map <String, Object> resultMap = new HashMap<>();

        resultMap.put("PayMethod", paramMap.get("PAY_METHOD"));
        resultMap.put("MID", defaultMap.get("PG_MID"));
        resultMap.put("Moid", payCode);
        resultMap.put("MerchantKey", defaultMap.get("PG_KEY"));
        resultMap.put("GoodsName", paramMap.get("PAY_TYPE"));
        resultMap.put("Amt", paramMap.get("PAY_PRICE"));
        resultMap.put("BuyerName", paramMap.get("REGIST_MU_NAME"));
        resultMap.put("BuyerEmail", paramMap.get("MU_EMAIL"));
        resultMap.put("ResultYN", 'N');
        resultMap.put("MU_CD", paramMap.get("MU_CD"));
        resultMap.put("MU_ID", paramMap.get("MU_ID"));
        resultMap.put("BuyerTel", paramMap.get("MU_PHONE"));

        return resultMap;
    }

    @Override
    public void payInsert(Map paramMap) {
        payMapper.payInsert(paramMap);
    }

    @Override
    public void payCancelInsert(Map paramMap) {
        payMapper.payCancelInsert(paramMap);
    }

    @Override
    public void payCancelErrInsert(Map paramMap) {
        payMapper.payCancelErrInsert(paramMap);
    }

    @Override
    public void payCancelUpdate(Map paramMap) {
        payMapper.payCancelUpdate(paramMap);
    }

}
