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
    <%--<div class="bg-box">
      <img src="/resources/main/user/img/front/background-01.png" alt="">
      <img src="/resources/main/user/img/front/background-02.png" alt="">
    </div>--%>

    <div class="cont_box">
      <div class="cont_inner cont_innerL">
        <div class="backLogin">
          <div class="logoTit">
            <p>목동 독학자습관리학원 와신상담독서실</p>
            <h1>
              <a href="/front/main/main.do" class="block">
                <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
              </a>
            </h1>
          </div>
          <div class="login_wrap">
            <div class="login_field">
              <div class="cont_tit"><span>로그인</span></div>
              <form name="formLogin" method="post" action="/common/member/loginProc.do">
                <input type="text" id="managerId_fake" class="hidden" autocomplete="off">
                <input type="password" id="password_fake" class="hidden" autocomplete="off">
                <input type="hidden" name="mode" value="">
                <input type="hidden" name="ltype" value="F">
                <input type="hidden" name="rurl" value="">
                <input type="hidden" name="code" value="">
                <input type="hidden" name="rmode" value="">
                <div class="cont_tb">
                  <div class="cont_td">

                    <div class="td_in">
                      <div class="cont_input">
                        <label for="memberId">아이디을 입력해주세요.</label>
                        <input id="memberId" name="memberId" type="text">
                      </div>
                      <div class="cont_input">
                        <label for="password">비밀번호를 입력해주세요.</label>
                        <input name="memberPass" type="password" id="password">
                      </div>
                      <div class="cont_chk clearfix">
                        <div class="chkbox">
                          <label class="" for="idsave">
                            <input id="idsave" type="checkbox" value="Y" name="memSaveId">
                            <span>아이디 저장</span>
                          </label>
                        </div>
                        <div class="find_box">
                          <a href="/front/login/searchID">아이디/비밀번호 찾기</a>
                        </div>
                      </div>
                      <div class="cont_btn">
                        <a href="#" class="btn" onclick="chkLogin();return false;">로그인</a>
                      </div>
                      <div class="all_join">
                        <a href="/front/join/join" class="ko">회원가입</a>
                      </div>

                      <div class="err"></div>
                      <div class="m_find_box">
                        <a href="#">아이디 / 비밀번호 찾기</a>
                      </div>
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
<script>
    $(document).ready(function (){
        $('.cont_input input').focus(function() {
            $(this).parents('.cont_input').addClass('focus');
            $(this).addClass('focus');
        })
        $('.cont_input input').blur(function() {
            if ($(this).val() == "") {
                $(this).parents('.cont_input').removeClass('focus');
                $(this).removeClass('focus');
            }else {
                $(this).parents('.cont_input').addClass('focus');
                $(this).removeClass('focus');

            }
        });

      let memSaveId = getCookie("memSaveId");
      $("input[name='memberId']").val(memSaveId);

      if ($("input[name='memberId']").val() != "") {
        $("#idsave").attr("checked", true);
      }

      $("#idsave").change(function () {
        if ($("#idsave").is(":checked")) {
          let memSaveId = $("input[name='memberId']").val();
          setCookie("memSaveId", memSaveId, 7);
        } else {
          deleteCookie("memSaveId");
        }
      });
      $("input[name='memberId']").keyup(function () {
        if ($("#idsave").is(":checked")) {
          let memSaveId = $("input[name='memberId']").val();
          setCookie("memSaveId", memSaveId, 7);
        }
      });

      $(document).keydown(function(key) {
        let frm = document.formLogin;
        if (key.keyCode == 13) {
          frm.submit();
        }
      });
    });

    function checkbox_enter_key(evt) {
      if (evt.keyCode == 13) {
        if ($("#idsave").is(":checked")) {
          $("#idsave").prop("checked", false);
        } else {
          $("#idsave").prop("checked", true);
        }
      }
    }

    function setCookie(cookieName, value, exdays) {
      let exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);

      let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
      let expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
      cookieName = cookieName + '=';
      let cookieData = document.cookie;
      let start = cookieData.indexOf(cookieName);
      let cookieValue = '';
      if (start != -1) {
        start += cookieName.length;
        let end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
    }

  function chkLogin() {
    let frm = document.formLogin;
   if (s2_txt_is_empty(true, frm.memberId)) {
      alert("아이디를 입력하십시오.");
      return false;
    }
    if (s2_txt_is_empty(true, frm.memberPass)) {
      alert("비밀번호를 입력하십시오.");
      return false;
    }
    frm.submit();
  }
</script>


