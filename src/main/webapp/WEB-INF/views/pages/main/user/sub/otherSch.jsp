<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-03-22
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type='text/javascript'src='/resources/main/user/js/timepicki.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link rel='stylesheet' type='text/css'href='/resources/main/user/css/timepicki.css'/>

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
              <div class="cont_tit"><span>타학원관리</span></div>
              <div class="login_field join_field">
                <div class="table_tab">
                  <ul class="clearfix">
                    <li class="active">
                      <a href="#" onclick="return false;">적용일정</a>
                    </li>
                    <li>
                      <a href="#" onclick="return false;">지난일정</a>
                    </li>
                  </ul>
                </div>
                <div class="table_form otherSch_form view"><%-- 적용/지난 Tab_01 --%>
                  <table class="table_list tableListop">
                    <colgroup>
                      <col style="width: 50px">
                      <col style="width: 70px" class="numb">
                      <col>
                      <col style="width:85px" class="m_hide">
                      <col style="width:60px " class="m_hide">
                      <col class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="width: 50px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <thead>
                    <tr>
                      <th class="numb">#</th>
                      <th class="numb">구분</th>
                      <th class="m_hide">요일</th>
                      <th class="m_hide">날짜</th>
                      <th class="m_hide">과목</th>
                      <th class="m_hide">수업시작</th>
                      <th class="m_hide">수업끝</th>
                      <th class="m_hide">나갈시간</th>
                      <th class="m_hide">귀원시간</th>
                      <th class="delete">관리</th>
                      <th class="m_show">더보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                  <table class="table_list tableListbot">
                    <colgroup>
                      <col style="width: 50px">
                      <col style="width: 70px" class="numb">
                      <col>
                      <col style="width:85px" class="m_hide">
                      <col style="width:60px " class="m_hide">
                      <col class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="width: 50px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <tbody>
                    <c:forEach items="${list}" var="row" varStatus="status">
                      <tr>
                        <td class="num"><c:out
                            value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out>
                        </td>
                        <td class="num oth_down">
                          <span class="one_fw">${row.OTHER_REGIST_TYPE eq 'A' ? '고정일정' : '임시일정'}
                          <c:if test="${row.EXC_COUNT ne '0'}">
                            <span class="oth_arrow" onclick="otherRegistExcShow(this,'${row.OTHER_REGIST_SEQ}'); return false;">
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-down-circle" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <circle cx="12" cy="12" r="9"></circle>
                                <line x1="8" y1="12" x2="12" y2="16"></line>
                                <line x1="12" y1="8" x2="12" y2="16"></line>
                                <line x1="16" y1="12" x2="12" y2="16"></line>
                              </svg>
                            </span>
                          </c:if>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_DAY}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_DATE}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_SUB}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_START}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_END}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_DEPART eq 'A' ? row.OTHER_REGIST_OUT : '집'}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row.OTHER_REGIST_ARRIVE eq 'A' ? row.OTHER_REGIST_COME : '집'}</span>
                        </td>
                        <td class="delete">
                          <div class="other_btn">
                            <c:if test="${row.EXC_COUNT ne '0'}">
                              <button type="button" class="btn_type01">
                                <span>예외일정</span>
                              </button>
                            </c:if>
                          </div>
                          <div class="action">
                            <button type="button" class="act_btn">
                              <span class="more">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-dots" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                  <circle cx="5" cy="12" r="1"></circle>
                                  <circle cx="12" cy="12" r="1"></circle>
                                  <circle cx="19" cy="12" r="1"></circle>
                                </svg>
                              </span>
                            </button>
                            <div class="action_info">
                              <ul>
                                <li>
                                  <button type="button" class="" onclick="otherRegistDelete('${row.OTHER_REGIST_SEQ}'); return false;">삭제</button>
                                </li>
                                <li>
                                  <c:if test="${row.OTHER_REGIST_TYPE eq 'A'}">
                                    <button type="button" class="" onclick="excPopShow('${row.OTHER_REGIST_DAY}', '${row.OTHER_REGIST_SEQ}', '${row.OTHER_REGIST_SUB}', '${row.OTHER_REGIST_START}', '${row.OTHER_REGIST_END}', '${row.OTHER_REGIST_OUT}', '${row.OTHER_REGIST_COME}'); return false;">고정예외</button>
                                  </c:if>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </td>
                        <td class="m_show">
                          <a href="#" class="more">
                          <span class="arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                              <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                          </span>
                          </a>
                        </td>
                      </tr>
                      <tr class="tr_m tr_01"><%-- 모바일 더보기List --%>
                        <td colspan="9">
                          <div class="more_box">
                            <ul>
                              <li>
                                <span class="tit">구분</span>
                                <span>${row.OTHER_REGIST_TYPE eq 'A' ? '고정일정' : '임시일정'}</span>
                              </li>
                              <li>
                                <span class="tit">요일</span>
                                <span>${row.OTHER_REGIST_DAY}</span>
                              </li>
                              <li>
                                <span class="tit">날짜</span>
                                <span>${row.OTHER_REGIST_DATE}</span>
                              </li>
                              <li>
                                <span class="tit">과목</span>
                                <span>${row.OTHER_REGIST_SUB}</span>
                              </li>
                              <li>
                                <span class="tit">수업시작</span>
                                <span>${row.OTHER_REGIST_START}</span>
                              </li>
                              <li>
                                <span class="tit">수업끝</span>
                                <span>${row.OTHER_REGIST_END}</span>
                              </li>
                              <li>
                                <span class="tit">나갈시간</span>
                                <span>${row.OTHER_REGIST_DEPART eq 'A' ? row.OTHER_REGIST_OUT : '집'}</span>
                              </li>
                              <li>
                                <span class="tit">귀원시간</span>
                                <span>${row.OTHER_REGIST_ARRIVE eq 'A' ? row.OTHER_REGIST_COME : '집'}</span>
                              </li>
                            </ul>
                          </div>
                        </td>
                      </tr>
                      <c:forEach items="${excList}" var="row2">
                        <c:if test="${row.OTHER_REGIST_SEQ eq row2.OTHER_REGIST_SEQ}">
                          <tr name="other_list${row.OTHER_REGIST_SEQ}" class="other_list">
                            <td>
                              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                <g data-name="20-Arrow-direction-pointer" id="_20-Arrow-direction-pointer">
                                  <polyline points="11 31 5 24 11 16" style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:2px"/>
                                  <polyline points="6 24 27 24 27 1" style="fill:none;stroke:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:2px"/>
                                </g>
                              </svg>
                            </td>
                            <td class="num">
                              <span class="one_fw">예외일정</span>
                            </td>
                            <td></td>
                            <td>
                              <span>${row2.OTHER_REGIST_EXC_DATE}</span>
                            </td>
                            <td colspan="5">
                              <label class="" for=""><input type="text" value="" placeholder="${row2.OTHER_REGIST_EXC_DES}"></label>
                            </td>
                            <td>
                              <div class="list_close">
                                <button href="#" onclick="otherRegistExcDelete('${row2.OTHER_REGIST_EXC_SEQ}'); return false;">
                                  <img src="/resources/main/user/img/icon/navClose.png" alt="">
                                </button>
                              </div>
                            </td>
                          </tr>
                          <tr class="tr_m tr_02"><%-- 모바일 예외일정List --%>
                            <td colspan="9">
                              <div class="more_box">
                                <ul>
                                  <li>
                                    <span class="tit">구분</span>
                                    <span>예외일정</span>
                                  </li>
                                  <li>
                                    <span class="tit">날짜</span>
                                    <span>${row2.OTHER_REGIST_EXC_DATE}</span>
                                  </li>
                                </ul>
                                <div class="list_close">
                                  <button href="#"  onclick="otherRegistExcDelete('${row2.OTHER_REGIST_EXC_SEQ}'); return false;">
                                    <img src="/resources/main/user/img/icon/navClose.png" alt="">
                                  </button>
                                </div>
                              </div>
                            </td>
                          </tr>
                        </c:if>
                      </c:forEach>
                    </c:forEach>
                    </tbody>
                  </table>
                  <div class="list_control">
                    <div class="paging">
                      <a href="#" class="prev">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-left" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <polyline points="15 6 9 12 15 18"></polyline>
                        </svg>
                      </a>
                      <c:if test="${!empty list}">
                        ${dh:pagingA(pageInfo.totalCount, pageInfo.currentPage, pageInfo.rowsPerPage, 10)}
                      </c:if>
                      <a href="#" class="next">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-right" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <polyline points="9 6 15 12 9 18"></polyline>
                        </svg>
                      </a>
                    </div>
                  </div>
                  <div class="record_btn">
                    <a href="#" class="btn_type01" onclick="popShow('A'); return false;">
                      <span>타학원시간표 등록</span>
                    </a>
                  </div>
                </div>
                <div class="table_form otherSch_form"><%-- 적용/지난 Tab_02 --%>
                  <table class="table_list tableListop">
                    <colgroup>
                      <col style="width: 50px">
                      <col style="width: 70px" class="numb">
                      <col>
                      <col style="width:85px" class="m_hide">
                      <col style="width:60px " class="m_hide">
                      <col class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="width: 50px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <thead>
                    <tr>
                      <th class="numb">#</th>
                      <th class="numb">구분</th>
                      <th class="m_hide">요일</th>
                      <th class="m_hide">날짜</th>
                      <th class="m_hide">과목</th>
                      <th class="m_hide">수업시작</th>
                      <th class="m_hide">수업끝</th>
                      <th class="m_hide">나갈시간</th>
                      <th class="m_hide">귀원시간</th>
                      <th class="delete">관리</th>
                      <th class="m_show">더보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                  <table class="table_list tableListbot">
                    <colgroup>
                      <col style="width: 50px">
                      <col style="width: 70px" class="numb">
                      <col>
                      <col style="width:85px" class="m_hide">
                      <col style="width:60px " class="m_hide">
                      <col class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="" class="m_hide">
                      <col style="width: 50px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <tbody>
                    <c:forEach items="${historyList}" var="row2" varStatus="status">
                      <tr>
                        <td class="num"><c:out
                            value="${pageInfo.totalHistoryCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out>
                        </td>
                        <td class="num oth_down">
                          <span class="one_fw">${row2.OTHER_REGIST_TYPE eq 'B' ? '임시일정' : '고정예외'}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_DAY}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_DATE}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_SUB}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_START}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_END}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_DEPART eq 'A' ? row2.OTHER_REGIST_OUT : '집'}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_ARRIVE eq 'A' ? row2.OTHER_REGIST_COME : '집'}</span>
                        </td>
                        <td class="delete">
                          <%--<div class="other_btn">
                            <c:if test="${row.EXC_COUNT ne '0'}">
                              <button type="button" class="btn_type01">
                                <span>예외일정</span>
                              </button>
                            </c:if>
                          </div>--%>
                          <div class="action">
                            <button type="button" class="act_btn">
                              <span class="more">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-dots" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                  <circle cx="5" cy="12" r="1"></circle>
                                  <circle cx="12" cy="12" r="1"></circle>
                                  <circle cx="19" cy="12" r="1"></circle>
                                </svg>
                              </span>
                            </button>
                            <div class="action_info">
                              <ul>
                                <li>
                                  <button type="button" class="" onclick="historyDelete('${row2.SEQ}', '${row2.OTHER_REGIST_TYPE}'); return false;">삭제</button>
                                </li>
                                <li>
                                  <c:if test="${row.OTHER_REGIST_TYPE eq 'A'}">
                                    <button type="button" class="" onclick="excPopShow('${row.OTHER_REGIST_DAY}', '${row.OTHER_REGIST_SEQ}', '${row.OTHER_REGIST_SUB}', '${row.OTHER_REGIST_START}', '${row.OTHER_REGIST_END}'); return false;">고정예외</button>
                                  </c:if>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </td>
                        <td class="m_show">
                          <a href="#" class="more">
                          <span class="arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                              <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                          </span>
                          </a>
                        </td>
                      </tr>
                      <tr class="tr_m tr_01"><%-- 모바일 더보기List --%>
                        <td colspan="9">
                          <div class="more_box">
                            <ul>
                              <li>
                                <span class="tit">구분</span>
                                <span>${row2.OTHER_REGIST_TYPE eq 'B' ? '임시일정' : '고정예외'}</span>
                              </li>
                              <li>
                                <span class="tit">요일</span>
                                <span>${row2.OTHER_REGIST_DAY}</span>
                              </li>
                              <li>
                                <span class="tit">날짜</span>
                                <span>${row2.OTHER_REGIST_DATE}</span>
                              </li>
                              <li>
                                <span class="tit">과목</span>
                                <span>${row2.OTHER_REGIST_SUB}</span>
                              </li>
                              <li>
                                <span class="tit">수업시작</span>
                                <span>${row2.OTHER_REGIST_START}</span>
                              </li>
                              <li>
                                <span class="tit">수업끝</span>
                                <span>${row2.OTHER_REGIST_END}</span>
                              </li>
                              <li>
                                <span class="tit">나갈시간</span>
                                <span>${row2.OTHER_REGIST_DEPART eq 'A' ? row2.OTHER_REGIST_OUT : '집'}</span>
                              </li>
                              <li>
                                <span class="tit">귀원시간</span>
                                <span>${row2.OTHER_REGIST_COME eq 'A' ? row2.OTHER_REGIST_COME : '집'}</span>
                              </li>
                            </ul>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
              <%--      <c:forEach items="${historyExcList}" var="row2" varStatus="status">
                      <tr>
                        <td class="num"><c:out
                                  value="${pageInfo.totalHistoryCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index - pageInfo.historyCount}"></c:out>
                        </td>
                        <td class="num oth_down">
                          <span class="one_fw">고정예외</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_EXC_DAY}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_EXC_DATE}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_EXC_SUB}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_EXC_START}</span>
                        </td>
                        <td class="m_hide">
                          <span>${row2.OTHER_REGIST_EXC_END}</span>
                        </td>
                        <td class="m_hide">
                          <span></span>
                        </td>
                        <td class="m_hide">
                          <span></span>
                        </td>
                        <td class="delete">
                          &lt;%&ndash;<div class="other_btn">
                            <c:if test="${row.EXC_COUNT ne '0'}">
                              <button type="button" class="btn_type01">
                                <span>예외일정</span>
                              </button>
                            </c:if>
                          </div>&ndash;%&gt;
                          <div class="action">
                            <button type="button" class="act_btn">
                              <span class="more">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-dots" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                  <circle cx="5" cy="12" r="1"></circle>
                                  <circle cx="12" cy="12" r="1"></circle>
                                  <circle cx="19" cy="12" r="1"></circle>
                                </svg>
                              </span>
                            </button>
                            <div class="action_info">
                              <ul>
                                <li>
                                  <button type="button" class="" onclick="otherRegistDelete('${row.OTHER_REGIST_SEQ}'); return false;">삭제</button>
                                </li>
                                <li>
                                  <c:if test="${row.OTHER_REGIST_TYPE eq 'A'}">
                                    <button type="button" class="" onclick="excPopShow('${row.OTHER_REGIST_DAY}', '${row.OTHER_REGIST_SEQ}', '${row.OTHER_REGIST_SUB}', '${row.OTHER_REGIST_START}', '${row.OTHER_REGIST_END}'); return false;">고정예외</button>
                                  </c:if>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </td>
                        <td class="m_show">
                          <a href="#" class="more">
                          <span class="arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                              <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                          </span>
                          </a>
                        </td>
                      </tr>
                      <tr class="tr_m tr_01">&lt;%&ndash; 모바일 더보기List &ndash;%&gt;
                        <td colspan="9">
                          <div class="more_box">
                            <ul>
                              <li>
                                <span class="tit">구분</span>
                                <span>고정예외</span>
                              </li>
                              <li>
                                <span class="tit">요일</span>
                                <span>${row2.OTHER_REGIST_EXC_DAY}</span>
                              </li>
                              <li>
                                <span class="tit">날짜</span>
                                <span>${row2.OTHER_REGIST_EXC_DATE}</span>
                              </li>
                              <li>
                                <span class="tit">과목</span>
                                <span>${row2.OTHER_REGIST_EXC_SUB}</span>
                              </li>
                              <li>
                                <span class="tit">수업시작</span>
                                <span>${row2.OTHER_REGIST_EXC_START}</span>
                              </li>
                              <li>
                                <span class="tit">수업끝</span>
                                <span>${row2.OTHER_REGIST_EXC_END}</span>
                              </li>
                              <li>
                                <span class="tit">나갈시간</span>
                                <span></span>
                              </li>
                              <li>
                                <span class="tit">귀원시간</span>
                                <span></span>
                              </li>
                            </ul>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>--%>
                    </tbody>
                  </table>
                  <div class="list_control">
                    <div class="paging">
                      <a href="#" class="prev">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-left" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <polyline points="15 6 9 12 15 18"></polyline>
                        </svg>
                      </a>
                      <c:if test="${!empty historyList}">
                        ${dh:pagingA(pageInfo.totalHistoryCount, pageInfo.currentPage, pageInfo.rowsPerPage, 10)}
                      </c:if>
                      <a href="#" class="next">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-right" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <polyline points="9 6 15 12 9 18"></polyline>
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<%-- 타학원시간표등록 --%>
<div class="pop_cont otherSch" id="pop_regist">
  <div class="pop_bg"></div>
  <div class="pop_form">
    <div class="pop_box">
      <div class="pop_top">
        <div class="pop_tit">
          <span>타학원시간표 등록</span>
        </div>
        <div class="pop_close">
          <a href="#" onclick="popHide('A'); return false;">
            <img src="/resources/main/user/img/icon/navClose.png" alt="">
          </a>
        </div>
      </div>
      <div class="pop_bot">
        <div class="login_wrap">
          <form id="form_otherRegist" name="formOtherRegist">
            <div class="join_field">
              <div class="cont_input">
                <label for="">구분</label>
                <div class="chktab06 chktab05 chktab chkbox">
                  <ul class="clearfix">
                    <li data-id="date01">
                      <label class="" for="phoneT"><input id="phoneT" name="OTHER_REGIST_TYPE" type="radio" value="A" checked="checked" >
                        <span>고정일정</span>
                      </label>
                    </li>
                    <li data-id="date02">
                      <label class="" for="phoneT2"><input id="phoneT2" name="OTHER_REGIST_TYPE" type="radio" value="B">
                        <span>임시일정</span>
                      </label>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="date_on cont_input on" id="date01">
                <label for="">요일</label>
                <div class="chkbox">
                  <div class="srch_box">
                    <select id="otherRegistDay" name="OTHER_REGIST_DAY" onchange="">
                      <option value="" selected="">선택</option>
                      <option value="월">월</option>
                      <option value="화">화</option>
                      <option value="수">수</option>
                      <option value="목">목</option>
                      <option value="금">금</option>
                      <option value="토">토</option>
                      <option value="일">일</option>
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
              <div class="date_on cont_input" id="date02">
                <label for="">날짜</label>
                <div class="chkbox">
                  <label class="" for="">
                    <input id="otherRegist_date" class="datepicker" name="OTHER_REGIST_DATE" type="text" autocomplete="off">
                    <button type="button" class="datepickerImg">
                      <img src="/resources/main/user/img/icon/datapicker.png" alt="">
                    </button>
                  </label>
                </div>
              </div>
              <div class="cont_input">
                <label for="">과목</label>
                <div class="chkbox">
                  <div class="srch_box">
                    <select id="otherRegistSub" name="OTHER_REGIST_SUB" onchange="">
                      <option value="" selected="">선택</option>
                      <option value="수학">수학</option>
                      <option value="국어">국어</option>
                      <option value="영어">영어</option>
                      <option value="탐구">탐구</option>
                      <option value="기타">기타</option>
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
              <div class="cont_input">
                <label for="">수업시작</label>
                <div class="chkbox">
                  <label class="" for="">
                    <input id="timepicker1" type="text" name="OTHER_REGIST_START" placeholder="- 시간선택 -">
                  </label>
                </div>
              </div>
              <div class="cont_input">
                <label for="">수업끝</label>
                <div class="chkbox">
                  <label class="" for="">
                    <input id="timepicker2" type="text" name="OTHER_REGIST_END" placeholder="- 시간선택 -">
                  </label>
                </div>
              </div>
              <div class="cont_input">
                <label for="">나갈시간</label>
                <div class="clockTab chktab05 chktab chkbox">
                  <ul class="clearfix">
                    <li data-id="clock01">
                      <label class="" for="other_regist_depart_a"><input id="other_regist_depart_a" name="OTHER_REGIST_DEPART" type="radio" value="A" class="focus" checked>
                        <span>학원</span>
                      </label>
                    </li>
                    <li>
                      <label class="" for="other_regist_depart_b"><input id="other_regist_depart_b" name="OTHER_REGIST_DEPART" type="radio" value="B" class="focus">
                        <span>집</span>
                      </label>
                    </li>
                  </ul>
                </div>
                <div class="clockCon chkbox on" id="clock01">
                  <label class="" for="">
                    <input id="timepicker3" type="text" name="OTHER_REGIST_OUT" placeholder="- 시간선택 -">
                  </label>
                </div>
              </div>
              <div class="cont_input">
                <label for="">귀원시간</label>
                <div class="clockTab02 chktab05 chktab chkbox">
                  <ul class="clearfix">
                    <li data-id="clock02">
                      <label class="" for="other_regist_arrive_a"><input id="other_regist_arrive_a" name="OTHER_REGIST_ARRIVE" type="radio" value="A" class="focus" checked>
                        <span>학원</span>
                      </label>
                    </li>
                    <li>
                      <label class="" for="other_regist_arrive_b"><input id="other_regist_arrive_b" name="OTHER_REGIST_ARRIVE" type="radio" value="B" class="focus">
                        <span>집</span>
                      </label>
                    </li>
                  </ul>
                </div>
                <div class="clockCon02 chkbox on" id="clock02">
                  <label class="" for="">
                    <input id="timepicker4" type="text" name="OTHER_REGIST_COME" placeholder="- 시간선택 -">
                  </label>
                </div>
              </div>
            </div>
          </form>
          <div class="record_btn">
            <button type="button" class="btn_type01" onclick="otherRegist(); return false;">
              <span>등록</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%-- 고정예외일정 등록 --%>
