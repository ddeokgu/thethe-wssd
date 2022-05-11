
package com.ttcc.wssd.common.app.controller.admin.attendance;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.attendance.AttendanceService;
import com.ttcc.wssd.common.app.service.admin.setting.channel.ChannelService;
import com.ttcc.wssd.common.app.service.admin.setting.room.RoomService;
import com.ttcc.wssd.common.model.JsonResponse;
import com.ttcc.wssd.common.model.Record;
import com.ttcc.wssd.common.security.UserInfo;
import com.ttcc.wssd.common.util.Util;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/attendance")
@Controller
public class AttendanceController extends CommonController {

    @Autowired
    RoomService roomService;

    @Autowired
    ChannelService channelService;

    @Autowired
    AttendanceService attendanceService;

    @RequestMapping("/attendanceCheck.do")
    public String attendance(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        if(paramMap.get("DATE") == null || paramMap.get("DATE").equals("") || paramMap.get("DATE").equals("undefined")) {
            paramMap.put("DATE", today);
        }

        Map map = new HashMap();
        map.put("startIndex", 0);
        map.put("rowsPerPage", 100);
        map.put("searchChannelUseYn", "Y");
        map.put("searchRoomUseYn", "Y");
        map.put("searchChannel" , paramMap.get("searchChannel"));
        List<Record> channelList = channelService.channelList(map);
        if(!(paramMap.get("searchChannel") == null) && !(paramMap.get("searchChannel") == "")) {
            List<Record> roomList =  roomService.roomList(map);
            if(paramMap.get("searchRoom") == null || paramMap.get("searchRoom") == "") {
                if(roomList.size() > 0) {
                    String room = roomList.get(0).getString("ROOM_CODE");
                    paramMap.put("searchRoom", room);
                }
            }
            model.addAttribute("roomList",roomList);
        } else {
            if(channelList.size() > 0) {
                String channel = channelList.get(0).getString("CHANNEL_CODE");
                paramMap.put("searchChannel", channel);
                map.put("searchChannel", channel);
            }
            List<Record> roomList =  roomService.roomList(map);
            if(roomList.size() > 0) {
                String room = roomList.get(0).getString("ROOM_CODE");
                paramMap.put("searchRoom", room);
                map.put("searchRoom", room);
            }
            model.addAttribute("roomList",roomList);
        }

        paramMap.put("totalCount", attendanceService.attendanceCount(paramMap));

        model.addAttribute("channelList", channelList);
        model.addAttribute("list", attendanceService.userAttendanceList(paramMap));
        model.addAttribute("pageInfo", paramMap);

        return "main-admin:/attendance/attendanceCheck";
    }


    @RequestMapping("/attendanceList.do")
    public String attendanceList(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        if(paramMap.get("DATE") == null || paramMap.get("DATE").equals("") || paramMap.get("DATE").equals("undefined")) {
            paramMap.put("DATE", today);
        }

        paramMap.put("searchChannelUseYn", "Y");
        List<Record> channelList = channelService.channelList(paramMap);
        if(!(paramMap.get("searchChannel") == null) && !(paramMap.get("searchChannel") == "")) {
            List<Record> roomList =  roomService.roomList(paramMap);
            if(paramMap.get("searchRoom") == null || paramMap.get("searchRoom") == "") {
                if(roomList.size() > 0) {
                    String room = roomList.get(0).getString("ROOM_CODE");
                    paramMap.put("searchRoom", room);
                }
            }
            model.addAttribute("roomList",roomList);
        } else {
            if(channelList.size() > 0) {
                String channel = channelList.get(0).getString("CHANNEL_CODE");
                paramMap.put("searchChannel", channel);
            }
            List<Record> roomList =  roomService.roomList(paramMap);
            if(roomList.size() > 0) {
                String room = roomList.get(0).getString("ROOM_CODE");
                paramMap.put("searchRoom", room);
            }
            model.addAttribute("roomList",roomList);
        }
        paramMap.put("totalCount", attendanceService.attendanceCount(paramMap));
        model.addAttribute("list", attendanceService.userAttendanceList(paramMap));
        model.addAttribute("channelList", channelList);
        model.addAttribute("pageInfo", paramMap);

        return "main-admin:/attendance/attendanceList";
    }

    @ResponseBody
    @RequestMapping("/userAttendance.do")
    public Map userAttendance(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        Util.setPageInfo(paramMap);
        Map map = attendanceService.userAttendance(paramMap);
        return JsonResponse.asSuccess("map", map);

    }

    @ResponseBody
    @RequestMapping("/attendanceUpdate.do")
    public Map attendanceUpdate(ModelMap model, @RequestParam Map paramMap, @AuthenticationPrincipal UserInfo user) throws Exception {
        attendanceService.attendanceUpdate(paramMap);
        return JsonResponse.asSuccess();

    }


}