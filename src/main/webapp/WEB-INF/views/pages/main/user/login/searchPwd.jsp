<%--
  Created by IntelliJ IDEA.
  User: lionet
  Date: 2022-01-12
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<div id="container">
  <section class="contents_wrap font_KR">

    <div class="cont_box">
      <div class="cont_inner cont_innerL">
        <div class="backLogin">
          <div class="logoTit">
            <p>목동 독학자습관리학원 와신상담독서실</p>
            <h1>
              <a href="/front/main" class="block">
                <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
              </a>
            </h1>
          </div>
          <div class="login_wrap">
            <div class="login_field srch_field">
              <div class="cont_tit"><span>비밀번호 찾기</span></div>
              <form name="frmSearchPWP" method="post" action="/common/member/searchEnd.do">
                <input type="text" id="managerId_fake" class="hidden" autocomplete="off">
                <input type="password" id="password_fake" class="hidden" autocomplete="off">
                <input type="hidden" name="stype" value="SPW">
                <input type="hidden" name="mb_mobile" id="mb_mobile" value="">
                <div class="cont_tb">
                  <div class="cont_td ">
                    <div class="join_tab">
                      <ul class="clearfix">
                        <li><a href="/front/login/searchID">아이디 찾기</a></li>
                        <li class="active"><a href="/front/login/searchPwd">비밀번호 찾기</a></li>
                      </ul>
                    </div>
                    <div class="td_txt">
                      <span>가입시 등록한 아이디를 입력하세요</span>
                    </div>
                    <div class="td_in">
                      <div class="cont_input">
                        <label for="mb_id">아이디</label>
                        <input type="text" name="mb_id1" id="mb_id1" class="hidden" autocomplete="off">
                        <input type="text" name="mb_id" id="mb_id" class="" maxlength="40" onkeyup="check_enter_key(event)">
                      </div>
                    </div>
                    <div class="cont_btn">
                      <a href="#" onclick="goSearchPwdP(); return false;">비밀번호 찾기</a>
                    </div>
                    <div class="all_join">
                      <a href="/front/login/login" class="ko">로그인 바로가기</a>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>


