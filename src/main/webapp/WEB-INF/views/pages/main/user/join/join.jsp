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
          <div class="logoTit joinTit">
            <p>목동 독학자습관리학원 와신상담독서실</p>
            <h1>
              <a href="/front/main/main.do" class="block">
                <img src="/resources/main/user/img/front/logo.png" alt="와신상담">
              </a>
            </h1>
          </div>
          <div class="login_wrap">
            <div class="login_field join_field">
              <div class="cont_tit"><span>회원가입</span></div>
              <form name="formMember" method="post" action="/common/member/agree.do" enctype="multipart/form-data">
                <input type="hidden" name="mb_chkID">
                <input type="hidden" name="member_type" value="U">
                <div class="cont_tb">
                  <div class="cont_td">
                    <div class="td_in">

                      <div class="cont_input">
                        <label for="wg_id">아이디</label>
                        <input name="mb_id" id="wg_id" type="text" value="" placeholder="아이디를 입력해주세요">
                        <span class="chk_error"></span>
                      </div>
                      <div class="cont_input">
                        <label for="wg_pw">비밀번호</label>
                        <input name="mb_pw" id="wg_pw" type="password" value="" maxlength="20" placeholder="띄어쓰기 없는 영문 대소문자, 숫자 포함 6자이상">
                        <div class="dan"><input name="mb_pw_chk" id="wg_pwR" type="password" value="" maxlength="20" placeholder="비밀번호를 한번 더 입력해 주세요."></div>
                      </div>

                      <%--<div class="profile_box profile_box2">
                        <div class="cont_btn">
                          <a href="#" class="btn" onclick="">아이디로 회원가입</a>
                        </div>
                      </div>--%>
                      <div class="agree_box">
                        <%--<div class="all clearfix">
                          <div class="chkboxA">
                            <label class="" for="all_agree" onclick="goCheckAgreeAll()">
                              <input id="all_agree" name="check_all_agree" type="checkbox" value="Y">
                              <span>전체 동의합니다.</span>
                            </label>

                          </div>
                        </div>--%>
                        <div class="dan">
                          <div class="all clearfix">
                            <div class="chkboxA">
                              <label class="" for="mb_uc_y">
                                <input id="mb_uc_y" class="check-all-item"  name="mb_uc" type="checkbox" value="N">
                                <span>개인정보 수집/이용에  동의합니다. <i class="red">(필수)</i></span>
                              </label>
                            </div>
                            <a href="#" onclick="agreeView(this); return false;">내용보기</a>
                          </div>
                          <div class="cont">
                            <p>
                              <span style="font-size:15px; font-weight: bold">[개인정보의 수집.이용 목적]</span>
                            </p>
                            <p style="font-size:13px; font-weight:400;">『목동와신상담학원』 지원 및 사후관리 관련 사항의 원활한 처리를 위해 귀하의 개인정보를 수집 등 처리합니다.</p>
                            <p>&nbsp;</p>
                            <p>
                              <span style="font-size:15px; font-weight: bold">[수집.이용하는 개인정보의 항목]</span>
                            </p>
                            <p style="font-size:13px; font-weight:400;">성명, 성별, 생년월일, 주소, 연락처</p>
                            <p>&nbsp;</p>
                            <p>
                              <span style="font-size:15px; font-weight: bold">[개인정보의 보유 및 이용기간]</span>
                            </p>
                            <p style="font-size:13px; font-weight:400;">수집한 개인정보는 관계법령 등의 규정에 의하여 기록·보존되고, 기간이 경과할 경우『개인정보보호법』등에서 정하는 바에 따라 파기됩니다.</p>
                            <p>&nbsp;</p>
                            <p>
                              <span style="font-size:15px; font-weight: bold">[개인정보 수집동의 거부]</span>
                            </p>
                            <p style="font-size:13px; font-weight:400;">귀하는 개인정보 수집 및 이용 동의를 거부할 수 있으며, 이 경우 동 코너를 통한『목동와신상담』지원 및 관련 활동이 제한됩니다.</p>
                            <%--${p2.doc_content}--%>
                          </div>
                        </div>
                      </div>
                      <div class="profile_box view profile_box1">
                        <div class="cont_btn">
                          <a href="#" class="btn" onclick="goMembers()">다음</a>
                        </div>
                      </div>
                      <div class="all_join">
                        <a href="/common/login.do" class="ko">로그인 바로가기</a>
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


  $(document).ready(function() {
   var mb_uc_y = document.getElementById("mb_uc_y");
    mb_uc_y.addEventListener("change" , checkbox);
  });

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

  let checkLoginId = function() {

    let frmM = document.formMember;
    let mb_id_chk = frmM.mb_id.value.trim();

    if(mb_id_chk == null || mb_id_chk == ""){
      alert("아이디를 입력해 주세요.");
      return false;
    }
    if (!/^[a-z0-9]{4,20}$/.test(mb_id_chk)) {
      alert("아이디는 영 소문자, 숫자 4~20자리로 입력해주세요.");
      return false;
    }

    if (mb_id_chk == "guest") {
      alert("사용할 수 없는 아이디입니다.");
      return false;
    }

    var result = false;
    $.ajax({
      type:"POST",
      url:"/common/member/check-login-id",
      contentType: "application/json",
      dataType:"json",
      data: JSON.stringify({
        memberId: document.querySelector('input[name=mb_id]').value.trim()
      }),
      async: false
    }).done(function(response){
      if(response.success)
        result = true;
    })
    if (!result) {
      alert('이미 가입된 아이디 입니다.');
      document.querySelector('input[name=mb_id]').focus();
      return false;
    }
    return true;
  }


  var checkPassword = function(){
    var frmM = document.formMember;
    var pass1 = frmM.mb_pw.value;
    var pass2 = frmM.mb_pw_chk.value;
    var regPass = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,25}$/;
    /*if(pass1.length < 6){
      alert("6자리 이상의 비밀번호를 입력해 주세요.");
      return false;
    }*/
    if(!regPass.test(pass1) || pass1.length < 6) {
      alert("비밀번호는 영문 대소문자, 숫자 포함 6자리 이상 입력해 주세요.");
      return false;
    }
    if(pass1 !== pass2){
      alert("비밀번호가 다릅니다.");
      return false;
    }
    return true;
  }

  var checkbox = function() {
    var mb_uc_y = $("input:checkbox[name=mb_uc]");
   if(mb_uc_y.is(":checked")) {
     mb_uc_y.val("Y");
   } else {
     mb_uc_y.val("N");
   }
  }


  function goMembers() {
    var mb_uc_y = document.getElementById("mb_uc_y");
    var frmM = document.formMember;
    if (!checkLoginId()) {
      return false;
    }
    if(!checkPassword()) {
      return false;
    }

    if(mb_uc_y.value != "Y") {
      alert("개인정보 수집/이용에 동의해 주세요.");
      return false;
    }

    var frmM = document.formMember;

    // $("input[name=member_type]").val(mbtype);

    frmM.submit();
  }

</script>


