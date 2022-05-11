<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-03-04
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dh" uri="/WEB-INF/tlds/dh-taglibs.tld" %>
<c:set var="baseURL" value="${pageContext.request.serverName}"/>
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
          <div class="view_right view_profile">
            <div class="login_wrap">
              <div class="cont_tit"><span>등록신청서</span></div>
              <div class="login_field join_field">
                <div class="pop_form">
                  <div class="pop_box">
                    <div class="pop_bot">
                      <div class="login_wrap">
                        <form id="form_regist" name="formRegist" method="post" action="/" enctype="multipart/form-data">
                          <div class="join_field register">
                            <div class="cont_input">
                              <label for="">지점명</label>
                              <input type="hidden" id="regist_room" name="REGIST_ROOM" value="${resultMap.REGIST_ROOM}">
                              <input type="hidden" name="REGIST_MU_TYPE" value="Y">
                              <input type="hidden" id="student_check" name="STUDENT_CHECK" value="">
                              <input type="hidden" id="MU_GENDER" value="${pageInfo.MU_GENDER}">
                              <input type="hidden" id="regist_first_date" name="REGIST_FIRST_DATE" value="${pageInfo.MU_REGIST_DATE}">
                              <input type="hidden" id="pay_type" name="PAY_TYPE" value="기간권">
                              <input type="hidden" id="regist_pay_type" name="REGIST_PAY_TYPE" value="">
                              <input type="hidden" id="pay_price" name="PAY_PRICE" value="">
                              <input type="hidden" id="pay_code" name="PAY_CODE" value="">
                              <div class="chkbox">
                                <div class="srch_box">
                                  <select id="regist_channel" name="REGIST_CHANNEL" onchange="feeList(); return false;">
                                    <option value="" selected="">선택</option>
                                    <c:forEach items="${channelList}" var="row2">
                                      <c:if test="${row2.USE_YN eq 'Y'}">
                                        <option value="${row2.CHANNEL_CODE}" ${resultMap.REGIST_CHANNEL eq row2.CHANNEL_CODE ? 'selected' : ''}>${row2.CHANNEL_NAME}</option>
                                      </c:if>
                                    </c:forEach>
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
                            <%-- 연장시 --%>
                            <%--<div class="cont_input">
                              <label for="">첫 등원일</label>
                              &lt;%&ndash;<input name="MU_NAME" id="inputName" type="text" value="" placeholder="첫 등원일을 입력해주세요">&ndash;%&gt;
                              <span id="span_date" class="chk_first"></span>
                              <input type="hidden" id="regist_first_date" name="REGIST_FIRST_DATE" value="">

                              &lt;%&ndash;  <span class="chk_first">${pageInfo.MU_REGIST_DATE}</span>&ndash;%&gt;
                            </div>--%>
                            <div class="cont_input">
                              <label for="">이름</label>
                              <input name="REGIST_MU_NAME" type="text" value="${pageInfo.MU_NAME}" readonly>
                              <span class="chk_error"></span>
                            </div>
                            <div class="cont_input">
                              <label for="">구분</label>
                              <div class="chktab04 chktab chkbox">
                                <ul class="clearfix">

                                </ul>
                              </div>
                              <div class="chktabCon04 chktabCon chktab">
                                <ul class="clearfix">
                                  <li id="cont1" class="conBox" onclick="joinTab04();">
                                    <div class="chkbox">
                                      <span>학교</span>
                                      <div class="srch_box">
                                        <select id="school_list" name="REGIST_MU_SCHOOL" onchange="changeSchool(); return false;">
                                          <option value="" selected="">선택</option>
                                          <c:forEach items="${schoolList}" var="row2">
                                            <option value="${row2.SCHOOL_CODE}">${row2.SCHOOL_NAME}</option>
                                          </c:forEach>
                                        </select>
                                        <span class="srch_box_arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                              <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                          </span>
                                      </div>
                                    </div>
                                    <div class="chkbox">
                                      <span>학년</span>
                                      <div class="srch_box">
                                        <select id="regist_grade" name="REGIST_MU_GRADE">
                                          <option value="" selected="">선택</option>
                                          <option value="1">1학년</option>
                                          <option value="2">2학년</option>
                                          <option value="3">3학년</option>
                                        </select>
                                        <span class="srch_box_arrow">
                                  <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                  </svg>
                                </span>
                                      </div>
                                    </div>
                                  </li>
                                  <li id="cont2" class="conBox" onclick="joinTab04();">
                                    <div class="chkbox">
                                      <span>시험종류</span>
                                      <div class="srch_box">
                                        <select id="select_regist_exam" name="REGIST_EXAM">
                                          <option value="" selected="selected">선택</option>
                                          <c:forEach items="${testList}" var="row3">
                                            <option value="${row3.TEST_CODE}" ${resultMap.REGIST_EXAM eq row3.TEST_CODE ? 'selected':''}>${row3.TEST_NAME}</option>
                                          </c:forEach>
                                        </select>
                                        <span class="srch_box_arrow">
                                  <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                  </svg>
                                </span>
                                      </div>
                                      <div class="chkbox on_none">
                                        <span>기타</span>
                                        <label class="" for=""><input id="regist_exam_des" name="REGIST_EXAM_DES" type="text"></label>
                                      </div>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="cont_input cont_datePlus">
                              <label for="">등원기간</label>
                              <div class="chkbox datechk">
                                <label class="" for="">
                                  <input id="date_start" class="datepicker" name="REGIST_START_DATE" type="text" autocomplete="off" readonly>
                                  <button type="button" class="datepickerImg">
                                    <img src="/resources/main/user/img/icon/datapicker.png" alt="">
                                  </button>
                                </label>
                                <span class="pad">-</span>
                                <label class="" for="">
                                  <input id="date_end" class="datepicker" name="REGIST_END_DATE" type="text" autocomplete="off" readonly>
                                  <button type="button" class="datepickerImg">
                                    <img src="/resources/main/user/img/icon/datapicker.png" alt="">
                                  </button>
                                </label>
                                <span class="date_text">*기본 등원기간은 30일 입니다.</span>
                              </div>
                            </div>
                            <div class="cont_input">
                              <label for="">연락처 <%--<i>*부/모 한 명 필수 입력</i>--%></label>
                              <%--<div class="chktab chkbox lastchk">
                                <ul class="clearfix">
                                  <li>
                                    <span>부</span>
                                    <label class="" for=""><input id="parent_phone_f" name="REGIST_PARENT_PHONE" type="text" value="" placeholder="" onclick="" ></label>
                                  </li>
                                  <li>
                                    <span>모</span>
                                    <label class="" for=""><input id="parent_phone_m" name="REGIST_PARENT_PHONE" type="text" value="" placeholder="" onclick="" ></label>
                                  </li>
                                </ul>
                              </div>--%>

                              <div class="chktab05 chktab chkbox">
                                <ul class="clearfix">
                                  <li data-id="phon1" class="on">
                                    <label class="" for="phoneT"><input id="phoneT" name="REGIST_PHONE_TYPE" type="radio" value="부" placeholder="" onclick="" ${resultMap.REGIST_PHONE_TYPE eq '부' ? 'checked' : ''}>
                                      <span>부</span>
                                    </label>
                                  </li>
                                  <li data-id="phon2">
                                    <label class="" for="phoneT2"><input id="phoneT2" name="REGIST_PHONE_TYPE" type="radio" value="모" placeholder="" onclick="" ${resultMap.REGIST_PHONE_TYPE eq '모' ? 'checked' : ''}>
                                      <span>모</span>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                              <div class="chktabCon05 chktabCon chktab">
                                <ul class="clearfix">
                                  <li id="phon1" class="conBox on">
                                    <div class="chkbox">
                                      <label class="" for=""><input id="parent_phone" name="REGIST_PARENT_PHONE" type="text" value="${resultMap.REGIST_PARENT_PHONE}" placeholder="-없이 숫자만 입력해 주세요." onclick="" ></label>
                                    </div>
                                  </li>
                                  <%--  <li id="phon2" class="conBox">
                                      <div class="chkbox">
                                        <label class="" for=""><input id="parent_phone_m" name="REGIST_PARENT_PHONE" type="text" value="" placeholder="" onclick="" ></label>
                                      </div>
                                    </li>--%>
                                </ul>
                              </div>
                            </div>
                            <%--<div class="cont_input">
                              <label for="">핸드폰 소지여부</label>
                              <div class="chktab chkbox">
                                <ul class="clearfix">
                                  <li>
                                    <label class="" for=""><input id="" name="phone" type="radio" value="" onclick="">예</label>
                                  </li>
                                  <li>
                                    <label class="" for=""><input id="" name="phone" type="radio" value="" onclick="">아니오</label>
                                  </li>
                                </ul>
                              </div>
                            </div>--%>
                            <div class="cont_input afterN">
                              <label for="">시험일</label>
                              <div class="chktab chkbox lastchk">
                                <ul class="clearfix">
                                  <li>
                                    <span>1차</span>
                                    <label class="" for="">
                                      <input id="regist_test_first" class="datepicker" name="REGIST_TEST_FIRST" type="text" autocomplete="off" readonly value="${resultMap.REIGST_TEST_FIRST}">
                                      <button type="button" class="datepickerImg">
                                        <img src="/resources/main/user/img/icon/datapicker.png" alt="">
                                      </button>
                                    </label>
                                  </li>
                                  <li>
                                    <span>2차</span>
                                    <label class="" for="">
                                      <input id="regist_test_second" class="datepicker" name="REGIST_TEST_SECOND" type="text" autocomplete="off" readonly value="${resultMap.REIGST_TEST_SECOND}">
                                      <button type="button" class="datepickerImg">
                                        <img src="/resources/main/user/img/icon/datapicker.png" alt="">
                                      </button>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="cont_input">
                              <label for="">좌석</label>
                              <div class="chkbox">
                                <div class="seat_num">
                                  <input type="text" id="regist_seat_front" readonly value="${resultMap.SEAT_NAME}">
                                  <input type="hidden" id="regist_seat" name = "REGIST_SEAT" value="${resultMap.REGIST_SEAT}">
                                  <span>번</span>
                                </div>
                                <button type="button" class="btn_type02" onclick="room_list(); return false;">
                                  <span>좌석선택</span>
                                </button>
                              </div>
                              <div class="refund refund_seat">
                                <div class="re_01">
                                  <span class="re_tit">학원 금액안내</span>
                                  <div id="div_pay" class="re_text">

                                  </div>
                                </div>

                              </div>
                            </div>
                            <div class="cont_input">
                              <label for="">환불규정</label>
                              <div class="refund">
                                <div class="re_01">
                                  <span class="re_tit">학원 환불규정</span>
                                  <div class="re_text">
                                    <span>등록 후 10일 이내 : 10일치 제하고 환불</span>
                                    <span>등록 후 15일 이내 : 15일치 제하고 환불</span>
                                    <span>등록 후 16일부터 : 환불 불가</span>
                                  </div>
                                </div>
                                <div class="re_01">
                                  <span class="re_tit">독서실/스터디카페 환불규정</span>
                                  <div class="re_text">
                                    <div class="fw">
                                      <span>일일권</span>
                                      <span>- 종일 : 23,000원(방학, 공휴일, 토·일요일)</span>
                                      <span>- 반일(오후 4시 이후) : 15,000원</span>
                                    </div>
                                    <div class="fw">
                                      <span>말일까지 등록할 때 (중간환불이 없을 때)</span>
                                      <span>- 종일 : 15,333원 / 한달 기준 46만원</span>
                                      <span>- 반일 : 10,000원 / 한달 기준 30만원(오후3시부터)</span>
                                    </div>
                                  </div>
                                </div>
                                <div class="re_02">
                                  <p>* 교육청 환불규정에 따라 월 중에 환불을 원할 때는 일일기준으로 계산하여 차액을 환불합니다.</p>
                                  <p>* 나중에 혼동을 피하기 위해 충분히 숙지한 후 등록하기 바랍니다.</p>
                                  <div class="refund_chk">
                                    <div class="chktab chkbox">
                                      <ul class="clearfix">
                                        <span>등록구분</span>
                                        <li class="f_w">
                                          <label class="" for="record_1"><input id="record_1" name="REGIST_TYPE" type="radio" value="A" onclick="" class="">
                                            <span>학원</span>
                                          </label>
                                        </li>
                                        <li>
                                          <label class="" for="record_2"><input id="record_2" name="REGIST_TYPE" type="radio" value="B" onclick="" class="">
                                            <span>독서실</span>
                                          </label>
                                        </li>
                                      </ul>
                                    </div>
                                    <div class="chktab chkbox">
                                      <ul class="clearfix">
                                        <span>환불규정에</span>
                                        <li class="f_w">
                                          <label class="" for="agree_1"><input id="agree_1" name="radioAgree" type="radio" value="Y" onclick="" class="">
                                            <span>동의함</span>
                                          </label>
                                        </li>
                                        <li>
                                          <label class="" for="agree_2"><input id="agree_2" name="radioAgree" type="radio" value="N" onclick="" class="">
                                            <span>동의하지 않음</span>
                                          </label>
                                        </li>
                                      </ul>
                                    </div>
                                    <div class="chktab chkbox">
                                      <ul class="clearfix">
                                        <span>결제방법</span>
                                        <li class="f_w">
                                          <label class="" for="payType_1"><input id="payType_1" name="PAY_METHOD" type="radio" value="CARD" onclick="" class="">
                                            <span>카드</span>
                                          </label>
                                        </li>
                                        <li>
                                          <label class="" for="payType_2"><input id="payType_2" name="PAY_METHOD" type="radio" value="BANK" onclick="" class="">
                                            <span>계좌이체</span>
                                          </label>
                                        </li>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </form>
                        <div class="record_btn">
                          <button type="button" class="btn_type01" onclick="innopayCheck(); return false;">
                            <span>등록</span>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%-- 좌석팝업 --%>
        <div class="add_modal typeScroll" id="seat_modal">
          <div class="modal_bg" ></div>
          <div class="modal_form modal_form_wide">
            <div class="modal_cont">
              <div class="modal_tit">
                <div class="tit">
                  <span>좌석선택</span>
                </div>
                <div class="srch_box">
                  <select id="room_list" name="ROOM_LIST" onchange="room_select(); return false;">
                  </select>
                  <span class="srch_box_arrow">
                       <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-chevron-down" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                         <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                         <polyline points="6 9 12 15 18 9"></polyline>
                       </svg>
                     </span>
                  <input type="hidden" id="selected_room" value="">
                </div>
                <div class="close">
                  <a href="#" onclick="seat_close();return false;">
                    <img src="/resources/main/user/img/icon/navClose.png" alt="">
                  </a>
                </div>
              </div>
              <div class="modal_body modal_address">
                <form id="" name="formSeat" method="post" action="/">
                  <input type ="hidden" id="modal_start_date" name="START_DATE" value="">
                  <input type ="hidden" id="modal_end_date" name="END_DATE" value="">
                  <input type ="hidden" id="modal_room_name" name="ROOM_NAME" value="">
                  <div class="modal_get modal_get_wide">
                    <%--  <div class="dan danAuto dan_r">
                        <div class="datePicker">
                          <input type="text"  id="datepicker_seat" class="picker_form" readonly>
                          <button type="button" class="ui-datepicker-trigger">
                            <img src="/resources/main/user/img/icon/datapicker.png" alt="달력" title="달력">
                          </button>
                        </div>
                      </div> --%>
                    <div class="dan danAuto dan_l dan_r dan_mra m_dan_fix">
                      <div class="label_color">
                        <ul>
                          <%--<li><span class="color color_on"></span><span class="text">사용가능</span></li>--%>
                          <li><span class="color color_off"></span><span class="text">사용불가</span></li>
                          <li><span class="color color_ing"></span><span class="text">사용중</span></li>
                          <li><span class="color color_g"></span><span class="text">여학생</span></li>
                          <li><span class="color color_b"></span><span class="text">남학생</span></li>
                        </ul>
                      </div>
                    </div>
                    <%--<div class="dan danAuto dan_l">
                      <div class="seat_add">
                        <button type="button" class="btn btn_center" onclick="seatRegistOne(); return false;"><span>좌석선택</span></button>
                      </div>
                    </div>--%> <%-- 좌석선택버튼--%>
                    <div class="seat_scroll">
                      <div id="defaultPopBot" class="pop_bot pop_bot02 default" >
                      </div>  <%-- 배치도x 기본 --%>
                      <jsp:include page="/WEB-INF/views/pages/main/user/seat/sinmok.jsp"/>
                      <jsp:include page="/WEB-INF/views/pages/main/user/seat/omok.jsp"/>
                    </div>
                  </div>
                  <%--  <div class="modal_btn">
                      <button type="button" class="btn mr btn_big" onclick="seat_close();return false;">
                        <span>취소</span></button>
                      <button type="button" class="btn btn_01 btn_big"><span>저장</span></button>
                    </div>--%>
                </form>

                <form id="SendPayForm_id" name="frmINNOPAY" method="post">
                  <input type="hidden" name="PayMethod" value=""> <%-- 여기부터 필수 파라미터--%>
                  <input type="hidden" name="MID" value="">
                  <input type="hidden" name="MerchantKey" value="">
                  <input type="hidden" name="GoodsName" value="">
                  <input type="hidden" name="Amt" value="">
                  <input type="hidden" name="BuyerName" value="">
                  <input type="hidden" name="BuyerTel" value="">
                  <input type="hidden" name="BuyerEmail" value="">
                  <input type="hidden" name="ResultYN" value="">
                  <input type="hidden" name="Moid" value="">
                  <input type="hidden" name="ReturnURL" value="">
                  <input type="hidden" name="MU_CD" value=""><%-- 여기부터 선택 파라미터--%>
                  <input type="hidden" name="MU_ID" value="">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script type="text/javascript" src="https://pg.innopay.co.kr/ipay/js/innopay-2.0.js" charset="utf-8"></script>
