<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
<!-- header -->
<header id="header">
  <form:form id="logoutForm" method="POST" action="/logout">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
      <sec:authentication property="principal.mbType" var="type"/>
      <input type="hidden" name="mb_type" value="${type}" />
    </sec:authorize>
  </form:form>
    <div class="header_until">
      <div class="headCon posiR">
        <div class="headCon_in posiR">
          <h1>
            <a href="/front/main/main.do">
              <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
            </a>
          </h1>
          <div id="navi" class="left_menu">
            <div class="nav_contents">
              <div class="nav_info">
                <span><img src="/resources/main/user/img/icon/user.png" alt=""></span>
                <span>김와신</span>
                <a href="#" onclick="navClose();">
                  <img src="/resources/main/user/img/icon/navClose.png" alt="">
                </a>
              </div>
              <div class="nav_menu">
                <ul class="clearfix">
                  <li>
                    <a href="/user/setting/registList.do">
                      <span>등록·연장관리</span>
                      <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="/user/setting/otherRegistList.do">
                      <span>타학원관리</span>
                      <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="/user/attendance/attendance.do">
                      <span>출석부</span>
                      <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="/user/profile/profile.do">
                      <span>프로필관리</span>
                      <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="#" onclick="document.getElementById('logoutForm').submit();">
                      <span>로그아웃</span>
                    </a>
                  </li>
                  <li class="two_nav">
                    <a href="#" class="view">
                      <span>블로그 바로가기</span>
                    </a>
                    <div class="two_list">
                      <ul class="clearfix">
                        <li>
                          <a href="#">
                            <span>고등학생 독학관리</span>
                            <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                          </a>
                        </li>
                        <li>
                          <a href="#">
                            <span>독학재수</span>
                            <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                          </a>
                        </li>
                        <li>
                          <a href="#">
                            <span>독학공무원</span>
                            <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                          </a>
                        </li>
                        <li>
                          <a href="#">
                            <span>수능 단과반</span>
                            <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                          </a>
                        </li>
                        <li>
                          <a href="#">
                            <span>지점</span>
                            <img src="/resources/main/user/img/icon/left_arrow.png" alt="">
                          </a>
                        </li>
                      </ul>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="head_info">
            <div class="infoL">
              <ul class="clearfix">
                <li>
                  <a href="/user/setting/registList.do">등록·연장관리</a>
                </li>
                <li>
                  <a href="/user/setting/otherRegistList.do">타학원관리</a>
                </li>
                <li>
                    <a href="/user/attendance/attendance.do">출석부</a>
                </li>
              </ul>
            </div>
            <div class="infoR">
              <a href="#">
                <img src="/resources/main/user/img/icon/user.png" alt="">
              </a>
              <div class="dropInfo">
                <ul>
                  <li>
                    <a href="/user/profile/profile.do">프로필 관리</a>
                  </li>
                  <li>
                    <a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="mobile_view">
              <a href="#" onclick="naView(1); return false">
                <img src="/resources/main/user/img/icon/leftMenu.png" alt="">
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
</header>
<!-- header -->
</sec:authorize>