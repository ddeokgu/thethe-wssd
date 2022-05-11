<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-04-11
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

<div id="container" class="containR containsubR">
  <section class="contents_wrap contents_sub font_KR">
    <div class="bg-box clearfix">
      <div class="bg-box01">
        <img src="/resources/main/user/img/sub/background-sub01.png" alt="">
      </div>
      <div class="bg-box01">
        <img src="/resources/main/user/img/sub/background-sub02.png" alt="">
      </div>
    </div>
    <div class="cont_box">
      <div class="cont_inner">
        <div class="view_all clearfix">
          <div class="view_left">
            <div class="l_t">
              <ul class="clearfix">
                <li>
                  <a href="/user/setting/registList.do">등록·연장관리</a>
                </li>
                <li>
                  <a href="/user/setting/otherRegistList.do">타학원 관리</a>
                </li>
                <li>
                  <a href="/user/attendance/attendance.do">출석부</a>
                </li>
              </ul>
            </div>
            <div class="l_t">
              <ul class="clearfix">
                <li>
                  <a href="/user/profile/profile.do">프로필 관리</a>
                </li>
                <li>
                  <a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a>
                </li>
              </ul>
            </div>
            <div class="blogBtn">
              <ul class="clearfix">
                <li>
                  <a href="#">
                    <img src="/resources/main/user/img/icon/blogICon.png" alt="고등학생 독학관리 바로가기">
                    <span>고등학생 독학관리</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/resources/main/user/img/icon/blogICon.png" alt="독학재수 바로가기">
                    <span>독학재수</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/resources/main/user/img/icon/blogICon.png" alt="독학공무원 바로가기">
                    <span>독학공무원</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/resources/main/user/img/icon/blogICon.png" alt="수능 단과반 바로가기">
                    <span>수능 단과반</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <img src="/resources/main/user/img/icon/blogICon.png" alt="지점 바로가기">
                    <span>지점</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="view_right">
            <div class="login_wrap join_wrap">
              <div class="cont_tit"><span>출석부</span></div>
              <div class="login_field join_field">
                <div class="table_srch_form att_srch">
                    <div class="chkbox">
                        <div class="srch_box">
                            <select id="select_year" name="" onchange="">
                                <option value="" selected="">년도선택</option>
                                <option value="2022" ${pageInfo.select_year == '2022' ? 'selected': ''}>2022년</option>
                            </select>
                            <span class="srch_box_arrow">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                  <div class="table_srch_form att_srch">
                      <div class="chkbox">
                          <div class="srch_box">
                              <select id="select_date" name="" onchange="attendanceChange(this); return false;">
                                  <option value="" selected="">월선택</option>
                                  <option value="01" ${pageInfo.select_month == '01' ? 'selected': ''}>1월</option>
                                  <option value="02" ${pageInfo.select_month == '02' ? 'selected': ''}>2월</option>
                                  <option value="03" ${pageInfo.select_month == '03' ? 'selected': ''}>3월</option>
                                  <option value="04" ${pageInfo.select_month == '04' ? 'selected': ''}>4월</option>
                                  <option value="05" ${pageInfo.select_month == '05' ? 'selected': ''}>5월</option>
                                  <option value="06" ${pageInfo.select_month == '06' ? 'selected': ''}>6월</option>
                                  <option value="07" ${pageInfo.select_month == '07' ? 'selected': ''}>7월</option>
                                  <option value="08" ${pageInfo.select_month == '08' ? 'selected': ''}>8월</option>
                                  <option value="09" ${pageInfo.select_month == '09' ? 'selected': ''}>9월</option>
                                  <option value="10" ${pageInfo.select_month == '10' ? 'selected': ''}>10월</option>
                                  <option value="11" ${pageInfo.select_month == '11' ? 'selected': ''}>11월</option>
                                  <option value="12" ${pageInfo.select_month == '12' ? 'selected': ''}>12월</option>
                              </select>
                              <span class="srch_box_arrow">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                          </div>
                      </div>
                  </div>
                <div class="table_form otherSch_form att_form view">
                  <table class="table_list tableListop">
                    <colgroup>
                      <col style="width: 50px">
                      <col style="width: 55px" class="numb">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 55px">
                      <col style="width: 70px;">
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
                      <th>지점/호실</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                  <table class="table_list tableListbot">
                      <colgroup>
                          <col style="width: 50px">
                          <col style="width: 55px" class="numb">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 55px">
                          <col style="width: 70px;">
                      </colgroup>
                    <tbody id="attendance_table">
                        <c:forEach items="${list}" var="row">
                            <tr>
                                <th class="att_date"><c:out value="${row.ATTENDANCE_DATE.split('-')[2]}(${row.ATTENDANCE_DAY})"></c:out></th>
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
                                <td class="">
                                    <span>${row.CHANNEL_NAME}<i class="one_fw">- ${row.ROOM_NAME}</i></span>
                                </td>
                            </tr>
                        </c:forEach>
                     <%-- <tr>
                        <th class="att_date">01(월)</th>
                        <td class="">지각</td>
                        <td class="">출석</td>
                        <td class="">-</td>
                        <td class="">-</td>
                        <td class="">-</td>
                        <td class="">-</td>
                        <td class="">-</td>
                        <td class="">미등원(17:00)</td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class=""></td>
                        <td class="">
                            <span>신목점<i class="one_fw">- 501호</i></span>
                        </td>
                      </tr>
                      <tr>
                          <th class="att_date">01(월)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">01(월)</th>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">01(월)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">01(월)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">01(월)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">30(금)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>
                      <tr>
                          <th class="att_date">33(일)</th>
                          <td class="">지각(15분)</td>
                          <td class="">지각</td>
                          <td class="">출석</td>
                          <td class="">결석</td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class=""></td>
                          <td class="">
                              <span>신목점<i class="one_fw">- 501호</i></span>
                          </td>
                      </tr>--%>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>
    function attendanceChange(el) {
        let year = $("#select_year").val();
        let month = $(el).val();
        let date = '01';
        let param = year+'-'+month+'-'+date;
        if(year == '' || year == null) {
            alert("년도를 선택해 주세요.");
            $(el).val("");
            return;
        }
        if(month == "" || month == null) {
            return;
        }

        $.ajax({
            type: "post",
            url: "/user/attendance/attendanceChange.do",
            data: 'MONTH='+param,
            success: function (data) {
                if (data.success) {
                    let text = "";
                    for(let i = 0; i < data.list.length; i ++) {
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
                        text += "<td class=''>";
                        text += "<span>";
                        text += data.list[i].CHANNEL_NAME;
                        text += "<i class='one_fw'>- ";
                        text += data.list[i].ROOM_NAME;
                        text += "</i>";
                        text += "</span>";
                    }
                   $("#attendance_table").html(text);
                } else {
                    Alert.err();
                }
            }
        });
    }
</script>