<script src="/resources/main/user/js/innopay/jquery.serialize-object.min.js"></script>
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

  $("#date_start").change(function() {
    let date = new Date();
    let year = date.getFullYear();
    let month = ("0" + (1 + date.getMonth())).slice(-2);
    let day = ("0" + date.getDate()).slice(-2);
    let today = year + "-" + month + "-" + day;
    let regist_type = $('input:radio[name="REGIST_FEE_TYPE"]:checked').val();
    let select_date = document.querySelector("#date_start").value;
    let end_date = document.querySelector("#date_end");

    let start_date = new Date(select_date);

    if(regist_type == "" || regist_type == null) {
      alert("구분을 선택해 주세요.");
      document.querySelector("#date_start").value = null;
    } else if(select_date < today) {
      alert("미래날짜를 선택해 주세요.");
      document.querySelector("#date_start").value = null;
      return false;
    } else {
      start_date.setDate(start_date.getDate() + 29);
      let year = start_date.getFullYear();
      let month = ("0" + (1 + start_date.getMonth())).slice(-2);
      let day = ("0" + start_date.getDate()).slice(-2);
      end_date.value = year+"-"+month+"-"+day;
      payCheck();
      maxDateSet();
      minDateSet();
    }
  });

  function maxDateSet() {
    let select_date = document.querySelector("#date_start").value;
    let start_date = new Date(select_date);
    start_date.setDate(start_date.getDate() + 58);
    let max_date_year =  start_date.getFullYear();
    let max_date_month = ("0" + (1 + start_date.getMonth())).slice(-2);
    let max_date_day = ("0" + start_date.getDate()).slice(-2);
    let max_date_set = max_date_year+"-"+max_date_month+"-"+max_date_day;
    $("#date_end").datepicker("option", "maxDate", max_date_set);
  }

  function minDateSet() {
    let select_date = document.querySelector("#date_start").value;
    let start_date = new Date(select_date);
    start_date.setDate(start_date.getDate() + 29);
    let min_date_year =  start_date.getFullYear();
    let min_date_month = ("0" + (1 +start_date.getMonth())).slice(-2);
    let min_date_day = ("0" + start_date.getDate()).slice(-2);
    let min_date_set = min_date_year+"-"+min_date_month+"-"+min_date_day;
    $("#date_end").datepicker("option", "minDate", min_date_set);
  }

  $("#date_end").change(function() {
    let select_date = document.querySelector("#date_start").value;
    let end_date = document.querySelector("#date_end").value;
    let diff_date = dateDiff(select_date, end_date);
    if(diff_date < 27 || diff_date > 59 ) {
      alert('30일 이상 59일 이하만 가능합니다.');
      document.querySelector("#date_end").value = null;
      return false;
    } else {
      payCheck();
    }
  });

  //// 날짜 일수 계산 함수
  function dateDiff(_date1, _date2) {
    let diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    let diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());

    let diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));

    return diff;
  }

  $(document).ready(function () {

    let REGIST_START_DATE = '${resultMap.REGIST_START_DATE}';

    //// 신규 등록으로 들어왔을 때 등원기간 셋팅
    if(REGIST_START_DATE == '' || REGIST_START_DATE == null) {

      let regDate = "${pageInfo.MU_REGIST_DATE}";
      let date = new Date();
      let start_year = date.getFullYear();
      let strat_month = ("0" + (1 + date.getMonth())).slice(-2);
      let start_day = ("0" + date.getDate()).slice(-2);
      let today = start_year + "-" + strat_month + "-" + start_day;

      document.querySelector("#date_start").value = today;

      let end_date = new Date(today);
      end_date.setDate(end_date.getDate() + 29);
      let end_year = end_date.getFullYear();
      let end_month = ("0" + (1 + end_date.getMonth())).slice(-2);
      let end_day = ("0" + end_date.getDate()).slice(-2);
      let farDay =  end_year+"-"+end_month+"-"+end_day;

      document.querySelector("#date_end").value = farDay;
    }

    //// 연장으로 들어왔을 때 등원기간 셋팅
    if(REGIST_START_DATE != '' && REGIST_START_DATE != null) {

      //// 등원 시작일
      let regDate = "${pageInfo.MU_REGIST_DATE}";
      let REGIST_END_DATE = '${resultMap.REGIST_END_DATE}';
      let date = new Date(REGIST_END_DATE);
       date.setDate(date.getDate()+1);
      let start_year = date.getFullYear();
      let strat_month = ("0" + (1 + date.getMonth())).slice(-2);
      let start_day = ("0" + date.getDate()).slice(-2);

      //// 등록 되어있던 등원 종료일 + 1
      let today = start_year + "-" + strat_month + "-" + start_day;

      document.querySelector("#date_start").value = today;

      //// 등원 종료일
      let end_date = new Date(today);
      end_date.setDate(end_date.getDate() + 29);
      let end_year = end_date.getFullYear();
      let end_month = ("0" + (1 + end_date.getMonth())).slice(-2);
      let end_day = ("0" + end_date.getDate()).slice(-2);
      let farDay =  end_year+"-"+end_month+"-"+end_day;

      document.querySelector("#date_end").value = farDay;
      $("#regist_test_first").val("${resultMap.REGIST_TEST_FIRST}");
      $("#regist_test_second").val("${resultMap.REGIST_TEST_SECOND}");

      feeList();
      payCheck();
    }


    $("input:radio[name=REGIST_FEE_TYPE]").click(function () {
      document.querySelector("#date_start").value = null;
      document.querySelector("#date_end").value = null;
    });
    minDateSet();
    maxDateSet();

  });


  function registCheck() {

    let regist_fee_type = $('input:radio[name="REGIST_FEE_TYPE"]:checked').val();
    let regist_type = $('input:radio[name="REGIST_TYPE"]:checked').val();
    let regist_phone_type = $('input:radio[name="REGIST_PHONE_TYPE"]:checked').val();
    let agree = $('input:radio[name="radioAgree"]:checked').val();
    let payType = $('input:radio[name="PAY_METHOD"]:checked').val();
    let regist_start_date = document.querySelector("#date_start").value;
    let regist_parent_phone = document.querySelector("#parent_phone").value;
    let regist_channel = document.querySelector("#regist_channel").value;
    let regist_exam = document.querySelector("#select_regist_exam").value;
    let regist_school = document.querySelector("#school_list").value;
    let regist_grade = document.querySelector("#regist_grade").value;
    let regist_seat = document.querySelector('#regist_seat').value;

    if(regist_channel == "" || regist_channel == null) {
      alert("지점을 선택해 주세요.");
      return false;
    }

    if(regist_fee_type == "" || regist_fee_type == null) {
      alert("구분을 선택해 주세요.");
      return false;
    }

    let type = document.querySelector("input[name='REGIST_FEE_TYPE']:checked").getAttribute('id');

    if(type != null && type != "" && type == "type_h_1") {

      if(regist_school == null || regist_school == "") {
        alert("학교를 선택해 주세요.");
        return false;
      }

      if(regist_grade == null || regist_grade == "") {
        alert("학년을 선택해 주세요.");
        return false;
      }
      document.querySelector('#student_check').value = 'Y';
    }

    if(type != null && type != "" && type == "type_h_2") {
      if(regist_exam == null || regist_exam == "") {
        alert("준비시험을 선택해 주세요.");
        return false;
      }
      document.querySelector('#student_check').value = 'N';
    }


    if(regist_start_date == "" || regist_start_date == null) {
      alert("등원기간을 선택해 주세요.");
      return false;
    }
    if (regist_phone_type == "" || regist_phone_type == null) {
      alert("연락처 구분을 선택해 주세요.");
      return false;
    }
    if (regist_parent_phone == "" || regist_parent_phone == null) {
      alert("연락처를 입력해 주세요.");
      return false;
    }
    if(regist_seat == "" || regist_seat == null) {
      alert("좌석을 선택해 주세요.");
      return false;
    }
    if (regist_type == "" || regist_type == null) {
      alert("등록 구분을 선택해 주세요.");
      return false;
    }

    if (agree != 'Y'){
      alert("환불규정에 동의해 주세요.");
      return false;
    }
    if (payType == null || payType =="") {
      alert("결제방법을 선택해 주세요.");
      return false;
    }



    return true;
  }

  function regist() {

    let params = $("form[name=formRegist]").serialize();

      $.ajax({
        type: "post",
        url: "/user/setting/registInsert.do",
        data: params,
        success: function (data) {
          if (data.success) {
            Alert.ok();
            location.href = "/user/setting/registList.do";
          } else {
            Alert.err();
          }
        }
      });
  }

  function payCheck () {
    let seat = document.querySelector("#regist_seat_front").value;
    if(seat == null || seat == "") {
      return false;
    }
    let params = $("form[name=formRegist]").serialize();
    let text = "";
    $.ajax({
      type: "post",
      url: "/user/setting/payCheck.do",
      data: params,
      success: function (data) {
        if (data.success) {
          if(data.afterSchoolFee > 0) {
            text += "<span> 종일반 : " + AddComma(data.allDayFee) + "원" + " X " + data.allDay + "일" + " = " + AddComma(data.allDay*data.allDayFee) + "원" + "</span>"
                    +"<span> 방과후반 : " + AddComma(data.afterSchoolFee) + "원" + " X " + data.afterSchool + "일" + " = " + AddComma(data.afterSchool*data.afterSchoolFee) + "원" + "</span>"
                    + "<span> 합계 : " + AddComma((data.afterSchool*data.afterSchoolFee+data.allDay*data.allDayFee)) + "원</span>";
            $("input[name=PAY_PRICE]").val(AddComma((data.afterSchool*data.afterSchoolFee+data.allDay*data.allDayFee)));

          } else {
            text += "<span> 종일반 : " + AddComma(data.allDayFee) + "원" + " X " + data.allDay + "일" + " = " + AddComma(data.allDay*data.allDayFee) + "원" + "</span>";
            $("input[name=PAY_PRICE]").val(AddComma((data.allDay*data.allDayFee)));
          }
          $("#div_pay").html(text);
        } else {
          Alert.err();
        }
      }
    });
  }

  //// 좌석 관리 모달 종료
  function seat_close() {
    $("#defaultPopBot").empty();
    $("#defaultPopBot").css('display', 'none');
    $("#sinmok").css('display', 'none');
    $("#omok").css('display', 'none');
    $("#seat_modal #room_list").empty();
    $('#seat_modal').removeClass('view');
    $('.seat_scroll').removeClass('typeScroll');
  }

  function room_check() {
    let START_DATE = document.querySelector("#date_start").value;
    let END_DATE = document.querySelector("#date_end").value;
    let CHANNEL_CODE = document.querySelector("#regist_channel").value;
    let REGIST_TYPE = $('input:radio[name="REGIST_FEE_TYPE"]:checked').val();
    let regist_school = document.querySelector("#school_list").value;
    let regist_grade = document.querySelector("#regist_grade").value;
    let regist_exam = document.querySelector("#select_regist_exam").value;

    if(CHANNEL_CODE == null || CHANNEL_CODE == "") {
      alert("지점을 선택해 주세요");
      return false;
    }

    if(REGIST_TYPE == null || REGIST_TYPE == "") {
      alert("구분을 선택해 주세요");
      return false;
    }

    let type = document.querySelector("input[name='REGIST_FEE_TYPE']:checked").getAttribute('id');

    if(type == 'type_h_1') {
      if(regist_school == null || regist_school == "") {
        alert("학교를 선택해 주세요.");
        return false;
      }

      if(regist_grade == null || regist_grade == "") {
        alert("학년을 선택해 주세요.");
        return false;
      }

    }

    if(type == 'type_h_2') {
      if(regist_exam == null || regist_exam == "") {
        alert("준비시험을 선택해 주세요.");
        return false;
      }
    }


    if(START_DATE == null || START_DATE == "") {
      alert("등원기간을 선택해 주세요");
      return false;
    }

    if(END_DATE == null || END_DATE == "") {
      alert("등원기간을 선택해 주세요");
      return false;
    }

    return true;
  }

  //// 좌석 팝업 내 좌석 선택
  function seatSelect(el) {
    let selected_room = document.querySelector("#room_list").value;
    let seat = el.getElementsByTagName("span")[0].innerText;
    let class_name = el.getElementsByTagName("span")[0].className;
    let seq = el.getAttribute("id");
    let gender = document.querySelector("#MU_GENDER").value;

    if(class_name.indexOf("numG") > 0 && gender == 'M') {
      alert("여학생 좌석입니다.");
      return false;
    }

    if(class_name.indexOf("numB") > 0 && gender == 'F') {
      alert("남학생 좌석입니다.");
      return false;
    }

    if(class_name.indexOf("status_N") > 0 ){
      alert("사용불가인 좌석입니다.");
      return false;
    }

    if(seat == '사용중') {
      alert("이미 사용중인 좌석입니다.");
      return false;
    }

    let check = confirm(seat+"번 좌석을 선택하시겠습니까?");
    if(check) {
      document.querySelector("#regist_room").value = selected_room;
      document.querySelector("#regist_seat").value = seq;
      document.querySelector("#regist_seat_front").value = seat;
      seat_close();
      payCheck();
    }
  }

  //// 등록 페이지 좌석 선택 버튼
  function room_list() {
    let check = room_check();
    if(check) {
      let CHANNEL_CODE = document.querySelector("#regist_channel").value;
      $.ajax({
        type: "post",
        url: "/user/setting/registRoomList.do",
        data: "CHANNEL_CODE=" + CHANNEL_CODE,
        success: function (data) {
          if (data.success) {
            let text = ""
            text += "<option value='' selected=\"\">호/실 선택</option>\n";
            for (let i = 0; i < data.roomList.length; i++) {
              text += "<option value=" + data.roomList[i].ROOM_CODE + ">" + data.roomList[i].ROOM_NAME + "</option>";
            }
            $(".srch_box #room_list").append(text);
            room_select();
          } else {
            Alert.err();
          }
        }
      });
    }
  }

  //// 좌석 모달 내에 셀렉박스
  function room_select () {
    let code = $("#room_list option:selected").val();
    let SITE_MAP = "";
    if (code != null || code != "") {
      $.ajax({
        type: "post",
        url: "/user/setting/roomSiteMapCheck.do",
        data: "ROOM_CODE=" + code,
        success: function (data) {
          if (data.success) {
            if (data.ROOM_SITE_MAP != "" && data.ROOM_SITE_MAP != null) {
              SITE_MAP = data.ROOM_SITE_MAP;
            }
            seat_view(SITE_MAP);
          } else {
            Alert.err();
          }
        }
      });
    }
  }

  function seat_view(SITE_MAP) {

    let name = document.querySelector("#modal_room_name").value;
    let code =  $("#room_list option:selected").val();
    let start_date = document.querySelector("#date_start").value;
    let end_date = document.querySelector("#date_end").value;
    let selected_room=document.querySelector("#selected_room").value;
    $.ajax({
      type: "post",
      url: "/user/setting/registSeatList.do",
      data: "ROOM_CODE=" + code + "&REGIST_START_DATE="+start_date+"&REGIST_END_DATE="+end_date,
      success: function (data) {
        if(data.success) {
          showList(data.seatList, name, code, SITE_MAP);
        }else {
          Alert.err();
        }
      }
    });
  }

  function showList(data, name, code, site_map) {
    if(site_map != null && site_map != "") {
      $("#defaultPopBot").css('display', 'none');
      $('#'+site_map).css('display', 'flex');
      for (let item of data) {
        let tmpEl;
        tmpEl = document.getElementById(item.SEAT_SEQ);
        if(item.REGIST_MU_NAME != null && item.REGIST_MU_NAME != "") {
          tmpEl.getElementsByTagName("span")[0].innerHTML = '사용중';
        } else {
          tmpEl.getElementsByTagName("span")[0].innerHTML= item.SEAT_NAME;
        }

        if(item.SEAT_STATUS == 'N') {
          tmpEl.getElementsByTagName("span")[0].classList.add('status_N');
        }
      }
    } else {
      if(!data.length > 0) {
        $('#seat_modal').addClass('view');
        $("#sinmok").css('display', 'none');
        $("#omok").css('display', 'none');
        $("#defaultPopBot").empty();
      } else {
        let warpH = '';
        let text = '<div class="seatBox">';
        text += '<ul>';
        let total = '';
        $.each(data, function (index, item) {
          total = data.length+1;
          let status_name = "";
          let seat_name = "";
          if (item.REGIST_SEAT == null) {
            status_name = item.SEAT_STATUS;
            seat_name = item.SEAT_NAME;

          }else{
            status_name = "I";
            seat_name = "사용중";
          }

          text +=
                  '<li id="'+item.SEAT_SEQ+'" onclick="seatSelect(this); return false;">'
                  + '<a href="#">'+
                  '<span class="num status_'+status_name+'">'+seat_name+'</span>' +
                  '</a>' +
                  '</li>';
        })
        text += '</ul>';
        text += '</div>';
        $("#sinmok").css('display', 'none');
        $("#omok").css('display', 'none');
        $("#defaultPopBot").css("display", 'flex');
        $("#defaultPopBot").html(text);
        $("#defaultPopBot").ready(function() {
          $('#seat_modal').addClass('view');
          warpH = $('.pop_bot02').innerHeight();
          if(warpH > 500) {
            $('.seat_scroll').addClass('typeScroll');
          }
        })
      }
    }
  }

  /*    $("#datepicker_seat").change(function() {
          let select_date = document.querySelector("#datepicker_seat").value;
          let code = document.querySelector("#modal_room_code").value;
          let name = document.querySelector("#modal_room_name").value;
          seat_view(code, name, select_date);
      });*/

  function feeList() {
    let channel = document.querySelector("#regist_channel").value;
    let FEE_TYPE = '${resultMap.REGIST_FEE_TYPE}';
    let SCHOOL = '${resultMap.REGIST_MU_SCHOOL}';
    let GRADE = '${resultMap.REGIST_MU_GRADE}';
    let EXAM = '${resultMap.REGIST_EXAM}';
    let EXAM_DES = '${resultMap.REGIST_EXAM_DES}';
    $.ajax({
      type: "post",
      url: "/user/setting/feeList.do",
      data: "CHANNEL_CODE=" + channel,
      success: function (data) {
        if(data.success) {
          let text ="";
          for (let i = 0; i < data.list.length; i++) {
            if(data.list[i].FEE_EXC_SET == 'Y') {
              text += '<li id="fee_li1" data-id="cont1" class="">';
              text += '<label class="" for="type_h_1">';
              text += '<input id="type_h_1" onclick="joinTab04();" name="REGIST_FEE_TYPE" type="radio" value="'+data.list[i].FEE_CODE+'" class="">';
              text += '<span>'+data.list[i].FEE_NAME+'</span>';
              text += '</label></li>';
            } else {
              text += '<li id="fee_li2" data-id="cont2" class="">';
              text += '<label class="" for="type_h_2">';
              text += '<input id="type_h_2" onclick="joinTab04();" name="REGIST_FEE_TYPE" type="radio" value="'+data.list[i].FEE_CODE+'" class="" >';
              text += '<span>'+data.list[i].FEE_NAME+'</span>';
              text += '</label></li>';
            }
          }
          $(".chktab04 .clearfix").html(text);
          $('.chktabCon04').addClass('on');
          if(FEE_TYPE != null && FEE_TYPE != "") {
            $("input:radio[name='REGIST_FEE_TYPE']:input[value='"+FEE_TYPE+"']").attr('checked', true);
            joinTab05(SCHOOL, GRADE, EXAM, EXAM_DES);
          }

        }else {
          Alert.err();
        }
      }
    });
  }

  function innopayCheck() {

    if(!registCheck()) {
      return false;
    }

    let check = confirm("등록하시겠습니까?");
    if(check) {
      let frmRegist = document.formRegist;
      let frmINNOPAY = document.frmINNOPAY;
      let params = $("form[name=formRegist]").serializeObject();
      $.ajax({
        type       : 'post',
        url        : '/pay/order/orderTempProc.json',
        data       : JSON.stringify(params),
        dataType   : 'json',
        contentType: 'application/json; charset=utf-8',
        error      : function (xhr, status, error) {
          alert("관리자에게 1:1문의 바랍니다.");
        },
        success    : function (data) {
          if (!data.success) {
            alert(data.message);
            return;
          }
          frmINNOPAY.MU_CD.value=data.resultMap.MU_CD;
          frmINNOPAY.MU_ID.value=data.resultMap.MU_ID;
          frmINNOPAY.BuyerName.value=data.resultMap.BuyerName;
          frmINNOPAY.BuyerTel.value=data.resultMap.BuyerTel;
          frmINNOPAY.BuyerEmail.value=data.resultMap.BuyerEmail;
          frmINNOPAY.ResultYN.value=data.resultMap.ResultYN;
          frmINNOPAY.PayMethod.value=data.resultMap.PayMethod;
          frmINNOPAY.GoodsName.value=data.resultMap.GoodsName;
          frmINNOPAY.MID.value=data.resultMap.MID;
          frmINNOPAY.Moid.value=data.resultMap.Moid;

          // 테스트 금액
          frmINNOPAY.Amt.value=1000;
          // 실제 금액
          //frmINNOPAY.Amt.value=data.resultMap.Amt.toString().replace(",",'');

          frmINNOPAY.MerchantKey.value=data.resultMap.MerchantKey;
          frmRegist.PAY_CODE.value=data.resultMap.Moid;
          frmRegist.REGIST_PAY_TYPE.value=data.resultMap.PayMethod;

          /* if (isProd == "false_local") {
             frmINNOPAY.ReturnURL.value = 'http://${baseURL}:8080/shop/order/innopayProc.do?session_id=${resultMap.session_id}'; // local
          } else if (isProd == "false_cloud") {
            frmINNOPAY.ReturnURL.value = 'http://${baseURL}:8080/shop/order/innopayProc.do?session_id=${resultMap.session_id}'; // cloud
          } else if (isProd == "false") {
            frmINNOPAY.ReturnURL.value = 'http://${baseURL}:8080/shop/order/innopayProc.do?session_id=${resultMap.session_id}'; // local
          } else {
            frmINNOPAY.ReturnURL.value = 'https://${baseURL}/shop/order/innopayProc.do?session_id=${resultMap.session_id}';	// live
          }*/
          let SendPayForm_id = $("form[name=frmINNOPAY]").serializeObject();
          jsf__pay(SendPayForm_id);
        }
      });
    }
  }

  function jsf__pay(form) {
    try {
      innopay.goPay(form);
    } catch (e) {
      /* IE 에서 결제 정상종료시 throw로 스크립트 종료 */
    }
  }

  function innopay_result(data){

      let params = JSON.stringify(data);

      if(data.ResultCode == '3001' || data.ResultCode == '4000') {
          $.ajax({
              type: "post",
              url: "/pay/order/payInsert.do",
              data: params,
              dataType   : 'json',
              contentType: 'application/json; charset=utf-8',
              success: function (data) {
                  if(data.success) {
                    regist();

                  }else {
                      Alert.err();
                  }
              }
          });
      }
  }

  function joinTab05(SCHOOL, GRADE, EXAM, EXAM_DES){

    $(".chktab04 ul li").removeClass("on");
      $(".chktabCon").removeClass('on');
      $(".chktabCon04 .conBox").removeClass('on');
      if($("#type_h_1").prop("checked")) {
        $("#fee_li1").addClass('on');
        $("#cont1").addClass("on");
      }
      if($("#type_h_2").prop("checked")) {
        $("#fee_li2").addClass('on');
        $("#cont2").addClass("on");
      }
      $("#school_list").val(SCHOOL).prop('selected', true);
      $("#regist_grade").val(GRADE).prop('selected', true);
      $("#select_regist_exam").val(EXAM).prop('selected', true);
      $("#regist_exam_des").val(EXAM_DES);
  }

</script>


