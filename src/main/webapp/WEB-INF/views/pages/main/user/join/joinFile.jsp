<%--
  Created by IntelliJ IDEA.
  User: lionet
  Date: 2022-01-12
  Time: 오후 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="container">
  <section class="contents_wrap font_KR">
    <div class="cont_box">
      <div class="cont_inner cont_innerL">
        <div class="backLogin backJoin">
          <div class="logoTit joinTit">
            <p>목동 독학자습관리학원 와신상담독서실</p>
            <h1>
              <a href="/front/main" class="block">
                <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
              </a>
            </h1>
          </div>
          <div class="login_wrap join_wrap">
            <div class="login_field join_field">
              <div class="cont_tit"><span>회원가입 신청서</span></div>
              <form id = "formRegist"name="formMember" method="post" action="/common/member/regist.do" enctype="multipart/form-data">
                <%--<input type="hidden" name="mb_chkID"> --%>
                <input type="hidden" name="MB_TYPE" value="U">
                <div class="cont_tb">
                  <div class="cont_td">
                    <div class="td_in">
                      <div class="cont_input">
                        <label for="">이름</label>
                        <input name="MU_NAME" id="inputName" type="text" value="" placeholder="이름을 입력해 주세요">
                        <span class="chk_error"></span>
                      </div>
                      <div class="cont_input clearfix">
                        <div class="cont_input01">
                          <label for="">생년월일</label>
                          <input name="MU_BIRTH" id="inputBirth" type="text" value="" placeholder="YYYYMMDD" maxlength="8">
                        </div>
                        <div class="cont_input01">
                          <label for="">성별</label>
                          <div class="chkbox">
                            <label class="" for="genderM"><input id="genderM" name="MU_GENDER" type="radio" value="M" onclick="oneCheckbox(this)" >
                              <span>남</span>
                            </label>
                            <label class="" for="genderF"><input id="genderF" name="MU_GENDER" type="radio" value="F" onclick="oneCheckbox(this)" >
                              <span>여</span>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="cont_input">
                        <div class="wg_form">
                          <label for="inputZip">주소</label>
                          <div class="wg_input wg_add">
                            <div>
                              <input type="text" name="MU_ZIP" id="inputZip" value="" size="7" maxlength="7" readonly="">
                              <a href="#" onclick="zipCode()">우편번호</a>
                            </div>
                            <div>
                              <input name="MU_ADDRESS" id="inputAddress" value="" type="text" size="69" maxlength="100" readonly="">
                            </div>
                            <%--<div>
                              <input name="mb_address_rest" id="sample2_extraAddress" value="" type="text" size="69" maxlength="100" placeholder="상세주소">
                            </div>--%>
                          </div>
                        </div>
                      </div>
                      <div class="cont_input">
                        <label for="">휴대폰</label>
                        <div class="add_cert">
                          <input type="text" name="MU_PHONE" id="inputPhone" placeholder="-없이 숫자만 입력해주세요">
                        </div>
                      </div>
                      <div class="cont_input">
                        <label for="">이메일</label>
                        <div class="add_cert">
                          <input type="text" name="MU_EMAIL" id="inputEmail" placeholder="">
                        </div>
                      </div>
                      <div class="cont_input clearfix">
                        <label for="">외신상담 유입경로</label>
                        <input type="hidden" id="FUNNEL" name="MU_FUNNEL" value="I">
                        <div class="chktab03 chktab ">
                          <ul class="clearfix">
                            <li class="active">
                              <button type="button" onclick="funnelSelect('I')">
                                <span>인터넷검색어</span>
                              </button>
                            </li>
                            <li>
                              <button type="button" onclick="funnelSelect('F')">
                                <span>지인</span>
                              </button>
                            </li>
                          </ul>
                        </div>
                        <div class="chktabCon03 chktabCon">
                          <ul class="clearfix">
                            <li>
                              <div class="chkbox chkbox2">
                                <input name="MU_FUNNEL_DES" id="inputFunnel" type="text" value="">
                              </div>
                            </li>
                            <%--<li>
                              <div class="chkbox chkbox2">
                                <input name="MB_FUNNEL_DES" id="inputFunnelF" type="text" value="">
                              </div>
                            </li>--%>
                          </ul>
                        </div>
                      </div>

                      <div class="profile_box view profile_box1">
                        <div class="cont_btn">
                          <a href="#" class="btn" onclick="goRegister(); return false;">회원가입</a>
                        </div>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/resources/main/admin/js/ttcc/ttccLibrary.js"></script>
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
  });

  function oneCheckbox(a){
    var obj = document.getElementsByName("MB_GENDER");
    for(var i=0; i<obj.length; i++){
      if(obj[i] != a){
        obj[i].checked = false;
      }
    }
  }
  /*    function oneCheckboxL(a){
          var obj = document.getElementsByName("level");
          for(var i=0; i<obj.length; i++){
              if(obj[i] != a){
                  obj[i].checked = false;
              }
          }
      }*/
  function oneCheckboxS(a){
    var obj = document.getElementsByName("MB_EXAM_DES");
    for(var i=0; i<obj.length; i++){
      if(obj[i] != a){
        obj[i].checked = false;
      }
    }
  }

  ///// 우편번호 버튼클릭 이벤트
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

  //// 변수 선언
  let inputBirth = document.querySelector("#inputBirth");
  let inputPhone = document.querySelector("#inputPhone");
  let inputName = document.querySelector("#inputName");
  let inputAddress = document.querySelector("#inputAddress");
  let inputZip = document.querySelector("#inputZip");
  let inputFunnel = document.querySelector("#inputFunnel");



  ///// 한글만 입력 가능 기능
  function onlyKor(event) {
    let regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
    let v = $(this).val();
    if (regexp.test(v)) {
      alert("한글만 입력가능 합니다.");
      $(this).val(v.replace(regexp, ''));
    }
  }

  ///// 생년월일, 휴대폰 숫자만 입력 가능
  inputBirth.addEventListener("keyup", onlyNumber);
  inputPhone.addEventListener("keyup", onlyNumber);

  ///// 이름 한글만 입력 가능
  inputName.addEventListener("keyup", onlyKor);


  ///// 유입경로 선택 값 부여
  function funnelSelect(btn) {
    let funnel = document.getElementById("FUNNEL");
    if(btn === 'I') {
      funnel.value = 'I';
    }
    if(btn === 'F') {
      funnel.value = 'F';
    }

  }

  ///// 이름 입력 확인
  function nameCheck() {
    if(inputName.value == "" || inputName.value == null) {
      alert("이름을 입력해 주세요.");
      inputName.focus();
      return false;
    }
    return true;
  }

  ///// 생년월일 입력 확인
  function birthCheck() {
    if(inputBirth.value == "" || inputBirth.value == null) {
      alert("생년월일을 입력해 주세요.");
      inputBirth.focus();
      return false;
    }
    return true;
  }

  ///// 성별 체크 박스 확인
  function genderCheck() {
    if(!$("#genderM").prop("checked") && !$("#genderF").prop("checked")) {
      alert("성별을 선택해 주세요.");
      return false;
    }
    return true;
  }

  ///// 주소 확인
  function addressCheck() {
    if(inputAddress.value == "" || inputZip.value =="") {
      alert("주소를 입력해 주세요.");
      return false;
    }
    return true;
  }

  ///// 휴대폰 번호 확인
  function phoneCheck() {
    if(inputPhone.value == "") {
      alert("휴대폰 번호를 입력해 주세요.");
      inputPhone.focus();
      return false;
    }
    return true;
  }

  ///// 유입경로 확인
  function funnelCheck() {
    if(inputFunnel.value == "") {
      alert("와신상담 유입경로를 입력해 주세요.");
      return false;
    }
    return true;
  }

  function emailCheck(email) {
    let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if(email == "" || email == null) {
      alert("이메일을 입력해 주세요.");
      return false;
    }
    if(!reg.test(email)) {
      alert("이메일 형식을 확인해 주세요.");
      return false;
    }

    return true;
  }

  function goRegister() {
    let email = $("#inputEmail").val();

    if(!nameCheck()) {
      return false;
    }
    if(!birthCheck()) {
      return false;
    }
    if(!genderCheck()) {
      return false;
    }

    if(!addressCheck()) {
      return false;
    }
    if(!phoneCheck()) {
      return false;
    }

    if(!emailCheck(email)){
      return false;
    }

    if(!funnelCheck()) {
      return false;
    }

    let check = confirm("회원가입 하시겠습니까?");

    if(check) {
      let frm = document.formMember;
      frm.submit();
    }

  };

</script>
