<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ttcc
  Date: 2022-02-08
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
              <div class="cont_tit"><span>프로필 관리</span></div>
              <div class="login_field join_field">
                <div class="profile">
                  <div class="cont_tb">
                    <form id="form-register" name="frmMember" method="post" action="/user/profile/profileUpdate.do">
                    <div class="cont_td clearfix">
                      <%--<div class="view_profile">
                        <span class="v_img" id="box-profile">
                          <img src="/resources/main/user/img/icon/profile.png" alt="">
                        </span>
                        <label for="file-profile" class="v_profile">
                          <span>프로필 변경</span>
                          <input type="file" name="profile_image_file" id="file-profile">
                        </label>
                      </div>--%>
                      <div class="td_in">
                        <div class="cont_input">
                          <label for="wg_id">아이디</label>
                          <input name="MU_ID" id="wg_id" type="text" value="${member.MU_ID}" placeholder="아이디를 입력해주세요" readonly>
                          <span class="chk_error"></span>
                        </div>
                        <div class="cont_input">
                          <label class="none">비밀번호</label>
                          <div class="add_cert dan_j">
                            <input type="password" value="password" readonly="">
                            <a href="#" onclick="pwView(1); return false;">변경</a>
                          </div>
                        </div>
                        <div class="cont_input">
                          <label for="">이름</label>
                          <input name="MU_NAME" id="inputName" type="text" value="${member.MU_NAME}" placeholder="이름을 입력해주세요" maxlength="10">
                          <span class="chk_error"></span>
                        </div>
                        <div class="cont_input">
                          <label for="">생년월일</label>
                          <input name="MU_BIRTH" id="inputBirth" type="text" value="${member.MU_BIRTH}" placeholder="숫자 8자리 YYYYMMDD" maxlength="8">
                        </div>
                        <div class="cont_input">
                          <div class="wg_form">
                            <label for="inputZip">주소</label>
                            <div class="wg_input wg_add">
                              <div class="dan_j">
                                <input type="text" name="MU_ZIP" id="inputZip" value="${member.MU_ZIP}" size="7" maxlength="7" readonly="">
                                <a href="#" onclick="zipCode()">우편번호</a>
                              </div>
                              <div class="dan">
                                <input name="MU_ADDRESS" id="inputAddress" value="${member.MU_ADDRESS}" type="text" size="69" maxlength="100" readonly="">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="cont_input">
                          <label for="">휴대폰</label>
                          <div class="add_cert_p add_cert">
                            <input type="text" name="MU_PHONE" id="inputPhone" value="${member.MU_PHONE}" placeholder="-없이 입력해주세요">
                          </div>
                        </div>
                      </div>
                    </div>
                    </form>
                  </div>
                  <div class="record_btn">
                    <a href="#" class="btn_type01 m_r" onclick="goBack(); return false;">
                      <span>취소</span>
                    </a>
                    <a href="#" class="btn_type01" onclick="profileUpdate(); return false;">
                      <span>수정</span>
                    </a>
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
<div id="popup-pw" class="register_pop">
  <div class="register_box">
    <div class="register_form">
      <div class="register_fill">
        <div class="register_in">
          <div class="register_comment">
            <span class="tit">비밀번호 변경</span>
          </div>
          <div class="view_cont">
            <div class="view_in">
              <div class="inner_box">
                <div class="register_table register_table1 ">
                  <div class="dan">
                    <label>현재 비밀번호</label>
                    <input type="password" name="old_password" placeholder="비밀번호를 입력해주세요.">
                  </div>
                  <div class="dan">
                    <label>변경 비밀번호</label>
                    <input type="password" name="new_password" placeholder="띄어쓰기 없는 영문 대소문자, 숫자 포함 6자이상">
                  </div>
                  <div class="dan">
                    <label>변경 비밀번호 확인</label>
                    <input type="password" name="new_password_confirm" placeholder="변경된 비밀번호를 다시입력해주세요.">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="record_btn">
          <a href="#" class="btn_type01 m_r" onclick="pwBoxClose();">
            <span>취소</span>
          </a>
          <a href="#" class="btn_type01" onclick="passwordUpdate(); return false;">
            <span>설정</span>
          </a>
        </div>
        <div class="register_close">
          <a href="#" onclick="pwBoxClose();">닫기</a>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
<script>

  function goBack() {
    window.history.back();
  }

  let inputId = document.querySelector("#wg_id");
  let inputName = document.querySelector("#inputName");
  let inputBirth = document.querySelector("#inputBirth");
  let inputZip = document.querySelector("#inputZip");
  let inputAddress = document.querySelector("#inputAddress");
  let inputPhone = document.querySelector("#inputPhone");

  inputBirth.addEventListener("keyup", onlyNumber);
  inputPhone.addEventListener("keyup", onlyNumber);

  function zipCode() {
    daum.postcode.load(function () {
      new daum.Postcode({
        oncomplete: function (data) {
          let fullAddr = '';
          let extraAddr = '';
          if (data.userSelectedType === 'R') {
            fullAddr = data.roadAddress;
          } else {
            fullAddr = data.jibunAddress;
          }
          if (data.userSelectedType === 'R') {
            if (data.bname !== '') {
              extraAddr += data.bname;
            }
            if (data.buildingName !== '') {
              extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
            }
            fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
          }
          document.getElementById('inputZip').value = data.zonecode;
          document.getElementById('inputAddress').value = fullAddr;
        }
      }).open();
    });
  }

  function updateCheck() {

    if (inputId.value == null || inputId.value == "") {
      alert("아이디를 입력해 주세요.");
      return false;
    }

    if (inputName.value == null || inputName.value == "") {
      alert("이름을 입력해 주세요.");
      return false;
    }

    if (inputBirth.value == null || inputBirth.value == "") {
      alert("생년월일을 입력해 주세요.");
      return false;
    }

    if (inputZip.value == null || inputZip.value == "") {
      alert("우편번호를 입력해 주세요.");
      return false;
    }

    if (inputAddress.value == null || inputAddress.value == "") {
      alert("주소를 입력해 주세요.");
      return false;
    }

    if (inputPhone.value == null || inputPhone.value == "") {
      alert("휴대폰 번호를 입력해 주세요.");
      return false;
    }

    return true;
  }

  function profileUpdate() {

    if (!updateCheck()) {
      return false;
    }

    let check = confirm("저장하시겠습니까?");
    if(check) {
      let form = document.frmMember;
      form.submit();
    }
  }

  function checkPassword(){
    let newPassword = document.querySelector('#popup-pw input[name=new_password]').value;
    let newPasswordConfirm = document.querySelector('#popup-pw input[name=new_password_confirm]').value;

    if(newPassword.length < 6){
      alert("6자리 이상의 비밀번호를 입력해 주세요.");
      return false;
    }
    if(newPassword !== newPasswordConfirm){
      alert("비밀번호가 다릅니다.");
      return false;
    }
    return true;
  }

  function passwordUpdate() {
    let oldPassword = document.querySelector('#popup-pw input[name=old_password]').value;
    let newPassword = document.querySelector('#popup-pw input[name=new_password]').value;

    if(!checkPassword()) {
      return false;
    }

    if (confirm("비밀번호를 수정하시겠습니까?")) {
      $.ajax({
        type: "post",
        url: "/user/profile/userPasswordUpdate.do",
        data: "oriPassword="+oldPassword + "&newPassword="+newPassword,
      }).done(function (response) {
        if(response.success){
          pwBoxClose();
          alert("정상 처리되었습니다.");
        }else{
          alert(response.message);
        }
      })
    }
  }


 </script>
