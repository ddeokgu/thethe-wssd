<%--
  Created by IntelliJ IDEA.
  User: lionet
  Date: 2022-01-12
  Time: 오후 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="container" class="<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">containR</sec:authorize>">
  <section class="contents_wrap font_KR">
    <div class="bg-box clearfix">
      <div class="bg-box01">
        <img src="/resources/main/user/img/front/background-01.png" alt="">
      </div>
      <div class="bg-box01">
        <img src="/resources/main/user/img/front/background-02.png" alt="">
      </div>
    </div>
    <div class="cont_box">
      <div class="cont_inner">
        <div class="backL">
          <p>목동 독학자습관리학원 와신상담독서실</p>
          <div class="logoTit">
            <h1>
              <a href="#" class="block">
                <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
              </a>
            </h1>
          </div>
          <div class="info">
            <a href="/common/member/register.do" class="infoA">
              <span>회원가입</span>
            </a>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
             <a href="#" class="infoA" onclick="document.getElementById('logoutForm').submit();">
              <span>로그아웃</span>
            </a>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
            <a href="/common/login.do" class="infoA">
              <span>로그인</span>
            </a>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
            <a href="#" class="infoA">
              <span>타학원시간표</span>
            </a>
            </sec:authorize>
          </div>
          <div class="titxt">
            <span>최고의 학습환경과 철저한 관리를 통해</span>
            <span>최상의 결과를 만들어내고 있습니다.</span>
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
      </div>
    </div>
  </section>
</div>

