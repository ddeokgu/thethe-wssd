<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-01-26
  Time: 오전 10:34
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
              <div class="cont_tit"><span>등록·연장관리</span></div>
              <div class="login_field join_field">
                <div class="table_form">
                  <table class="table_list tableListop">
                    <colgroup>
                      <col style="width: 50px" class="numb">
                      <col>
                      <col class="m_hide">
                      <col style="width: 96px" class="m_hide">
                      <col class="m_hide">
                      <%--<col style="width: 100px" class="m_hide">--%>
                      <col style="width: 75px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <thead>
                    <tr>
                      <th class="numb">#</th>
                      <th class="left">이름/구분</th>
                      <th class="left m_hide">지점명/호실명</th>
                      <th class="m_hide">등원기간</th>
                      <th class="m_hide">연락처</th>
                      <%--<th class="m_hide">
                        <span class="block">핸드폰</span>
                        <span class="block">소지여부</span>
                      </th>--%>
                      <%--<th class="m_hide">시험일</th>--%>
                      <th class="m_hide">관리</th>
                      <th class="m_show">더보기</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                  </table>
                  <table class="table_list tableListbot">
                    <colgroup>
                      <col style="width: 50px" class="numb">
                      <col>
                      <col class="m_hide">
                      <col style="width: 96px" class="m_hide">
                      <col class="m_hide">
<%--                      <col style="width: 100px" class="m_hide">--%>
                      <col style="width: 75px" class="m_hide">
                      <col class="m_show">
                    </colgroup>
                    <tbody>
                    <c:forEach items="${list}" var = "row" varStatus="status">
                    <tr>
                      <input type="hidden" value="${row.REGIST_CHANNEL}">
                      <input type="hidden" value="${row.CHANNEL_NAME}">
                      <td class="num"><c:out
                              value="${pageInfo.totalCount - ((pageInfo.currentPage - 1) * pageInfo.rowsPerPage ) - status.index}"></c:out>
                      </td>
                      <td class="left">
                        <span class="one_fw"><c:out value="${row.REGIST_MU_NAME}"></c:out></span>
                        <span>
                          <c:choose>
                            <c:when test="${row.SCHOOL_NAME ne null}">
                              <c:out value="${row.SCHOOL_NAME}"></c:out>
                            </c:when>
                            <c:otherwise>
                              <c:out value="${row.FEE_NAME}"></c:out>
                            </c:otherwise>
                          </c:choose>
                        </span>
                      </td>
                      <%--<td class="m_hide"><c:out value="${row.REGIST_FIRST_DATE}"></c:out></td></td>--%>
                      <td class="left m_hide">
                        <span><c:out value="${row.CHANNEL_NAME}"></c:out></span> <%-- 지점명 --%>
                        <span><c:out value="${row.ROOM_NAME}"></c:out><i class="one_fw"> - <c:out value="${row.SEAT_NAME}"></c:out>좌석</i></span>  <%-- 호실명 --%>
                      </td>
                      <td class="m_hide">
                        <span><c:out value="${row.REGIST_START_DATE}"></c:out></span>
                        <span>~ <c:out value="${row.REGIST_END_DATE}"></c:out></span>
                      </td>
                      <td class="m_hide">
                        <span><c:out value="${row.REGIST_PARENT_PHONE}"></c:out><c:out value="(${row.REGIST_PHONE_TYPE})"></c:out></span>
                      </td>
<%--                      <td class="m_hide"><c:out value="${row.REGIST_TEST_FIRST}"></c:out></td>--%>
                      <td class="m_hide">
                        <button type="button" class="btn_type02" onclick="registExtend('${row.REGIST_SEQ}'); return false;">
                          <span>연장</span>
                        </button>
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
                      <%-- 좌석선택:버튼클릭 > 레이어팝업 --%>
                    </tr>
                    <tr class="tr_re tr_m">
                      <td colspan="9">
                        <div class="more_box">
                          <ul>
                          <%--  <li>
                              <span class="tit">첫 등원일</span>
                              <span><c:out value="${row.REGIST_FIRST_DATE}"></c:out></span>
                            </li>--%>
                            <%--<li>
                              <span class="tit">구분</span>
                              <span><c:out value="${row.FEE_NAME}"></c:out></span>
                            </li>--%>
                            <li>
                              <span class="tit">지점명/호실명</span>
                              <span><c:out value="${row.CHANNEL_NAME}"></c:out></span>
                              <span><c:out value="${row.ROOM_NAME}"></c:out> <i class="one_fw"> - <c:out value="${row.SEAT_NAME}"></c:out>좌석</i></span>
                            </li>
                            <li>
                              <span class="tit">등원기간</span>
                              <span><c:out value="${row.REGIST_START_DATE}"></c:out> ~ <c:out value="${row.REGIST_END_DATE}"></c:out></span>
                            </li>
                            <li>
                              <span class="tit">연락처</span>
                              <span><c:out value="${row.REGIST_PARENT_PHONE}"></c:out><c:out value="(${row.REGIST_PHONE_TYPE})"></c:out></span>
                            </li>
                            <li>
                              <span class="tit">시험일</span>
                              <span><c:out value="${row.REGIST_TEST_FIRST}"></c:out></span>
                            </li>
                            <li>
                              <span class="tit">관리</span>
                              <span>
                                <%--<button type="button" class="add btn_type02" onclick="room_list('${row.REGIST_CHANNEL}'); return false;">
                                  <span>좌석</span>
                                </button>--%>
                                <button type="button" class="btn_type02">
                                 <span>연장</span>
                                </button>
                              </span>
                            </li>
                          </ul>
                        </div>
                      </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div class="record_btn">
                  <a href="/user/setting/register.do" class="btn_type01" >
                    <span>등록신청서</span>
                  </a>
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
    $.datepicker.setDefaults({
        /*showOn:"button",
        buttonImage:"/resources/main/user/img/icon/datapicker.png",
        buttonImageOnly:true,*/
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
    });

    $(function(){
        $('.datepicker').datepicker();
    });

    function registExtend(SEQ) {
        location.href = "/user/setting/register.do?REGIST_SEQ="+SEQ;
    }

</script>

