<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-25
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-01-18
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<div class="area">
    <div class="inner typeScroll">
        <div class="cate">
            <div class="tit">출석부관리</div>
            <div class="bar"></div>
            <div class="cate_list">
                <a href="/master/main">HOME</a>
                <span class="bar"></span>
                <span>출석부관리</span>
                <span class="bar"></span>
                <span>출석현황</span>
            </div>
        </div>
        <div class="cont">
            <div class="list attend_list">
                <form action="#" name="frmSearch2" id="form-search" method="post" class="clearfix">
                    <input type="hidden" name="currentPage" value="<c:out value='${pageInfo.currentPage}'/>"/>
                    <input type="hidden" name="rowsPerPage" value="<c:out value='${pageInfo.rowsPerPage}'/>"/>
                    <div class="list_tit list_tit02">
                        <div class="list_srch list_srch_wide">
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchChannel" id="search_channel" onchange="goSearch();">
                                        <option value="" selected="">지점선택</option>
                                        <c:forEach items="${channelList}" var="row">
                                         <option value="${row.CHANNEL_CODE}" ${pageInfo.searchChannel == row.CHANNEL_CODE ? 'selected' : ''}>${row.CHANNEL_NAME}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" ㄴ="" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="srch_sel">
                                <div class="sel_type">
                                    <select name="searchRoom" id="search_room" onchange="goSearch()">
                                        <option value="" selected="">호/실 선택</option>
                                        <c:forEach items="${roomList}" var="row">
                                            <option value="${row.ROOM_CODE}" ${pageInfo.searchRoom == row.ROOM_CODE ? 'selected' : ''}>${row.ROOM_NAME}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="arrow">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" ㄴ="" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>
                                    </span>
                                </div>
                            </div>
                            <div class="srch_sel danAuto dan_r">
                                <div class="sel_type datePicker">
                                    <input type="text" id="attendace_date" name="DATE" class="picker_form datepicker" readonly="" onchange="goSearch();"><button type="button" class="ui-datepicker-trigger"><img src="/resources/main/admin/img/icon/calender_img.svg" alt="달력" title="달력"></button>
                                </div>
                            </div>
                            <div class="srch_form">
                                <button type="button" class="icon" onclick="goSearch(); return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none">
                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                              transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
                                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                              fill="black"></path>
                                    </svg>
                                </button>
                                <input type="text" placeholder="Search" name="searchText" value="${pageInfo.searchText}">
                            </div>
                        </div>
                    </div>
                </form>
                <div class="list_detail att_detail">
                    <table class="table_type01">
                        <colgroup>
                            <col>
                            <col>
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                            <col style="width: 5.2%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>좌석</th>
                            <th>이름</th>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>점심</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                            <th>8</th>
                            <th>9</th>
                            <th>석식</th>
                            <th>10</th>
                            <th>11</th>
                            <th>12</th>
                            <th>13</th>
                            <th>14</th>
                            <th>15</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <tr>
                                    <td class="none" colspan="19"><span>등록된 출석부가 없습니다.</span></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="row">
                                    <tr>
                                        <td class="td_tit">
                                            <span>${row.SEAT_NAME}번</span>
                                        </td>
                                        <td class="td_tit">
                                            <span><a href="#" onclick="userAttendance('${row.ATTENDANCE_MU_CD}','${row.MU_NAME}','${row.REGIST_ROOM}')">${row.MU_NAME}</a></span>
                                        </td>
                                        <td><c:choose>
                                            <c:when test="${row.C0 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C0_EXC != null && row.C0_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C0_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C0 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C0_EXC != null && row.C0_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C0_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C0 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C0_EXC != null && row.C0_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C0_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C0 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C0_EXC != null && row.C0_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C0_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C0}</span>
                                                <c:if test="${row.C0_EXC != null && row.C0_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C0_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C1 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C1_EXC != null && row.C1_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C1_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C1 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C1_EXC != null && row.C1_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C1_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C1 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C1_EXC != null && row.C1_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C1_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C1 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C1_EXC != null && row.C1_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C1_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C1}</span>
                                                <c:if test="${row.C1_EXC != null && row.C1_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C1_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C2 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C2_EXC != null && row.C2_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C2_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C2 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C2_EXC != null && row.C2_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C2_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C2 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C2_EXC != null && row.C2_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C2_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C2 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C2_EXC != null && row.C2_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C2_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C2}</span>
                                                <c:if test="${row.C2_EXC != null && row.C2_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C2_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C3 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C3_EXC != null && row.C3_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C3_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C3 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C3_EXC != null && row.C3_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C3_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C3 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C3_EXC != null && row.C3_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C3_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C3 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C3_EXC != null && row.C3_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C3_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C3}</span>
                                                <c:if test="${row.C3_EXC != null && row.C3_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C3_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C4 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C4_EXC != null && row.C4_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C4_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C4 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C4_EXC != null && row.C4_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C4_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C4 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C4_EXC != null && row.C4_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C4_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C4 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C4_EXC != null && row.C4_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C4_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C4}</span>
                                                <c:if test="${row.C4_EXC != null && row.C4_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C4_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C5 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C5_EXC != null && row.C5_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C5_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if></c:when>
                                            <c:when test="${row.C5 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C5_EXC != null && row.C5_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C5_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C5 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C5_EXC != null && row.C5_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C5_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C5 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C5_EXC != null && row.C5_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C5_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C5}</span>
                                                <c:if test="${row.C5_EXC != null && row.C5_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C5_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C6 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C6_EXC != null && row.C6_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C6_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C6 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C6_EXC != null && row.C6_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C6_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C6 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C6_EXC != null && row.C6_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C6_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C6 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C6_EXC != null && row.C6_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C6_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C6}</span>
                                                <c:if test="${row.C6_EXC != null && row.C6_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C6_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C7 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C7_EXC != null && row.C7_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C7_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C7 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C7_EXC != null && row.C7_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C7_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C7 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C7_EXC != null && row.C7_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C7_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C7 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C7_EXC != null && row.C7_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C7_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C7}</span>
                                                <c:if test="${row.C7_EXC != null && row.C7_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C7_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C8 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C8_EXC != null && row.C8_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C8_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C8 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C8_EXC != null && row.C8_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C8_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C8 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C8_EXC != null && row.C8_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C8_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C8 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C8_EXC != null && row.C8_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C8_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C8}</span>
                                                <c:if test="${row.C8_EXC != null && row.C8_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C8_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C9 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C9_EXC != null && row.C9_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C9_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C9 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C9_EXC != null && row.C9_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C9_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C9 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C9_EXC != null && row.C9_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C9_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C9 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C9_EXC != null && row.C9_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C9_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C9}</span>
                                                <c:if test="${row.C9_EXC != null && row.C9_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C9_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C10 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C10_EXC != null && row.C10_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C10_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C10 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C10_EXC != null && row.C10_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C10_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if></c:when>
                                            <c:when test="${row.C10 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C10_EXC != null && row.C10_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C10_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C10 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C10_EXC != null && row.C10_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C10_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C10}</span>
                                                <c:if test="${row.C10_EXC != null && row.C10_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C10_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C11 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C11_EXC != null && row.C11_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C11_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C11 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C11_EXC != null && row.C11_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C11_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C11 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C11_EXC != null && row.C11_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C11_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C11 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C11_EXC != null && row.C11_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C11_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C11}</span>
                                                <c:if test="${row.C11_EXC != null && row.C11_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C11_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C12 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C12_EXC != null && row.C12_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C12_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C12 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C12_EXC != null && row.C12_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C12_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C12 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C12_EXC != null && row.C12_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C12_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C12 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C12_EXC != null && row.C12_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C12_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C12}</span>
                                                <c:if test="${row.C12_EXC != null && row.C12_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C12_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C13 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C13_EXC != null && row.C13_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C13_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C13 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C13_EXC != null && row.C13_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C13_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C13 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C13_EXC != null && row.C13_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C13_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C13 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C13_EXC != null && row.C13_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C13_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C13}</span>
                                                <c:if test="${row.C13_EXC != null && row.C13_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C13_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C14 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C14_EXC != null && row.C14_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C14_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C14 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C14_EXC != null && row.C14_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C14_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C14 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C14_EXC != null && row.C14_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C14_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C14 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C14_EXC != null && row.C14_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C14_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C14}</span>
                                                <c:if test="${row.C14_EXC != null && row.C14_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C14_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C15 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C15_EXC != null && row.C15_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C15_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C15 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C15_EXC != null && row.C15_EXC != ''}">
                                                <div class="action action_left">
                                                    <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                    </button>
                                                    <div class="action_info note_info">
                                                        <span>${row.C15_EXC}</span>
                                                    </div>
                                                </div><%-- 비고버튼 --%>
                                            </c:if>
                                            </c:when>
                                            <c:when test="${row.C15 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C15_EXC != null && row.C15_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C15_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C15 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C15_EXC != null && row.C15_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C15_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C15}</span>
                                                <c:if test="${row.C15_EXC != null && row.C15_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C15_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                        <td><c:choose>
                                            <c:when test="${row.C16 == 'Y'}"><span class="">출석</span>
                                                <c:if test="${row.C16_EXC != null && row.C16_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C16_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C16 == 'N'}"><span class="cut">결석</span>
                                                <c:if test="${row.C16_EXC != null && row.C16_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C16_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C16 == 'A'}"><span class="late">지각</span>
                                                <c:if test="${row.C16_EXC != null && row.C16_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C16_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${row.C16 == 'B'}"><span class="lesson">보강</span>
                                                <c:if test="${row.C16_EXC != null && row.C16_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C16_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="">${row.C16}</span>
                                                <c:if test="${row.C16_EXC != null && row.C16_EXC != ''}">
                                                    <div class="action action_left">
                                                        <button type="button">
                                                        <span class="note_btn">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                                            </svg>
                                                        </span>
                                                        </button>
                                                        <div class="action_info note_info">
                                                            <span>${row.C16_EXC}</span>
                                                        </div>
                                                    </div><%-- 비고버튼 --%>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
              <%--      <div class="list_control">
                        <div class="sel_count">
                            <div class="sel_type">
                                <select name="" id="count" onchange="rowsChange(this.value);">
                                    <option value="10" ${pageInfo.rowsPerPage == '10' ? 'selected' : ''}>10</option>
                                    <option value="25" ${pageInfo.rowsPerPage == '25' ? 'selected' : ''}>25</option>
                                    <option value="50" ${pageInfo.rowsPerPage == '50' ? 'selected' : ''}>50</option>
                                    <option value="100" ${pageInfo.rowsPerPage == '100' ? 'selected' : ''}>100</option>

                                </select>
                                <span class="arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                         class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24"
                                         viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                         stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </span>
                            </div>
                        </div>
                        <div class="paging">
                            <a href="#" class="prev">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="icon icon-tabler icon-tabler-chevron-left" width="24" height="24"
                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="15 6 9 12 15 18"></polyline>
                                </svg>
                            </a>
                            <c:if test="${!empty list}">
                                ${dh:pagingA(pageInfo.totalCount, pageInfo.currentPage, pageInfo.rowsPerPage, 10)}
                            </c:if>
                            <a href="#" class="next">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="icon icon-tabler icon-tabler-chevron-right" width="24" height="24"
                                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                     stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="9 6 15 12 9 18"></polyline>
                                </svg>
                            </a>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="add_modal attList_modal attend_modal typeScroll" id="attendance_modal">
    <div class="modal_bg" ></div>
    <div class="modal_form">
        <div class="modal_cont">
            <div class="modal_tit">
                <div class="tit">
                    <span>출석현황</span>
                </div>
                <div class="close">
                    <button type="button" onclick="attClose();return false;">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-x" width="24"
                                 height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                 stroke-linecap="round" stroke-linejoin="round">
                               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                               <line x1="18" y1="6" x2="6" y2="18"></line>
                               <line x1="6" y1="6" x2="18" y2="18"></line>
                            </svg>
                        </span>
                    </button>
                </div>
            </div>
            <div class="modal_body modal_address">
                <form id="form_attendance" name="formAttendance" method="post" action="/">
                    <input type ="hidden" id="modal_date" name="ATTENDANCE_DATE" value="">
                    <input type ="hidden" id="modal_mb_cd" name="ATTENDANCE_MU_CD" value="">
                    <div class="modal_get">
                        <div class="dan">
                            <div class="sel_type">
                                <select name="" id="modal_year">
                                    <option value="" selected="">년도선택</option>
                                    <option value="2022">2022</option>
                                </select>
                                <span class="arrow">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                            </div>
                            <div class="sel_type">
                                <select name="" id="modal_month" onchange="userAttendanceChange(this); return false;">
                                    <option value="" selected="">월선택</option>
                                    <option value="01">1월</option>
                                    <option value="02">2월</option>
                                    <option value="03">3월</option>
                                    <option value="04">4월</option>
                                    <option value="05">5월</option>
                                    <option value="06">6월</option>
                                    <option value="07">7월</option>
                                    <option value="08">8월</option>
                                    <option value="09">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <span class="arrow">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                            </div>
                        </div>
                        <div class="att_detail">
                                <table class="table_type01">
                                    <colgroup>
                                        <col style="width: 60px">
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>1</th>
                                        <th>2</th>
                                        <th>3</th>
                                        <th>4</th>
                                        <th>점심</th>
                                        <th>5</th>
                                        <th>6</th>
                                        <th>7</th>
                                        <th>8</th>
                                        <th>9</th>
                                        <th>석식</th>
                                        <th>10</th>
                                        <th>11</th>
                                        <th>12</th>
                                        <th>13</th>
                                        <th>14</th>
                                        <th>15</th>
                                    </tr>
                                    </thead>
                                    <tbody id="modal_attendance">

                                    </tbody>
                                </table>
                            </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>

    $(document).ready(function () {
        datepickerSetting("add");
        maxDateSet();
    });

    function datepickerSetting(set) {
        let setting = set
        if($('input').hasClass('picker_form')) {
            $('input[id="attendace_date"]').each(function() {
                $(this).datepicker({
                    closeText: "닫기",
                    prevText: "이전달",
                    nextText: "다음달",
                    currentText: "오늘",
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"
                    ],
                    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
                        "7월", "8월", "9월", "10월", "11월", "12월"
                    ],
                    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
                    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                    weekHeader: "주",
                    dateFormat: 'yy-mm-dd',
                    firstDay: 0,
                    isRTL: false,
                    showMonthAfterYear: true,
                    yearSuffix: "년",
                    showOn: 'both',
                    buttonImage: '/resources/main/admin/img/icon/calender_img.svg',
                    buttonText: "달력"
                });
                if (setting == "add") {
                    if(${pageInfo.DATE == null} || ${pageInfo.DATE == ""}) {
                        $(this).datepicker("setDate", 'today');
                    } else {
                        $(this).datepicker("setDate", "${pageInfo.DATE}");
                    }
                }
            })
        }
    }

    function maxDateSet() {
        let today = new Date();
        let max_date_year =  today.getFullYear();
        let max_date_month = ("0" + (1 + today.getMonth())).slice(-2);
        let max_date_day = ("0" + today.getDate()).slice(-2);
        let max_date_set = max_date_year+"-"+max_date_month+"-"+max_date_day;
        $("#attendace_date").datepicker("option", "maxDate", max_date_set);
    }

    //// 공통 변수 선언
    let channelName = document.querySelector("#channel_name");
    let channelAddress = document.querySelector("#channel_address");
    let channelCodeid = document.querySelector("#channel_code");

    function modal_view() {
        $('#code_modal').addClass('view');
    }

    function modal_close() {
        document.forms['formChannel'].reset();
        let add_code = document.querySelector("#add_code").value;
        $(".modal_body #channel_code option[value="+"'"+add_code+"'"+"]").remove();
        $('#code_modal').removeClass('view');
    }
    function address_close() {
        $('#company_address_modal').removeClass('view');
    }

    //// 출석부 관리
    function attView(num) {
        var number = num;
        if (number == 1) {
            $('.attend_modal').addClass('view');
            $('html,body').css('overflow', 'auto');
        }
    }

    function attClose() {
        $('.attend_modal').removeClass('view');
        $('html,body').css('overflow','');
        document.forms['formAttendance'].reset();
    }
    function navClose() {
        parent.attClose();
    }

    function userAttendanceChange(el) {
        let year = $("#modal_year").val();
        if(year == null || year == '') {
            alert("연도를 선택해 주세요.");
            $(el).val("");
            return;
        }
        let MU_CD = $("#modal_mb_cd").val();
        let month = $(el).val();
        let date = "01";
        let param = year+"-"+month+"-"+date;
        $.ajax({
            type: "post",
            url: "/user/attendance/attendanceChange.do",
            data: "ATTENDANCE_MU_CD="+MU_CD+"&MONTH="+param,
            success: function (data) {
                if (data.success) {
                    let text = "";
                    for(let i = 0; i < data.list.length; i++) {
                        text += "<tr>";
                        text += "<th class='att_date'>";
                        text += data.list[i].ATTENDANCE_DATE.split('-')[2];
                        text += "("+data.list[i].ATTENDANCE_DAY+")";
                        text += "</th>";
                        for(let j = 0; j <= 16; j++) {
                            text += "<td>";
                            if(data.list[i]['C'+j] == 'Y') {
                                text += "<span class=''>출석</span>";
                            } else if (data.list[i]['C'+j] == 'N') {
                                text += "<span class='cut'>결석</span>";
                            } else if (data.list[i]['C'+j] == 'A') {
                                text += "<span class='late'>지각</span>";
                            } else if (data.list[i]['C'+j] == 'B') {
                                text += "<span class='lesson'>보강</span>";
                            } else {
                                text += "<span class=''>";
                                text += data.list[i]['C'+j];
                                text += "</span>";
                            }
                            text += "</td>";
                        }
                    }
                    $("#modal_attendance").html(text);
                    attView('1');
                } else {
                    Alert.err();
                }
            }
        });
    }

    function userAttendance(CD, NAME, ROOM) {
        let MU_CD = CD;
        let MU_NAME = NAME;
        console.log(ROOM);
        $.ajax({
            type: "post",
            url: "/user/attendance/attendanceChange.do",
            data: "ATTENDANCE_MU_CD="+MU_CD+"&REGIST_ROOM="+ROOM,
            success: function (data) {
                if (data.success) {
                    let head = '<span>출석현황 - ' +'<i>'+MU_NAME+'</i>' + '</span>';
                    let text = "";
                    for(let i = 0; i < data.list.length; i++) {
                        text += "<tr>";
                        text += "<th class='att_date'>";
                        text += data.list[i].ATTENDANCE_DATE.split('-')[2];
                        text += "("+data.list[i].ATTENDANCE_DAY+")";
                        text += "</th>";
                        for(let j = 0; j <= 16; j++) {
                            text += "<td>";
                            if(data.list[i]['C'+j] == 'Y') {
                                text += "<span class=''>출석</span>";
                            } else if (data.list[i]['C'+j] == 'N') {
                                text += "<span class='cut'>결석</span>";
                            } else if (data.list[i]['C'+j] == 'A') {
                                text += "<span class='late'>지각</span>";
                            } else if (data.list[i]['C'+j] == 'B') {
                                text += "<span class='lesson'>보강</span>";
                            } else {
                                text += "<span class=''>";
                                text += data.list[i]['C'+j];
                                text += "</span>";
                            }
                            text += "</td>";
                        }
                    }
                    $("#modal_year").val(data.dateMap.select_year).prop("selected", true);
                    $("#modal_month").val(data.dateMap.select_month).prop("selected", true);
                    $("#modal_mb_cd").val(MU_CD);
                    $("#modal_attendance").html(text);
                    $("#attendance_modal .tit").html(head);
                    attView('1');
                } else {
                    Alert.err();
                }
            }
        });
    }

</script>