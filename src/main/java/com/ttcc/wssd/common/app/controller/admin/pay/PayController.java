package com.ttcc.wssd.common.app.controller.admin.pay;


import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.pay.PayService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.security.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping(value = "/pay/order")
public class PayController extends CommonController {

    @Autowired
    PayService payService;

    /*PAY_CODE RETURN 받아서 필수 파라미터 resultMap으로 넘기기*/
    @ResponseBody
    @RequestMapping(value = "/orderTempProc.json", produces = "application/json; utf-8")
    public Map orderTempProc(@RequestBody Map paramMap,  @AuthenticationPrincipal UserInfo user) throws Exception {
        System.err.println("paramMap : " + paramMap);
        paramMap.put("MU_CD", user.getMbCd());
        paramMap.put("MU_ID", user.getId());
        paramMap.put("MU_PHONE", user.getPhone());
        paramMap.put("MU_EMAIL", user.getMbEmail());

        Map<String, Object> resultMap = payService.Order_Temp_Process(paramMap, defaultMap);

        return JsonResponse.asSuccess("resultMap", resultMap);
    }

    /*TB_PAY TABLE INSERT*/
    @ResponseBody
    @RequestMapping(value = "/payInsert.do", produces = "application/json; utf-8")
    public Map payInsert(@RequestBody Map paramMap,  @AuthenticationPrincipal UserInfo user) throws Exception {
        System.err.println("paramMap : " + paramMap);
        paramMap.put("MU_CD", user.getMbCd());
        paramMap.put("MU_ID", user.getId());

        payService.payInsert(paramMap);

        return JsonResponse.asSuccess();
    }
}