<div id="pop_exc" class="pop_cont otherSch otherSchExc">
  <div class="pop_bg"></div>
  <div class="pop_form">
    <div class="pop_box">
      <div class="pop_top">
        <div class="pop_tit">
          <span>고정예외일정 등록</span>
        </div>
        <div class="register_close">
          <a href="#" onclick="popHide('B');"></a>
        </div>
      </div>
      <div class="pop_bot">
        <div class="login_wrap">
          <form id="form_otherRegistExc" name="formOtherRegistExc">
            <input type="hidden" name="OTHER_REGIST_SEQ" id="pop_otherRegist_seq">
            <input type="hidden" name="OTHER_REGIST_EXC_SUB" id="pop_otherRegist_sub">
            <input type="hidden" name="OTHER_REGIST_EXC_START" id="pop_otherRegist_start">
            <input type="hidden" name="OTHER_REGIST_EXC_END" id="pop_otherRegist_end">
            <input type="hidden" name="OTHER_REGIST_EXC_DAY" id="pop_otherRegist_day">
            <input type="hidden" name="OTHER_REGIST_EXC_OUT" id="pop_otherRegist_out">
            <input type="hidden" name="OTHER_REGIST_EXC_COME" id="pop_otherRegist_come">
            <div class="join_field">
              <div class="cont_input">
                <label for="">날짜</label>
                <div class="chktab05 chktab chkbox chktext01">
                </div>
              </div>
              <div class="cont_input">
                <label for="">사유</label>
                <div class="chkbox chktext02">
                  <label class="" for=""><input id="other_regist_exc_des" name="OTHER_REGIST_EXC_DES" type="text" value="" placeholder="사유를 입력하세요." onclick="" maxlength="50"></label>
                </div>
              </div>
            </div>
          </form>
          <div class="record_btn">
            <button type="button" class="btn_type01" onclick="otherRegistExcRegist(); return false;">
              <span>등록</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>
    $(function (){
        $('.datepicker').datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        })
    });

    $("#otherRegist_date").change(function () {
        let today = new Date();
        let yoil = ['일', '월', '화', '수', '목', '금', '토'];
        let date = document.querySelector("#otherRegist_date").value;
        let select_date = new Date(date);
        if(select_date <= today) {
            alert("임시일정은 당일 하루 전까지 등록 가능합니다.");
            document.querySelector("#otherRegist_date").value = "";
            return false;
        } else {
            let day = select_date.getDay();
            let select_yoil = yoil[day];
            $("#otherRegistDay").val(select_yoil).attr("selected", true);
        }
    });

    $("input[id^='timepicker']").each(function() {
        var _this = this.id;
        $('#'+_this).timepicki({

        });

    });

    function historyDelete(seq, type) {
      if(type != '' && type != null && type == 'B') {
        otherRegistDelete(seq);

      } else {
        otherRegistExcDelete(seq);
      }
    }

    function otherRegistExcShow(el,seq) {
        if( $("tr[name='other_list"+seq).hasClass("on")) {
            $("tr[name='other_list"+seq).removeClass("on");
            $(el).parents('.oth_down').removeClass('view');
        } else {
            $("tr[name='other_list"+seq).addClass("on");
            $(el).parents('.oth_down').addClass('view');
        }
    }

    function popShow(ob) {
        $("#pop_regist").addClass("view");
    }

    function popHide(ob) {
        if(ob == "A") {
            document.forms['formOtherRegist'].reset();
            $("#pop_regist").removeClass("view");
        }
        if(ob == "B") {
            $("#pop_exc").removeClass("view");
        }
    }

    function otherRegistCheck() {

        if($("#phoneT").prop("checked")) {
            if($("#otherRegistDay").val() == null || $("#otherRegistDay").val() == "") {
                alert("요일을 선택해 주세요");
                return false;
            }
        }

        if($("#phoneT2").prop("checked")) {
            if($("#otherRegist_date").val() == null || $("#otherRegist_date").val() == "") {
                alert("날짜를 선택해 주세요.");
                return false;
            }
        }

        if($("#otherRegistSub").val() == null || $("#otherRegistSub").val() == "") {
            alert("과목을 선택해 주세요.");
            return false;
        }

        if($("#timepicker1").val() == null || $("#timepicker1").val() == "") {
            alert("수업시작 시간을 선택해 주세요.");
            return false;
        }

        if($("#timepicker2").val() == null || $("#timepicker2").val() == "") {
            alert("수업끝 시간을 선택해 주세요.");
            return false;
        }

        if($("#other_regist_arrive_a").prop('checked')) {
          if($("#timepicker4").val() == null || $("#timepicker4").val() == "") {
            alert("귀원시간을 선택해 주세요.");
            return false;
          }
        }


      if($("#other_regist_depart_a").prop('checked')) {
        if($("#timepicker3").val() == null || $("#timepicker3").val() == "") {
          alert("나갈시간을 선택해 주세요.");
          return false;
        }
      }
        return true;
    }

    function otherRegist() {
        if(otherRegistCheck()) {
            if(confirm("저장하시겠습니까?")) {
                let params = $("form[name=formOtherRegist]").serialize();
                $.ajax({
                    type: "post",
                    url: "/user/setting/otherRegistInsert.do",
                    data: params,
                    success: function (data) {
                        if (data.success) {
                            Alert.ok();
                            location.href = "/user/setting/otherRegistList.do";
                        } else {
                            Alert.err();
                        }
                    }
                });
            }
        }
    }

    function otherRegistDelete(SEQ) {
        if(confirm("삭제하시겠습니까?")) {
            $.ajax({
                type: "post",
                url: "/user/setting/otherRegistDelete.do",
                data: "OTHER_REGIST_SEQ="+SEQ,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/user/setting/otherRegistList.do";
                    } else {
                        Alert.err();
                    }
                }
            });
        }
    }

    function excPopShow(DAY, SEQ, SUB, START, END, OUT, COME) {
        $("#pop_otherRegist_seq").val(SEQ);
        $("#pop_otherRegist_sub").val(SUB);
        $("#pop_otherRegist_start").val(START);
        $("#pop_otherRegist_end").val(END);
        $("#pop_otherRegist_day").val(DAY);
        $("#pop_otherRegist_out").val(OUT);
        $("#pop_otherRegist_come").val(COME);
        let yoil = ['일', '월', '화', '수', '목', '금', '토'];
        let dayIndex = yoil.indexOf(DAY);
        let today = new Date();
        let afterOneWeek ="";
        let afterTwoWeek ="";
        const returnDate = getDate(dayIndex);
        let afterOneWeekDate = new Date(returnDate);
        let afterTwoWeekDate = new Date(returnDate);
        let text = "";
        if(returnDate > today) {
            afterTwoWeekDate = new Date(afterTwoWeekDate.setDate(afterTwoWeekDate.getDate() + 7));
            afterOneWeek = afterOneWeekDate.getFullYear() + "-" + ("0" + (1 + afterOneWeekDate.getMonth())).slice(-2) + "-" +("0" + afterOneWeekDate.getDate()).slice(-2);
            afterTwoWeek = afterTwoWeekDate.getFullYear() + "-" + ("0" + (1 + afterTwoWeekDate.getMonth())).slice(-2) + "-" +("0" + afterTwoWeekDate.getDate()).slice(-2);
        } else {
            afterOneWeekDate = new Date(afterOneWeekDate.setDate(afterOneWeekDate.getDate() + 7));
            afterTwoWeekDate = new Date(afterTwoWeekDate.setDate(afterTwoWeekDate.getDate() + 14));
            afterOneWeek = afterOneWeekDate.getFullYear() + "-" + ("0" + (1 + afterOneWeekDate.getMonth())).slice(-2) + "-" +("0" + afterOneWeekDate.getDate()).slice(-2);
            afterTwoWeek = afterTwoWeekDate.getFullYear() + "-" + ("0" + (1 + afterTwoWeekDate.getMonth())).slice(-2) + "-" +("0" + afterTwoWeekDate.getDate()).slice(-2);
        }

        text += "<ul class='clearfix'>";
        text += "<li>";
        text += "<label class='' for='pop'><input id='pop' name='OTHER_REGIST_EXC_DATE' type='checkbox' value="+afterOneWeek+">";
        text += "<span>";
        text += afterOneWeek;
        text += "</span>";
        text += "</label>";
        text += "</li>";
        text += "<li>";
        text += "<label class='' for='pop02'><input id='pop02' name='OTHER_REGIST_EXC_DATE' type='checkbox' value="+afterTwoWeek+">";
        text += "<span>";
        text += afterTwoWeek;
        text += "</span>";
        text += "</label>";
        text += "</li>";
        text += "</ul>";
        $("#pop_exc .chktext01").html(text);
        $("#pop_exc").addClass("view");
    }

    function getDate(DAY) {
        let today = new Date();
        let day = today.getDay();
        let diff = today.getDate() - day + (day == 0 ? -6 : DAY);
        return new Date(today.setDate(diff));
    }

    function checkBox() {
        let chkbox = document.getElementsByName('OTHER_REGIST_EXC_DATE');
        for(let i=0; i < chkbox.length; i++) {
            if(chkbox[i].checked) {
                return true;
            }
        }
        return false;
    }

    function otherRegistExcRegistCheck() {
        let other_regist_exc_des = document.querySelector("#other_regist_exc_des").value;
        if(other_regist_exc_des == null || other_regist_exc_des == "") {
            return false;
        }
        return true;
    }

    function otherRegistExcRegist() {

        if(!checkBox()) {
            alert("고정예외 날짜를 선택해 주세요.");
            return false;
        }

        if(!otherRegistExcRegistCheck()) {
            alert("사유를 입력해 주세요.");
            return false;
        }

        let params = $("form[name=formOtherRegistExc]").serialize();
        if(confirm("고정일정 예외를 등록하시겠습니까?")) {
            $.ajax({
                type: "post",
                url: "/user/setting/otherRegistExcInsert.do",
                data: params,
                success: function (data) {
                    if (data.success) {
                        Alert.ok();
                        location.href = "/user/setting/otherRegistList.do";
                    } else {
                      location.reload();
                    }
                }
            });
        }
    }

    function otherRegistExcDelete(SEQ) {
        if(confirm("고정일정 예외를 삭제하시겠습니까?")) {
            $.ajax({
                type: "post",
                url: "/user/setting/otherRegistExcDelete.do",
                data: "OTHER_REGIST_EXC_SEQ="+SEQ,
                success: function (data) {
                    if (data.success) {
                        location.href = "/user/setting/otherRegistList.do";
                    } else {
                        location.reload();
                    }
                }
            });
        }
    }
</script>


