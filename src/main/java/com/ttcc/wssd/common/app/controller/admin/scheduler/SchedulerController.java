package com.ttcc.wssd.common.app.controller.admin.scheduler;

import com.ttcc.wssd.common.app.controller.CommonController;
import com.ttcc.wssd.common.app.service.admin.attendance.AttendanceService;
import com.ttcc.wssd.common.app.service.admin.scheduler.SchedulerService;
import com.ttcc.wssd.common.app.service.user.setting.regist.RegistService;
import com.ttcc.wssd.common.model.Record;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Slf4j
@Component
public class SchedulerController extends CommonController {

    @Autowired
    SchedulerService schedulerService;

    @Autowired
    RegistService registService;

    @Autowired
    AttendanceService attendanceService;

    @Scheduled(cron = "0 5 0 * * *")
    //@Scheduled(cron = "0/5 * * * * *")
    public void sampleSchedule() throws ParseException {
        System.err.println("<==================================스케줄 테스트=====================================>");
        Map paramMap = new HashMap<>();
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String today = date.format(formatter);
        DayOfWeek dayOfweek = date.getDayOfWeek();
        paramMap.put("DATE", today);
        paramMap.put("DAY", dayOfweek.getDisplayName(TextStyle.NARROW, Locale.KOREAN));
        List<Record> userList = schedulerService.getUserList(paramMap);
        List<Record> attendanceList = null;
        Map map = new HashMap();
        for (int i = 0; i < userList.size(); i++) {
            userList.get(i).put("DATE", today);
            userList.get(i).put("DAY", dayOfweek.getDisplayName(TextStyle.NARROW, Locale.KOREAN));
            if(userList.get(i).get("REGIST_SEAT") != null) {
                registService.attendanceInsert(userList.get(i));
            }
            map = getAttendanceMap(schedulerService.getAttendanceList(userList.get(i)));
            map.put("ATTENDANCE_DATE", today);
            System.err.println("map  = = = = = " + map);
            attendanceService.attendanceUpdate(map);
        }
    }

    public static Map getAttendanceMap(@RequestParam List paramMap) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        String[] date = {"08:00", "09:10", "10:10", "11:10", "12:00", "12:50", "14:00", "15:00", "16:00", "17:00", "17:45", "18:30", "19:30", "20:30", "21:30", "22:30", "23:25"};
        String CHANNEL_CODE ="";
        String ROOM_CODE = "";
        String MU_CD = "";
        Map map = new HashMap();
        Map returnMap = new HashMap();
        for (int i = 0; i < paramMap.size(); i++) {
            map = (Map) paramMap.get(i);
            System.err.println("map = = = = " + map);
            if( map.get("OTHER_REGIST_EXC_DATE") == null || map.get("OTHER_REGIST_EXC_DATE").toString().equals("null")) {
                for(int j = 0; j < date.length-1; j++) {
                    CHANNEL_CODE = map.get("REGIST_CHANNEL").toString();
                    ROOM_CODE = map.get("REGIST_ROOM").toString();
                    MU_CD = map.get("REGIST_MU_CD").toString();
                    if (map.get("OTHER_REGIST_SEQ") != null) {
                        if (map.get("OTHER_REGIST_DEPART").toString().equals("B")) {
                            returnMap.put("C0", map.get("OTHER_REGIST_SUB").toString());
                            returnMap.put("C1", "미등원");
                            if (map.get("OTHER_REGIST_ARRIVE").toString().equals("B")) {
                                for(int t = 2; t <= 16; t++) {
                                    returnMap.put("C" + t, "-");
                                }
                            }
                            if (map.get("OTHER_REGIST_ARRIVE").toString().equals("A")) {
                                long time = sdf.parse(map.get("OTHER_REGIST_COME").toString()).getTime();
                                long start = sdf.parse(date[j]).getTime();
                                long end = sdf.parse(date[j + 1]).getTime();
                                if (time >= end) {
                                    returnMap.put("C" + j, "-");
                                }
                                if (time >= start && time < end) {
                                    returnMap.put("C" + j,"귀원("+map.get("OTHER_REGIST_COME").toString()+")");
                                }
                            }
                        }

                        if (map.get("OTHER_REGIST_DEPART").toString().equals("A")) {
                            long time = sdf.parse(map.get("OTHER_REGIST_OUT").toString()).getTime();
                            long start = sdf.parse(date[j]).getTime();
                            long end = sdf.parse(date[j + 1]).getTime();
                            if (map.get("OTHER_REGIST_ARRIVE").toString().equals("B")) {
                                if(time >= start && time < end) {
                                    returnMap.put("C" + j, map.get("OTHER_REGIST_SUB").toString());
                                    returnMap.put("C" +(j+1), "미귀원");
                                    for (int t = j+2; t <= 16; t++) {
                                        returnMap.put("C" + t, "-");
                                    }
                                }
                            }
                            if (map.get("OTHER_REGIST_ARRIVE").toString().equals("A")) {
                                if(time >= start && time < end) {
                                    returnMap.put("C" + j, map.get("OTHER_REGIST_SUB").toString());
                                }
                                long Otime = sdf.parse(map.get("OTHER_REGIST_OUT").toString()).getTime();
                                long Ctime = sdf.parse(map.get("OTHER_REGIST_COME").toString()).getTime();
                                if (Ctime >= end && Otime < start) {
                                    returnMap.put("C"+j, "-");
                                }
                                if (Ctime >= start && Ctime < end) {
                                    returnMap.put("C"+j, "귀원("+map.get("OTHER_REGIST_COME").toString()+")");
                                }
                            }
                        }
                    }
                }
            }
        }

        returnMap.put("CHANNEL_CODE", CHANNEL_CODE);
        returnMap.put("ROOM_CODE", ROOM_CODE);
        returnMap.put("ATTENDANCE_MU_CD", MU_CD);

        System.err.println("<==========================================================================>");

        return returnMap;
    }
}

